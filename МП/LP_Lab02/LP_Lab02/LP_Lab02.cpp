#include <iostream>
#include "stdafx.h"
#include <iomanip>
#include "Combi.h"
#include "Combi2.h"
#include "Combi3.h"
#include "Combi4.h"
#include "Salesman.h"
#include <windows.h>
#include "Auxil.h"

using namespace std;

#define N (sizeof(AA) / 2)
#define M 3
#define COUNT 10

int _tmain(int argc, _TCHAR* argv[])
{
    setlocale(LC_ALL, "rus");
    char AA[][2] = { "A", "B", "C", "D" };

    /////////////////////////////////////// 1 ЗАДАНИЕ //////////////////////////////////////////////

    cout << "--------------------------------------- 1 ЗАДАНИЕ ---------------------------------------";
    cout << endl << " - Генератор множества всех подмножеств - ";
    cout << endl << "Исходное множество: ";
    cout << " { ";
    for (int i = 0; i < sizeof(AA) / 2; i++)
    {
        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    }
    cout << " } ";
    cout << endl << "Генерация всех подмножеств ";
    combi::subset s1(sizeof(AA) / 2);
    int n = s1.getfirst();
    while (n >= 0)
    {
        cout << endl << " { ";
        for (int i = 0; i < n; i++)
        {
            cout << AA[s1.ntx(i)] << ((i < n - 1) ? ", " : " ");
        }
        cout << " } ";
        n = s1.getnext();
    };
    cout << endl << "всего: " << s1.count() << endl;
    system("pause");
    system("cls");

    /////////////////////////////////////// 2 ЗАДАНИЕ //////////////////////////////////////////////

    cout << "--------------------------------------- 2 ЗАДАНИЕ ---------------------------------------";
    cout << endl << " - Генератор множества всех подмножеств - ";
    cout << endl << "Исходное множество: ";
    cout << " { ";
    for (int i = 0; i < sizeof(AA) / 2; i++)
    {
        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    }
    cout << " } ";
    cout << endl << "Генерация сочетаний ";
    combi::xcombination xc(sizeof(AA) / 2, 3);
    cout << "из " << xc.n << " по " << xc.m;
    n = xc.getfirst();
    while (n >= 0)
    {
        cout << endl << xc.nc << ": { ";
        for (int i = 0; i < n; i++)
        {
            cout << AA[xc.ntx(i)] << ((i < n - 1) ? ", " : " ");
        }
        cout << "}";
        n = xc.getnext();
    };
    cout << endl << "всего: " << xc.count() << std::endl;
    system("pause");
    system("cls");

    /////////////////////////////////////// 3 ЗАДАНИЕ //////////////////////////////////////////////

    cout << "--------------------------------------- 3 ЗАДАНИЕ ---------------------------------------";
    cout << endl << " - Генератор множества всех подмножеств - ";
    cout << endl << "Исходное множество: ";
    cout << " { ";
    for (int i = 0; i < sizeof(AA) / 2; i++)
    {
        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    }
    cout << " } ";
    cout << endl << "Генерация перестановок ";
    combi::permutation p(sizeof(AA) / 2);
    n = p.getfirst();
    while (n >= 0)
    {
        cout << endl << setw(4) << p.np << " : { ";
        for (int i = 0; i < p.n; i++)
        {
            cout << AA[p.ntx(i)] << ((i < p.n - 1) ? ", " : " ");
        }
        cout << " }";
        n = p.getnext();
    }
    cout << endl << "всего : " << p.count() << endl;
    system("pause");
    system("cls");

    /////////////////////////////////////// 4 ЗАДАНИЕ //////////////////////////////////////////////

    cout << "--------------------------------------- 4 ЗАДАНИЕ ---------------------------------------";
    cout << endl << " - Генератор множества всех подмножеств - ";
    cout << endl << "Исходное множество: ";
    cout << " { ";
    for (int i = 0; i < sizeof(AA) / 2; i++)
    {
        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    }
    cout << " } ";
    cout << endl << "Генерация размещений из " << N << " по " << M;
    combi::accomodation s(N, M);
    n = s.getfirst();
    while (n >= 0)
    {
        cout << endl << setw(2) << s.na << ": { ";
        for (int i = 0; i < 3; i++)
        {
            cout << AA[s.ntx(i)] << ((i < n - 1) ? ", " : " ");
        }
        cout << " }";
        n = s.getnext();
    }
    cout << endl << "всего: " << s.count() << endl;
    system("pause");
    system("cls");

    /////////////////////////////////////// 5 ЗАДАНИЕ //////////////////////////////////////////////

    cout << "--------------------------------------- 5 ЗАДАНИЕ ---------------------------------------";
    int d[COUNT][COUNT];

    Auxil::start();

    for (int i = 0; i < COUNT; i++)
    {
        for (int j = 0; j < COUNT; j++)
        {
            d[i][j] = Auxil::iget(10, 300);
        }
    }

    for (int i = 0; i < 3; i++)
    {
        int k1 = Auxil::iget(0, 9);
        int k2 = Auxil::iget(0, 9);
        d[k1][k2] != INF ? d[k1][k2] = INF : i--;
    }

    int r[COUNT];
    int s2 = salesman::salesman(COUNT, (int*)d, r);
    cout << endl << "-- Задача коммивояжера --";
    cout << endl << "-- количество городов : " << COUNT;
    cout << endl << "-- матрица расстояний : ";
    for (int i = 0; i < COUNT; i++)
    {
        cout << endl;
        for (int j = 0; j < COUNT; j++)
        {
            if (d[i][j] != INF)
            {
                cout << setw(5) << d[i][j] << " ";
            }
            else
            {
                cout << setw(5) << "INF" << " ";
            }
        }
    }
    cout << endl << "-- оптимальный маршрут: ";
    for (int i = 0; i < COUNT; i++)
    {
        cout << r[i] << " --> ";
    }
    cout << 0;
    cout << endl << "-- длина маршрута : " << s2;
    cout << endl;
    system("pause");
    return 0;
}
