#ifndef _PARAMS_H
#define _PARAMS_H

// intmul stuff
#ifndef NBITS
// #define NBITS 2048
// #define NBITS 4096
#error "NBITS needs to be {2048,4096}"
#endif


#if NBITS == 2048
// NTT stuff
#define N    64 // NBITS / 32
#define Npad 66
#define Rbits (Npad*32)
#define NNN (3*128)
#define NNNpre (5*128)
#define NTT_LOGN 7

#define Q1 12289
#define Q2 65537
#define QQ (Q1*Q2)
#define CRT 45373 // Mod(Q1^-1, Q2)

#define NINVQ1 12193 // Mod(1/128, q1)
#define NINVQ2 65025 // Mod(1/128, q2)
#define EXP_WINDOWSIZE 6

#elif NBITS == 4096
#define N     128 // NBITS / 32
#define Npad  132
#define Rbits (Npad*32)
#define NNN (3*256)
#define NNNpre (5*256)
#define NTT_LOGN 8

#define Q1 25601
#define Q2 65537
#define QQ (Q1*Q2)
#define CRT 16806 // Mod(Q1^-1, Q2)
#define NINVQ1 25501 // Mod(1/256, q1)
#define NINVQ2 65281 // Mod(1/256, q2)
#define EXP_WINDOWSIZE 6

#endif

#endif
