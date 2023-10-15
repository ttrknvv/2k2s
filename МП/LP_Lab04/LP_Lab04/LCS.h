#pragma once

#include "stdafx.h"

// -- рекурсивное  вычисление длины LCS 
int lcs(
	int lenx,         // длина   последовательности  X   
	const char x[],   // последовательность X
	int leny,         // длина   последовательности  Y
	const char y[]    // последовательность Y
);

int lcsd(
	const char x[],  // последовательность X
	int size1,
	const char y[],  // последовательность  Y
	int size2,
	char z[]         // наибольшая общая подпоследовательность 
);

