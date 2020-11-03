#ifndef BALAN_HPP
#define BALAN_HPP

#include "main.h"
#include <stdio.h>

// ITM 経由のデバッグログ出力
#define DEBUG_LOG(...)  printf(__VA_ARGS__)

static inline void ABORT() { while (1); }

#define __ASSERT(expr, file, line)                         \
	DEBUG_LOG("Assertion failed: %s, file %s, line %d\n",  \
		expr, file, line),                                 \
	ABORT()

#define ASSERT(expr)                              \
    ((expr) ? ((void)0) :                         \
    (void)(__ASSERT(#expr, __FILE__, __LINE__)))

static inline void DEBUG_LED_ON()
{
	HAL_GPIO_WritePin(DEBUG_LED_GPIO_Port, DEBUG_LED_Pin, GPIO_PIN_SET);
}

static inline void DEBUG_LED_OFF()
{
	HAL_GPIO_WritePin(DEBUG_LED_GPIO_Port, DEBUG_LED_Pin, GPIO_PIN_RESET);
}

uint32_t QueryCurrentHeapTop();

#endif /* BALAN_HPP */
