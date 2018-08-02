; Wickedness' Crosshair Script (September 8th, 2008)
; --------------------------------------------------
;
;    Modified by bcn_246 (January 9th, 2012)
;
;    http://www.autohotkey.com/forum/topic35517.html

sFile   := "1Crosshair.png"   ;Removed the 'C:\' (the image's default location is now wherever this script is located)

mDC_Scr   := Gdi_CreateCompatibleDC(0)
pToken   := Gdip_Startup()
pBitmap   := !hIcon ? Gdip_CreateBitmapFromFile(sFile) : Gdip_CreateBitmapFromHICON(hIcon)
nWidth   := Gdip_GetImageWidth( pBitmap)
nHeight   := Gdip_GetImageHeight(pBitmap)
hBitmap   := !hIcon ? Gdip_CreateHBITMAPFromBitmap(pBitmap) : Gdi_CreateDIBSection(mDC_Scr, nWidth, nHeight)
Gdip_DisposeImage(pBitmap)
Gdip_Shutdown(pToken)
oBitmap   := Gdi_SelectObject(mDC_Scr, hBitmap)
XPos := A_ScreenWidth/2-(nWidth/2)   ;Added to centre the crosshair
YPos := A_ScreenHeight/2-(nHeight/2)   ;Added to centre the crosshair

If   hIcon
   DllCall("DrawIconEx", "Uint", mDC_Scr, "int", 0, "int", 0, "Uint", hIcon, "int", nWidth, "int", nHeight, "Uint", 0, "Uint", 0, "Uint", 1|2)

Gui, +LastFound -Caption +E0x80000 +ToolWindow +AlwaysOnTop +E0x20   ;Added parameter (to prevent the cursor changing when over the crosshair)
DllCall("UpdateLayeredWindow", "Uint", WinExist(), "Uint", 0, "Uint", 0, "int64P", nWidth|nHeight<<32, "Uint", mDC_Scr, "int64P", 0, "Uint", 0, "UintP", 255<<16|1<<24, "Uint", 2)
Gui, Show, W%nWidth% H%nHeight% X%XPos% Y%YPos%, Crosshair   ;Added X and Y positions

Gdi_SelectObject(mDC_Scr, oBitmap)
Gdi_DeleteObject(hBitmap)
Gdi_DeleteDC(mDC_Scr)

Gdi_CreateDIBSection(hDC, nW, nH, bpp = 32, ByRef pBits = "")
{
   NumPut(VarSetCapacity(bi, 40, 0), bi)
   NumPut(nW, bi, 4)
   NumPut(nH, bi, 8)
   NumPut(bpp, NumPut(1, bi, 12, "UShort"), 0, "Ushort")

   Return   DllCall("gdi32\CreateDIBSection", "Uint", hDC, "Uint", &bi, "Uint", 0, "UintP", pBits, "Uint", 0, "Uint", 0)
}

Gdi_CreateCompatibleDC(hDC = 0)
{
   Return   DllCall("gdi32\CreateCompatibleDC", "Uint", hDC)
}

Gdi_SelectObject(hDC, hGdiObj)
{
   Return   DllCall("gdi32\SelectObject", "Uint", hDC, "Uint", hGdiObj)
}

Gdi_DeleteObject(hGdiObj)
{
   Return   DllCall("gdi32\DeleteObject", "Uint", hGdiObj)
}

Gdi_DeleteDC(hDC)
{
   Return   DllCall("gdi32\DeleteDC", "Uint", hDC)
}

Gdip_CreateBitmapFromFile(sFile)
{
   VarSetCapacity(wFile, 1023)
   DllCall("kernel32\MultiByteToWideChar", "Uint", 0, "Uint", 0, "Uint", &sFile, "int", -1, "Uint", &wFile, "int", 512)
   DllCall("gdiplus\GdipCreateBitmapFromFile", "Uint", &wFile, "UintP", pBitmap)
   Return   pBitmap
}

Gdip_CreateBitmapFromHICON(hIcon)
{
   DllCall("gdiplus\GdipCreateBitmapFromHICON", "Uint", hIcon, "UintP", pBitmap)
   Return   pBitmap
}

Gdip_CreateHBITMAPFromBitmap(pBitmap, ARGB = 0)
{
   DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "Uint", pBitmap, "UintP", hBitmap, "Uint", ARGB)
   Return   hBitmap
}

Gdip_DisposeImage(pImage)
{
   Return   DllCall("gdiplus\GdipDisposeImage", "Uint", pImage)
}

Gdip_GetImageWidth(pImage)
{
   DllCall("gdiplus\GdipGetImageWidth", "Uint", pImage, "UintP", nW)
   Return   nW
}

Gdip_GetImageHeight(pImage)
{
   DllCall("gdiplus\GdipGetImageHeight", "Uint", pImage, "UintP", nH)
   Return   nH
}

Gdip_Startup()
{
   If Not   DllCall("GetModuleHandle", "str", "gdiplus")
   DllCall("LoadLibrary"    , "str", "gdiplus")
   VarSetCapacity(si, 16, 0), si := Chr(1)
   DllCall("gdiplus\GdiplusStartup", "UintP", pToken, "Uint", &si, "Uint", 0)
   Return   pToken
}

Gdip_Shutdown(pToken)
{
   DllCall("gdiplus\GdiplusShutdown", "Uint", pToken)
   If   hModule :=   DllCall("GetModuleHandle", "str", "gdiplus")
         DllCall("FreeLibrary"    , "Uint", hModule)
   Return   0
}

; End of the script
