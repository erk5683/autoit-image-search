#include <util.au3>

While 1 = 1
	If FindItem("missingteam") Then
		SleepRnd(1500,2000)
	ElseIf FindItem("next") Then
		SleepRnd(500,1000)
		LeftClick()
		MouseMove($imgX + Random(90, 100), $imgY, Random(5,8))
	ElseIf FindItem("start") Then
		SleepRnd(500,1000)
		LeftClick()
		MouseMove($imgX + Random(90, 100), $imgY, Random(5,8))
	ElseIf FindItem("nextstory") Then
		LeftClick()
		MouseMove($imgX + Random(90, 100), $imgY, Random(5,8))
	EndIf
	Sleep(100)
WEnd