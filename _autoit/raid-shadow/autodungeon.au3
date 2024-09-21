#include <util.au3>

While 1 = 1
	If FindItem("replay") Then
		SleepRnd(4000,5000)
		LeftClick()
		MouseMove($imgX + Random(90, 100), $imgY, Random(5,8))
	EndIf
	Sleep(100)
WEnd
