name_of_script = "NOTE - Client Contact"
start_timer = timer

url_array = Array("https://raw.githubusercontent.com/RobertFewins-Kalb/DHS-MAXIS-Scripts/master/Script%20Files/FUNCTIONS%20FILE.vbs", _	'LOADS THE FUNCTIONS FILE
			"https://raw.githubusercontent.com/theVKC/GH-Test/master/MsgBox-V.vbs")									'LOADS THE SPECIFIC SCRIPT

FOR EACH url IN url_array
	Set req = CreateObject("Msxml2.XMLHttp.6.0")
	req.open "GET", url, False
	req.send
	If req.Status = 200 Then
		Set fso = CreateObject("Scripting.FileSystemObject")
		Execute req.responseText
	End IF
NEXT

script_end_procedure("")