#include "stdafx.h"
#include "Levenshtein.h"
#include "MultiMatrix.h" 
#include "LCS.h"
#include "Auxill.h"

#define N 6

int _tmain(int argc, _TCHAR* argv[])
{
    setlocale(LC_ALL, "rus");
    /// 1 задание сгенерировать 2 строки

    char x[300] = {};
    char y[200] = {};
    Auxil::start();
    for (int i = 0; i < 300; i++)
    {
        x[i] = (char)Auxil::iget(97, 122);
        i < 200 ? y[i] = (char)Auxil::iget(97, 122) : 1;
    }

    // 2 задание вычисление дистанции (расстояния) Левенштейна 

    clock_t t1 = 0, t2 = 0, t3, t4;
    int  lx = sizeof(x), ly = sizeof(y);
    std::cout << std::endl;

    int X_SIZE[] = { 4, 5, 6, 7, 10, 15, 15 }; // 1/70 1/60 1/50 1/40 1/30 1/20 1/19
    int Y_SIZE[] = { 2, 3, 4, 5, 7, 10, 11 };

    char S1[] = "Раб";
    char S2[] = "Барка";

    std::cout << S1 << " --> " << S2 << " = " << levenshtein_r(sizeof(S1) - 1, S1, sizeof(S2) - 1, S2);

    std::cout << std::endl << "-- расстояние Левенштейна -----" << std::endl;
    std::cout << std::endl << "--длина --- рекурсия -- дин.програм. ---"
        << std::endl;
    /*for (int i = 0; i < std::min(lx, ly); i++)
    {

        t1 = clock(); levenshtein_r(X_SIZE[i], x, Y_SIZE[i], y); t2 = clock();
        t3 = clock(); levenshtein(X_SIZE[i], x, Y_SIZE[i], y); t4 = clock();
        std::cout << std::right << std::setw(2) << X_SIZE[i] << "/" << std::setw(2) << Y_SIZE[i]
            << "        " << std::left << std::setw(10) << (t2 - t1)
            << "   " << std::setw(10) << (t4 - t3) << std::endl;
    }*/
    system("pause");

    //// 5-1 задание Решение задачи о расстановке скобок при перемножении матриц(рекурсия)

    //int Mc[N + 1] = { 5,10,15,20,25,30,35 }, Ms[N][N], r = 0, rd = 0;

    //memset(Ms, 0, sizeof(int) * N * N);
    //r = OptimalM(1, N, N, Mc, OPTIMALM_PARM(Ms));
    //setlocale(LC_ALL, "rus");
    //std::cout << std::endl;
    //std::cout << std::endl << "-- расстановка скобок (рекурсивное решение) "
    //    << std::endl;
    //std::cout << std::endl << "размерности матриц: ";
    //for (int i = 1; i <= N; i++) std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
    //std::cout << std::endl << "минимальное количество операций умножения: " << r;
    //std::cout << std::endl << std::endl << "матрица S" << std::endl;
    //for (int i = 0; i < N; i++)
    //{
    //    std::cout << std::endl;
    //    for (int j = 0; j < N; j++)  std::cout << Ms[i][j] << "  ";
    //}
    //std::cout << std::endl;

    //// 5-1 задание Решение задачи о расстановке скобок при перемножении матриц(ДП)
    //
    //memset(Ms, 0, sizeof(int) * N * N);
    //rd = OptimalMD(N, Mc, OPTIMALM_PARM(Ms));
    //std::cout << std::endl
    //    << "-- расстановка скобок (динамичеое программирование) " << std::endl;
    //std::cout << std::endl << "размерности матриц: ";
    //for (int i = 1; i <= N; i++)
    //    std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
    //std::cout << std::endl << "минимальное количество операций умножения: "
    //    << rd;
    //std::cout << std::endl << std::endl << "матрица S" << std::endl;
    //for (int i = 0; i < N; i++)
    //{
    //    std::cout << std::endl;
    //    for (int j = 0; j < N; j++)  std::cout << Ms[i][j] << "  ";
    //}
    //std::cout << std::endl << std::endl;
    //system("pause");

    // 5-2 Решение задачи вычисления длины наибольшей общей подпоследовательности - рекурсия

    char X[] = "BXWAFRE", Y[] = "XCDUFR";
    std::cout << std::endl << "-- вычисление длины LCS для X и Y(рекурсия)";
    std::cout << std::endl << "-- последовательность X: " << X;
    std::cout << std::endl << "-- последовательность Y: " << Y;
    int s = lcs(
        sizeof(X) - 1,  // длина   последовательности  X   
        X,       // последовательность X
        sizeof(Y) - 1,  // длина   последовательности  Y
        Y       // последовательность Y
    );
    std::cout << std::endl << "-- длина LCS: " << s << std::endl;
    system("pause");

    // 5-2 Решение задачи вычисления длины наибольшей общей подпоследовательности - ДП

    char z[100] = "";
    char x2[] = "BXWAFRE",
        y2[] = "XCDUFR";

    int l = lcsd(x2, strlen(x2), y2, strlen(y2), z);
    std::cout << std::endl
        << "-- наибольшая общая подпоследовательость - LCS(динамическое "
        << "программирование)" << std::endl;
    std::cout << std::endl << "последовательость X: " << x2;
    std::cout << std::endl << "последовательость Y: " << y2;
    std::cout << std::endl << "                LCS: " << z;
    std::cout << std::endl << "          длина LCS: " << l;
    std::cout << std::endl;

    std::cout << "----- Сравнительный пример --------" << std::endl;
    std::cout << std::setw(5) << std::right << "k" << std::setw(20) << "Рекурсия" << std::setw(15) << std::right << "ДП" << std::endl;
    int sizes1[] = {5, 6, 8, 10, 15, 17, 20}; // 60 50 40 30 20 17 15
    int sizes2[] = {3, 4, 5, 7, 10, 11, 13};
    for (int i = 0; i < 7; i++)
    {
        std::cout << std::setw(3) << sizes1[i] << " / " << std::setw(3) << sizes2[i];
        t1 = clock();
         int s2 = lcs(
            sizes1[i],  // длина   последовательности  X   
            x,       // последовательность X
            sizes2[i],  // длина   последовательности  Y
            y       // последовательность Y
        );
         t2 = clock();
         t3 = clock();
         int l2 = lcsd(x, sizes1[i], y, sizes2[i], z);
         t4 = clock();
         std::cout << std::setw(15) << std::right << (t2 - t1) << std::setw(15) << std::right << (t4 - t3) << std::endl;
    }


    return 0;
}
