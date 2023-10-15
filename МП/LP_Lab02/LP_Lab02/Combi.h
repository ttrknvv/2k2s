#pragma once
namespace combi
{
	struct subset
	{
		short n;
		short sn;
		short* sset;
		unsigned __int64 mask;
		subset(short n = 1);
		short getfirst();
		short getnext();
		short ntx(short i);
		unsigned __int64 count();
		void reset();
	};
}