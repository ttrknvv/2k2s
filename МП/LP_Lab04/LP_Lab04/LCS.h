#pragma once

#include "stdafx.h"

// -- �����������  ���������� ����� LCS 
int lcs(
	int lenx,         // �����   ������������������  X   
	const char x[],   // ������������������ X
	int leny,         // �����   ������������������  Y
	const char y[]    // ������������������ Y
);

int lcsd(
	const char x[],  // ������������������ X
	int size1,
	const char y[],  // ������������������  Y
	int size2,
	char z[]         // ���������� ����� ��������������������� 
);

