#pragma once
namespace combi
{
	struct xcombination
	{
		short n;
		short m;
		short* sset;
		xcombination(short n = 1, short m = 1);
		void reset();
		short getfirst();
		short getnext();
		short ntx(short i);
		unsigned __int64 nc;
		unsigned __int64 count() const;
	};
}