#include "Fibonachi.h"

namespace FIB
{
	unsigned int Fibonachi(unsigned int n)
	{
		if (n == 1)
		{
			return 0;
		}
		if (n == 2)
		{
			return 1;
		}
		return Fibonachi(n - 1) + Fibonachi(n - 2);
	}
}