#ifndef _SCHOOLBOOK_MULMOD_H
#define _SCHOOLBOOK_MULMOD_H

#include <stdint.h>
#include "params.h"


void schoolbook_sqrmod(uint32_t c[N+1], const uint32_t a[N], const uint32_t p[N], uint16_t pinv);

void schoolbook_mulmod(uint32_t c[N+1], const uint32_t a[N], const uint32_t b[N], const uint32_t p[N], uint16_t pinv);

void schoolbook_expmod(uint32_t c[N+1], const uint32_t a[N], const uint32_t b[N], const uint32_t p[N], uint16_t pinv,
                       const uint32_t rsqr[N], const uint32_t r[N], const uint32_t one[N]);

void schoolbook_expmod_public(uint32_t c[N+1], const uint32_t a[N], uint32_t b, const uint32_t p[N], uint16_t pinv,
                       const uint32_t rsqr[N], const uint32_t r[N], const uint32_t one[N]);

#endif