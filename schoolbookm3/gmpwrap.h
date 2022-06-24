#ifndef _GMPWRAP_H
#define _GMPWRAP_H
#include <stdint.h>
#include "params.h"

void gmpmulmod(uint32_t cint[N], const uint32_t aint[N], const uint32_t bint[N],
               const uint32_t pint[N]);
void gmpmul(uint32_t cint[2*N], const uint32_t aint[N], const uint32_t bint[N]);

void gmpexpmod(uint32_t cint[N], const uint32_t aint[N], const uint32_t bint[N],
               const uint32_t pint[N]);

void gmpinvmod(uint32_t inv[Npad], const uint32_t p[N]);
void gmpneginvmod(uint32_t inv[Npad], const uint32_t p[N]);

void gmptomont(uint32_t dst[N], const uint32_t src[N], const uint32_t p[N]);

void gmpfrommont(uint32_t dst[N], const uint32_t src[N], const uint32_t p[N]);

void gmpgetrsqr(uint32_t dst[N], const uint32_t p[N]);
void gmpgetr(uint32_t dst[N], const uint32_t pint[N]);
void gmpmodp(uint32_t rint[N], const uint32_t pint[N]);
#endif
