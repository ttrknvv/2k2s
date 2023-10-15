#include "Salesman.h"
#include "Combi4.h"

namespace salesman
{
	int sum(int x1, int x2)
	{
		return (x1 == INF || x2 == INF) ? INF : (x1 + x2);
	};
	int* firstpath(int n)
	{
		int* rc = new int[n + 1];
		rc[n] = 0;
		for (int i = 0; i < n; i++)
		{
			rc[i] = i;
		}
		return rc;
	}
	int* source(int n)
	{
		int* rc = new int[n + 1];
		rc[n] = 0;
		for (int i = 1; i < n; i++)
		{
			rc[i - 1] = i;
		}
		return rc;
	}
	void copypath(int n, int* r1, const int* r2)
	{
		for (int i = 0; i < n; i++)
		{
			r1[i] = r2[i];
		};
	};
	int distance(int n, int* r, const int* d)
	{
		int rc = 0;
		for (int i = 0; i < n - 1; i++)
		{
			rc = sum(rc, d[r[i + 1]]);
		}
		return sum(rc, d[r[n - 1] * n + 0]);
	}
	void indx(int n, int* r, const int* s, const short* ntx)
	{
		for (int i = 1; i < n; i++)
		{
			r[i] = s[ntx[i - 1]];
		}
	};
	int salesman(int n, const int* d, int* r)
	{
		int* s = source(n);
		int* b = firstpath(n);
		int rc = INF;
		int dist = 0;
		combi::permutation p(n - 1);
		int k = p.getfirst();
		while (k >= 0)
		{
			indx(n, b, s, p.sset);
			if ((dist = distance(n, b, d)) < rc)
			{
				rc = dist;
				copypath(n, r, b);
			}
			k = p.getnext();
		}
		return rc;
	}
}