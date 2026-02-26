#ifndef TYPES_H
#define TYPES_H

#include <stdint.h>

typedef uint16_t u16;
typedef uint32_t u32;
typedef uint8_t u08;
typedef uint64_t u64;

typedef int8_t i08;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef float f32;
typedef double f64;

typedef union {
u32 data;
struct {
  u08 b;
  u08 g;
  u08 r;
  u08 a;
} c;
}argb32_t;

typedef struct {
  int x, y;
} vec2i;

typedef struct {
  float x, y;
}vec2f;

typedef struct {
  float x, y, z;
} vec3f;

typedef struct {
  int x, y, z;
} vec3i;

typedef struct {
  int w, x, y, z;
} vec4i;

typedef struct {
  float w, x, y, z;
} vec4f;
#endif

