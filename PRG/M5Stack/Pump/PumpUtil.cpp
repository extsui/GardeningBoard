#include "PumpUtil.hpp"
#include <cstdint>
#include <cassert>
#include <cstddef>
#include <string.h>

#if CONFIG_M5
#include <M5Stack.h>
#endif

//////////////////////////////////////////////////////////////////////
//  プラットフォーム非依存
//////////////////////////////////////////////////////////////////////
/**
 * 16 進表記の 2 文字を 1 バイトに変換する。
 * 成功した場合は outValue に変換後の値が代入される。
 * @return 0: 成功 / -1: 失敗
 */
int PumpUtil::ToHex(uint8_t *outValue, char hi, char lo)
{
    uint8_t h, l;

    assert(outValue != NULL);
    
    if (('a' <= hi) && (hi <= 'f')) {
        h = hi - 'a' + 10;
    } else if (('A' <= hi) && (hi <= 'F')) {
        h = hi - 'A' + 10;
    } else if (('0' <= hi) && (hi <= '9')) {
        h = hi - '0';
    } else {
        return -1;
    }
    
    if (('a' <= lo) && (lo <= 'f')) {
        l = lo - 'a' + 10;
    } else if (('A' <= lo) && (lo <= 'F')) {
        l = lo - 'A' + 10;
    } else if (('0' <= lo) && (lo <= '9')) {
        l = lo - '0';
    } else {
        return -1;
    }
    
    *outValue = (h << 4) | (l & 0x0F);
    return 0;
}

/**
 * 生データ送信コマンドを解析する。
 * @param [in] command 入力文字列
 * @param [out] array 解析結果を格納する配列
 * @param [in] arrayLength 配列の長さ
 * @return 成功: 解釈できたバイト数 / 失敗: -1
 * 
 * 例: "@send xxaabbccdd.." (16 進数表記固定、xx はアドレス、データは可変長)
 */
int PumpUtil::ParseRawSendCommand(const char *command, uint8_t *array, int arrayLength)
{
    int result = 0;
    const char *prefix = "@send ";
    const int prefixLength = strlen(prefix);

    assert(command != NULL);
    assert(array != NULL);
    if (strncmp(&command[0], prefix, prefixLength) != 0) {
        return -1;
    }

    // arrayLength を越えるか command が最後まで到達したら終了
    int readPos = prefixLength;
    int writePos = 0;
    while ((writePos < arrayLength) && (command[readPos] != '\0')) {
        result = ToHex(&array[writePos], command[readPos], command[readPos + 1]);
        if (result == -1) {
            return -1;
        }
        readPos += 2;
        writePos++;
    }

    return writePos;
}

/**
 * 生データ受信コマンドを解析する。(送信込み)
 * @param [in] command 入力文字列
 * @param [out] array 解析結果を格納する配列
 * @param [in] arrayLength 配列の長さ
 * @param [out] pOutReceiveCount 受信バイト数
 * @return 成功: 解釈できたバイト数(受信バイト数は含まない) / 失敗: -1
 * 
 * 例: "@recv xxaabb.. hh" (16 進数表記固定、xx はアドレス、送信データは可変長、hh は受信サイズ)
 * 
 * <S> <xx|r>[A] <aa>[A] <bb><A> <R> [00]<A> [01]<A>.. [nn]<N> <P>
 * 
 * <S>: Start Condition
 * <R>: Restart Condition
 * <P>: Stop Condition
 * [A]: Ack from Slave to Master
 * [n]: Data from Slave to Master
 * <A>: Ack from Master to Slave
 * <N>: Nack from Master to Slave
 */
int PumpUtil::ParseRawReceiveCommand(const char *command, uint8_t *array, int arrayLength, uint8_t *pOutReceiveCount)
{
    int result = 0;
    const char *prefix = "@recv ";
    const int prefixLength = strlen(prefix);

    assert(command != NULL);
    assert(array != NULL);
    assert(pOutReceiveCount != NULL);
    if (strncmp(&command[0], prefix, prefixLength) != 0) {
        return -1;
    }

    // arrayLength を越えるか command が最後まで到達したら終了
    int readPos = prefixLength;
    int writePos = 0;
    while ((writePos < arrayLength) && (command[readPos] != '\0') && (command[readPos] != ' ')) {
        result = ToHex(&array[writePos], command[readPos], command[readPos + 1]);
        if (result == -1) {
            return -1;
        }
        readPos += 2;
        writePos++;
    }

    // スペース
    if (command[readPos] != ' ') {
        return -2;
    }
    readPos++;

    // 受信バイト数の取得
    result = ToHex(pOutReceiveCount, command[readPos], command[readPos + 1]);
    if (result == -1) {
        return -3;
    }

    return writePos;
}

/**
 * 10 進数にした時の文字列長
 */
int PumpUtil::GetDigitLength(uint8_t value)
{
    if (value < 10) {
        return 1;
    } else if (value < 100) {
        return 2;
    } else {
        return 3;
    }
}

//////////////////////////////////////////////////////////////////////
//  M5Stack 依存
//////////////////////////////////////////////////////////////////////

#if CONFIG_M5
/**
 * I2C データ送信トランザクション
 * @param [in] data データ列
 * - data[0]            : I2C アドレス
 * - data[1 ~ length-1] : I2C 送信データ
 * @param [in] length データサイズ
 * @return Wire.endTransmission() の戻り値をそのまま流用
 * - 0 : 成功
 * - 1 : データが長すぎて送信バッファに収まらない
 * - 2 : アドレスの送信時に受信されたNACK
 * - 3 : データの送信時に受信されたNACK
 * - 4 : その他のエラー
 */
int PumpUtil::WriteTransaction(const uint8_t *data, int length)
{
    assert(data != NULL);
    Wire.beginTransmission(data[0]);
    if (length >= 1) {
        Wire.write(&data[1], length - 1);
    }
    return Wire.endTransmission();
}

/**
 * I2C データ受信トランザクション (送信含む)
 * 
 * TEST:
 * - DHT12 (M5Stack の台座付属) を接続したうえで以下を送信する
 *   - "@recv 5C00 05"
 *     (DHT12 から 5 Byte の応答があるハズ)
 * 
 * FIXME: 既知の不具合
 * - 存在しない I2C デバイスに対して投げるとフリーズする
 * - 送信データ 0 Byte 以降に動作不安定になる (例: "@recv 5C 05")
 * - 16 Byte 以上の受信を指定する (例: "@recv 5C00 11");
 */
int PumpUtil::ReceiveTransaction(const uint8_t *data, int length, uint8_t receiveCount, uint8_t *pOutReceiveData)
{
    assert(data != NULL);
    assert(receiveCount != 0);
    assert(pOutReceiveData != NULL);

    // 送信フェーズ
    Wire.beginTransmission(data[0]);
    if (length >= 1) {
        Wire.write(&data[1], length - 1);
    }
    int result = Wire.endTransmission(false);
    if (result != 0) {
        return result;
    }

    // 受信フェーズ
    Wire.requestFrom(data[0], receiveCount);
    while (Wire.available() < receiveCount);
    for (int i = 0; i < receiveCount; i++) {
        pOutReceiveData[i] = Wire.read();
    }
    return 0;
}

#endif
