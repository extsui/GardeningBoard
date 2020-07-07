#ifndef TILE_HPP
#define TILE_HPP

#include "SoftwareI2c.hpp"

#define TILE_LED_NUM   (24)

/** 床の点灯パターン */
typedef enum {
  TILE_PATTERN_ALL_ON = 0,                  /**< 全点灯 */
  TILE_PATTERN_ALL_OFF,                     /**< 全消灯 */
  TILE_PATTERN_ONE_BY_ONE,                  /**< 1個ずつ */
  TILE_PATTERN_STREAM,                      /**< 小川 */
  TILE_PATTERN_NUM,
} TilePattern;

class Tile
{
public:
  Tile(uint8_t addr);
  /** 輝度設定(I2C通信有) */
  void config(uint8_t brightness);
  /** パターン設定 */
  int set(TilePattern pattern);
  /** 現在のパターンの長さ */
  int length();
  /** 現在のパターンを進める */
  void next();
  /** 表示更新(I2C通信有) */
  void update();
  /** テスト */
  void test();

private:
  SoftwareI2c *m_comm;
  /** I2Cアドレス */
  uint8_t m_addr;
  /** 現在の設定データ */
  uint8_t m_data[TILE_LED_NUM];
  /** 現在のパターンのインデックス */
  int m_pattern_index;
  /** 現在のパターンのフレームのインデックス */
  int m_frame_index;
};

#endif /* TILE_HPP */
