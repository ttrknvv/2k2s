#include <iostream>
#include <windows.h>
#include "Auxill.h"
#include <locale>
#include <ctime>
#include <tchar.h>

#include "Fibonachi.h"

#define CYCLE 10000000

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	double av1 = 0, av2 = 0;
	clock_t t1 = 0, t2 = 0;

	setlocale(LC_ALL, "rus");

	Auxil::start();
	t1 = clock();
	for (int i = 0; i < CYCLE; i++)
	{
		av1 += (double)Auxil::iget(-100, 100);
		av2 += Auxil::dget(-100, 100);
	}
	t2 = clock();

	cout << endl << "количество циклов:			" << CYCLE;
	cout << endl << "среднее значение (int):	" << av1 / CYCLE;
	cout << endl << "среднее значение(double):	" << av2 / CYCLE;
	cout << endl << "продолжительность (y. e.):		" << (t2 - t1);
	cout << endl << "(сек):		" << ((double)(t2 - t1) / (double)CLOCKS_PER_SEC);
	cout << endl;
	system("pause");

	t1 = clock();
	cout << "Число фибоначчи: " << FIB::Fibonachi(20);
	t2 = clock();

	cout << endl << "продолжительность (у. е.) " << (t2 - t1);
	cout << endl << "(сек) " << ((double)(t2 - t1) / (double)CLOCKS_PER_SEC) << endl;
	return 0;
}