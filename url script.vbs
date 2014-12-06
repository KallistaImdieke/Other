name_of_script = "Scripty Script"
start_timer = timer

url_array = Array("https://raw.githubusercontent.com/RobertFewins-Kalb/Testing-Stuff/master/message.vbs", _
	"https://raw.githubusercontent.com/theVKC/GH-Test/master/MsgBox-V.vbs")

FOR EACH url IN url_array
	Set req = CreateObject("Msxml2.XMLHttp.6.0")
	req.open "GET", url, False
	req.send
	If req.Status = 200 Then
		Set fso = CreateObject("Scripting.FileSystemObject")
		Execute req.responseText
	End IF
NEXT

'script_end_procedure("")