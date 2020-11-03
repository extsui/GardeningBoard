#include <M5Stack.h>
#include <ctype.h>
#include "PumpUtil.hpp"

void setup()
{
  M5.Lcd.begin();
  M5.Lcd.fillScreen( BLACK );
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.setTextColor(YELLOW);  
  M5.Lcd.setTextSize(2);

  M5.Lcd.fillScreen( BLACK );
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("Pump Start!");

  // UART
  Serial.begin(115200);

  // I2C
  Wire.begin();

  delay(3000);
  M5.Lcd.fillScreen( BLACK );
}

constexpr int ReceiveBufferSize = 256;

static uint8_t g_receiveBuffer[ReceiveBufferSize];
static int g_receiveBufferIndex = 0;

void loop()
{
  if (Serial.available()) {
    uint8_t data = Serial.read();
		g_receiveBuffer[g_receiveBufferIndex] = data;
		g_receiveBufferIndex++;

		if (data == '\n') {
			// コマンド確定
			g_receiveBuffer[g_receiveBufferIndex - 1] = '\0';
		  int result = ExecuteCommand(g_receiveBuffer);
      if (result == -1) {
        Serial.printf("Error! [%s]\n", g_receiveBuffer);
      }

      memset(g_receiveBuffer, 0, sizeof(g_receiveBuffer));
		  g_receiveBufferIndex = 0;
		}
	}

  // TODO: 受信回数、エラー回数の結果更新
  // ...
}

// 10 進数にした時の文字列長
int GetDigitLength(uint8_t value)
{
  if (value < 10) {
    return 1;
  } else if (value < 100) {
    return 2;
  } else {
    return 3;
  }
}

/**
 * I2C データ送信トランザクション
 * @param [in] data データ列
 * @param [in] length データサイズ
 * @return Wire.endTransmission() の戻り値をそのまま流用
 * - 0 : 成功
 * - 1 : データが長すぎて送信バッファに収まらない
 * - 2 : アドレスの送信時に受信されたNACK
 * - 3 : データの送信時に受信されたNACK
 * - 4 : その他のエラー
 */
int WireTransaction(const uint8_t *data, int length)
{
  assert(data != NULL);
  Wire.beginTransmission(data[0]);
  if (length >= 1) {
    Wire.write(&data[1], length - 1);
  }
  return Wire.endTransmission();
}

int ExecuteCommand(const uint8_t *command)
{
  if (command[0] == '@') {
    uint8_t array[16] = { 0 };
    int length = PumpUtil::ParseRawSendCommand((const char*)command, array, sizeof(array));
    if (length == -1) {
      Serial.printf("[RawSendCommand] Parse Error!\n");
      return -1;
    }

    int result = WireTransaction(array, length);
    
    // TORIAEZU: ログ出力すると処理が間に合わないので制限
    // 送信ログ
    // Serial.printf("[RawSendCommand] result = %d %s\n",
    //   result, (result == 0 ? "(success)" : "(failed)"));
    // for (int i = 0; i < length; i++) {
    //   Serial.printf(" %02x", array[i]);
    // }
    // Serial.printf("\n");
    Serial.printf("o");

    return 0;
  }

  // TODO: コマンド解析
  // テストサンプルコマンド
  // - "0 pattern 2 11 100 1" --> [ 0x00, 0x10, 0x02, 0x0b, 0x64, 0x01 ]
  // - "4 bright 3 8"         --> [ 0x04, 0x20, 0x03, 0x08 ]
  // - "7 bright 15"          --> [ 0x07, 0x21, 0x0F ] ★場合分けが面倒なので後回し★

  // 共通
  uint8_t addr = 0;
  uint8_t commandId = 0;
  uint8_t brickId = 0;

  // pattern
  uint8_t patternId = 0;
  uint8_t timing = 0;
  uint8_t isRepeat = 0;

  // brick
  uint8_t brightness = 0;

  // ツールからの受信を想定しているので過度のエラーチェックは不要
  char *str = (char*)command;
  int pos = 0;
  addr = (str[pos] - '0');
  pos += 1 + 1;

  if (strncmp(&str[pos], "pattern", 7) == 0) {
    commandId = 0x10;
    pos += 7 + 1;

    brickId = str[pos] - '0';
    pos += 1 + 1;

    patternId = atoi(&str[pos]);
    pos += GetDigitLength(patternId) + 1;

    timing = atoi(&str[pos]);
    pos += GetDigitLength(timing) + 1;

    isRepeat = str[pos] - '0';
    pos += 1;

    Serial.printf("addr      = 0x%02x\n", addr);
    Serial.printf("commandId = 0x%02x\n", commandId);
    Serial.printf("brickId   = 0x%02x\n", brickId);
    Serial.printf("patternId = 0x%02x\n", patternId);
    Serial.printf("timing    = 0x%02x\n", timing);
    Serial.printf("isRepeat  = 0x%02x\n", isRepeat);

    if (str[pos] != '\0') {
      return -1;
    }

  } else if (strncmp(&str[pos], "bright", 6) == 0) {
    commandId = 0x20;
    pos += 6 + 1;

    brickId = str[pos] - '0';
    pos += 1 + 1;

    brightness = atoi(&str[pos]);
    pos += GetDigitLength(brightness);

    Serial.printf("addr       = 0x%02x\n", addr);
    Serial.printf("commandId  = 0x%02x\n", commandId);
    Serial.printf("brickId    = 0x%02x\n", brickId);
    Serial.printf("brightness = 0x%02x\n", brightness);

    if (str[pos] != '\0') {
      return -1;
    }

  } else {
    return -1;
  }

  // 解析成功
  switch (commandId) {
    case 0x10:
      Serial.printf("[ 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x ]\n",
        addr, commandId, brickId, patternId, timing, isRepeat);
      Wire.beginTransmission(addr);
      Wire.write(commandId);
      Wire.write(brickId);
      Wire.write(patternId);
      Wire.write(timing);
      Wire.write(isRepeat);
      Wire.endTransmission();
      break;

    case 0x20:
      Serial.printf("[ 0x%02x 0x%02x 0x%02x 0x%02x ]\n",
        addr, commandId, brickId, brightness);
      Wire.beginTransmission(addr);
      Wire.write(commandId);
      Wire.write(brickId);
      Wire.write(brightness);
      Wire.endTransmission();
      break;

    default:
      return -1;
  }

  Serial.printf("[%s]\n", str);

  return 0;
}