#pragma once
#include "Combi2.h"
#include "Combi3.h"

namespace combi
{
	struct accomodation
	{
		short n;
		short m;
		short* sset;
		xcombination* cgen;
		permutation* pgen;
		accomodation(short n = 1, short m = 1);
		void reset();
		short getfirst();
		short getnext();
		short ntx(short i);
		unsigned __int64 na;
		unsigned __int64 count() const;
	};
}