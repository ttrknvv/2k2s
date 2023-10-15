#include "commonF.h"

namespace common
{
	unsigned __int64 fact(unsigned __int64 x)
	{
		return (x == 0) ? 1 : (x * fact(x - 1));
	}
}
