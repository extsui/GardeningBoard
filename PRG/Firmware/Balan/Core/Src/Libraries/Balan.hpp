#ifndef BALAN_HPP
#define BALAN_HPP

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

#endif /* BALAN_HPP */
