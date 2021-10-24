#ifndef UTILS_H
#define UTILS_H

#include <Arduino.h>

#define LOG(...) Serial.printf(__VA_ARGS__)

static inline void ABORT_NO_MESSAGE() { while (1); }

#define ABORT() \
    LOG("Abort: file %s, line %d\n", __FILE__, __LINE__); \
    ABORT_NO_MESSAGE()

#define __ASSERT(expr, file, line)                  \
	LOG("Assertion failed: %s, file %s, line %d\n", \
		expr, file, line),                          \
	ABORT_NO_MESSAGE()

#define ASSERT(expr)                              \
    ((expr) ? ((void)0) :                         \
    (void)(__ASSERT(#expr, __FILE__, __LINE__)))

#endif /* UTILS_H */
