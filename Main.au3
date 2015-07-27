#include <Array.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "FormElements.au3"
#include "Downloader.au3"


#Region ### START Koda GUI section ### Form=C:\Users\Administrator\Desktop\mangadownloader.kxf
$Form1 = GUICreate("Manga Downloader", 386, 258, -1, -1)
$MenuItem1 = GUICtrlCreateMenu("File")
$MenuItem2 = GUICtrlCreateMenuItem("Start Download", $MenuItem1)
$MenuItem3 = GUICtrlCreateMenuItem("Exit", $MenuItem1)

GUICtrlCreateLabel("Current download path : ", 8, 8, 185, 17)
Global $DownloadPath = @DesktopDir & "\Manga"
$DownloadPathInput = GUICtrlCreateInput($DownloadPath, 128, 8, 209, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Button1 = GUICtrlCreateButton("...", 343, 6, 35, 25)

For $a = 1 to 6
	GenFormDetail($a)
Next

GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			Exit

		Case $FormElement[1][0]
			FormElementToogler()

		Case $FormElement[2][0]
			FormElementToogler()

		Case $FormElement[3][0]
			FormElementToogler()

		Case $FormElement[4][0]
			FormElementToogler()

		Case $FormElement[5][0]
			FormElementToogler()

		Case $FormElement[6][0]
			FormElementToogler()

		Case $Button1
			$DownloadPathGet = FileSelectFolder("Choose a directory to save downloaded Manga. A sub directory called 'Manga' will be created", "")
			If $DownloadPathGet <> "" Then
				$DownloadPath = $DownloadPathGet & "\Manga"
			EndIf
			If $DownloadPath = "" Then
				Global $DownloadPath = @DesktopDir & "\Manga"
			EndIf
			GUICtrlSetData($DownloadPathInput, $DownloadPath)

		Case $MenuItem2
			If GUICtrlRead($FormElement[1][0]) = "No Download" and GUICtrlRead($FormElement[2][0]) = "No Download" and GUICtrlRead($FormElement[3][0]) = "No Download" and GUICtrlRead($FormElement[4][0]) = "No Download" and GUICtrlRead($FormElement[5][0]) = "No Download" and GUICtrlRead($FormElement[6][0]) = "No Download" Then
				MsgBox(0, "", "Nothing to do")
			Else
				DirCreate($DownloadPath)
				StartDownload()
			EndIf

		Case $MenuItem3
			MsgBox(0, "", "Will exit now")
			Exit

	EndSwitch
WEnd
