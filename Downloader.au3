Func StartDownload()
	Global $Msg = ""
	Global $Todo[0]
	For $b = 1 to 6
		If GUICtrlRead($FormElement[$b][0]) = "1 chapter" Then
			If GUICtrlRead($FormElement[$b][1]) = "" Then
				$Msg &= "Pleas input chapter number to download for  " & $FormElement[$b][3] & @CRLF
			Else
				_ArrayAdd($Todo, $b & " " & GUICtrlRead($FormElement[$b][1]))
			EndIf
		ElseIf GUICtrlRead($FormElement[$b][0]) = "Chapter ranges" Then
			If GUICtrlRead($FormElement[$b][1]) = "" and GUICtrlRead($FormElement[$b][2]) = "" Then
				$Msg &= "Pleas input *FIRST* and *LAST* chapter number to download for  " & $FormElement[$b][3] & @CRLF
			ElseIf GUICtrlRead($FormElement[$b][1]) = "" Then
				$Msg &= "Pleas input *FIRST* chapter number to download for  " & $FormElement[$b][3] & @CRLF
			ElseIf GUICtrlRead($FormElement[$b][2]) = "" Then
				$Msg &= "Pleas input *LAST* chapter number to download for  " & $FormElement[$b][3] & @CRLF
			Else
				For $c = GUICtrlRead($FormElement[$b][1]) To GUICtrlRead($FormElement[$b][2])
					_ArrayAdd($Todo, $b & " " & $c)
				Next
			EndIf
		EndIf
	Next
	If $Msg <> "" Then 
		MsgBox(0, "", $Msg)
	Else
		;_ArrayDisplay($Todo)
		For $a = 0 to Ubound($Todo)-1
			DirCopy(@Scriptdir & "\files", $DownloadPath & "\files")
			ShellExecuteWait($DownloadPath & "\files\dl-manga.cmd", $Todo[$a], $DownloadPath & "\files")
			FileMove($DownloadPath & "\files\*.zip", $DownloadPath & "\*.zip")
			DirRemove($DownloadPath & "\files", 1)
		Next
	EndIf
EndFunc
