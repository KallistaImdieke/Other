name_of_script = "NOTE - Client Contact"
start_timer = timer

Set req = CreateObject("Msxml2.XMLHttp.6.0")
req.open "GET", "https://raw.githubusercontent.com/RobertFewins-Kalb/GitSome-at-Home/master/NOTE%20-%20Client%20Contact.vbs", False
req.send
If req.Status = 200 Then
	Set fso = CreateObject("Scripting.FileSystemObject")
	Execute req.responseText
End IF

script_end_procedure("")