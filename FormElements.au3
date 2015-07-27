Local $FormElement[7][4]

$FormElement[1][3] = "Bleach"
$FormElement[2][3] = "Fairy Tail"
$FormElement[3][3] = "Naruto Gaiden The Seventh Hokage"
$FormElement[4][3] = "One Piece"
$FormElement[5][3] = "Shingeki no Kyojin"
$FormElement[6][3] = "Shingeki no Kyojin - Before the Fall"

Func GenFormDetail($a)
	Local $Top = 8+(32*$a)
	GUICtrlCreateLabel($FormElement[$a][3], 8, $Top, 185, 17)
	$FormElement[$a][0] = GUICtrlCreateCombo("No download", 200, $Top, 97, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1 chapter|Chapter ranges")
	$FormElement[$a][1] = GUICtrlCreateInput("", 304, $Top, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_WANTRETURN,$ES_NUMBER))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$FormElement[$a][2] = GUICtrlCreateInput("", 344, $Top, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_WANTRETURN,$ES_NUMBER))
	GUICtrlSetState(-1, $GUI_DISABLE)
EndFunc

Func FormElementToogler()
	For $a = 1 to 6
		If GUICtrlRead($FormElement[$a][0]) = "No Download" Then
			GUICtrlSetState($FormElement[$a][1], $GUI_DISABLE)
			GUICtrlSetState($FormElement[$a][2], $GUI_DISABLE)
		ElseIf GUICtrlRead($FormElement[$a][0]) = "1 chapter" Then
			GUICtrlSetState($FormElement[$a][1], $GUI_ENABLE)
			GUICtrlSetState($FormElement[$a][2], $GUI_DISABLE)
		Else 
			GUICtrlSetState($FormElement[$a][1], $GUI_ENABLE)
			GUICtrlSetState($FormElement[$a][2], $GUI_ENABLE)
		EndIf
	Next
EndFunc

