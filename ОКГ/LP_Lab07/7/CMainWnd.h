#pragma once
#include "resource.h"
#include "CMatrix.h"
#include <float.h> // DBL_MAX, DBL_MIN
#include <math.h>
#include <vector>

#include "LibGraph.h"
#include "LibSurface.h"


class CMainWnd : public CFrameWnd
{
private:
    CRect WinRect; // ������� � ����
    int Index;
    CMatrix PView;
    CMatrix PView2;
    CMenu menu;
    DECLARE_MESSAGE_MAP()
        int OnCreate(LPCREATESTRUCT);

public:
    CMainWnd::CMainWnd()
    {
        Create(NULL, L"lab 7", WS_OVERLAPPEDWINDOW, CRect(10, 10, 700, 700), NULL, NULL);
        Index = 0;
        PView.RedimMatrix(3);
        PView2.RedimMatrix(3);
        PView(0) = 10; PView(1) = 45; PView(2) = 50;
        PView2(0) = 15; PView2(1) = 35; PView2(2) = 65;
    }

    void OnPaint();
    void OnSize(UINT nType, int cx, int cy);
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags); //
    void OnDiffuseModel();
    void OnMirrorModel();
    void Exit();
};

BEGIN_MESSAGE_MAP(CMainWnd, CFrameWnd)
    ON_WM_CREATE()
    ON_WM_PAINT()
    ON_WM_KEYDOWN() //
    ON_WM_SIZE()
    ON_COMMAND(ID_SPHERE_DIFFUSE, OnDiffuseModel)
    ON_COMMAND(ID_SPHERE_MIRROR, OnMirrorModel)
    ON_COMMAND(ID_EXIT, Exit)
END_MESSAGE_MAP()
int CMainWnd::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
    if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
        return -1;
    menu.LoadMenu(IDR_MENU1); // ��������� ���� �� ����� �������
    SetMenu(&menu); // ���������� ����
    return 0;
}
void CMainWnd::OnSize(UINT nType, int cx, int cy)
{
    CWnd::OnSize(nType, cx, cy);
    WinRect.SetRect(0, cy - 300, 300, 0);
}


void CMainWnd::OnPaint()
{
    CPaintDC dc(this);
    if (Index == 1)  ///���
        DrawLightSphere(dc, 10, PView, PView2, WinRect, COLORREF(RGB(130, 250, 0)), 0);
    if (Index == 2)  ///����
        DrawLightSphere(dc, 10, PView, PView2, WinRect, COLORREF(RGB(255, 153, 0)), 1);
}
void CMainWnd::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    if ((Index == 1) || (Index == 2))
    {
        switch (nChar)
        {
        case VK_UP:
        {;
        double d = PView(2) - 3;
        double d2 = PView(2) - 3;
        if (d2 >= 0)PView(2) = d2;
        if (d >= 0)PView(2) = d;
        break;
        }
        case VK_DOWN:
        {
            double d = PView(2) + 3;
            if (d <= 180)
                PView(2) = d;
            double d2 = PView(2) + 3;
            if (d2 <= 180)PView(2) = d2;
            break;
        }
        case VK_LEFT:
        {
            double d = PView(1) - 3;
            if (d >= -180)
                PView(1) = d;
            else
                PView(1) = d + 360;
            double d2 = PView(1) - 3;
            if (d2 >= -180)
                PView(1) = d2;
            else
                PView(1) = d2 + 360;

            break;
        }
        case VK_RIGHT:
        {
            double d = PView(1) + 3;
            if (d <= 180)
                PView(1) = d;
            else
                PView(1) = d - 360;
            double d2 = PView(1) + 3;
            if (d2 <= 180)
                PView(1) = d2;
            else
                PView(1) = d2 - 360;
            break;
        }
        }
        Invalidate();
    }
    CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
}


void CMainWnd::OnDiffuseModel()
{
    Index = 1;
    Invalidate();
}
void CMainWnd::OnMirrorModel()
{
    Index = 2;
    Invalidate();
}
void CMainWnd::Exit()
{
    DestroyWindow();
}