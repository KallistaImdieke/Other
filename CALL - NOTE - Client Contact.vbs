name_of_script = file_name
start_timer = timer

Set req = CreateObject("Msxml2.XMLHttp.6.0")
req.open "GET", raw_git_url, False
req.send
If req.Status = 200 Then
	Set fso = CreateObject("Scripting.FileSystemObject")
	Execute req.responseText
End IF

script_end_procedure("")
