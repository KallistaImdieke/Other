'LOADING ROUTINE FUNCTIONS FROM GITHUB REPOSITORY---------------------------------------------------------------------------
url = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/master/MASTER%20FUNCTIONS%20LIBRARY.vbs"

SET req = CreateObject("Msxml2.XMLHttp.6.0") 'Creates an object to get a URL
req.open "GET", url, FALSE	'Attempts to open the URL
req.send 'Sends request

IF req.Status = 200 THEN	'200 means great success
	Set fso = CreateObject("Scripting.FileSystemObject") 'Creates an FSO
	Execute req.responseText 'Executes the script code
ELSE	'Error message, tells user to try to reach github.com, otherwise instructs to contact Veronica with details (and stops script).
	MsgBox "Something has gone wrong. The code stored on GitHub was not able to be reached." & vbCr &_
	vbCr & _
	"Before contacting Veronica Cary, please check to make sure you can load the main page at www.GitHub.com." & vbCr &_
	vbCr & _
	"If you can reach GitHub.com, but this script still does not work, ask an alpha user to contact Veronica Cary and provide the following information:" & vbCr &_
	vbTab & "- The name of the script you are running." & vbCr &_
	vbTab & "- Whether or not the script is ""erroring out"" for any other users." & vbCr &_
	vbTab & "- The name and email for an employee from your IT department," & vbCr & _
	vbTab & vbTab & "responsible for network issues." & vbCr &_
	vbTab & "- The URL indicated below (a screenshot should suffice)." & vbCr &_
	vbCr & _
	"Veronica will work with your IT department to try and solve this issue, if needed." & vbCr &_
	vbCr &_
	"URL: " & url
	script_end_procedure("Script ended due to error connecting to GitHub.")
END IF

EMConnect ""

all_workers = InputBox("Do you want to run this script for all of your entire county's REPT/ACTV?")
IF ucase(left(all_workers, 1)) = "N" THEN	
	DO
		x_number = InputBox("Please enter the 7-digit X number of the worker to check.")
	LOOP UNTIL (len(x_number) = 7 AND ucase(left(x_number, 1)) = "X)
END IF

IF ucase(left(all_workers, 1)) = "Y" THEN 


CALL navigate_to_screen("REPT", "USER")
PF5

rept_user_row = 7
DO
	EMReadScreen worker_number, 7, rept_user_row, 5
	worker_number = trim(worker_number)
	IF worker_number <> "" THEN worker_array = worker_array & worker_number & " "
	rept_user_row = rept_user_row + 1
	IF rept_user_row = 19 THEN
		rept_user_row = 7
		PF8
	END IF
	EMReadScreen last_page, 21, 24, 2
LOOP UNTIL worker_number = "" OR last_page = "THIS IS THE LAST PAGE"

worker_array = trim(worker_array)
worker_array = split(worker_array)

FOR EACH worker IN worker_array
	CALL navigate_to_screen("REPT", "ACTV")
	EMWriteScreen worker, 21, 13
	transmit

	CALL find_variable("User: ", current_user, 7)
	IF ucase(worker) = ucase(current_user) THEN PF7

	rept_actv_row = 7
	DO
		DO
			EMReadScreen last_page, 21, 24, 2
			EMReadScreen case_number, 8, rept_actv_row, 12
			case_number = trim(case_number)
			EMReadScreen snap_status, 1, rept_actv_row, 61
			EMReadScreen cash_status, 1, rept_actv_row, 54
			EMReadScreen cash_prog, 2, rept_actv_row, 51
			IF snap_status = "A" AND cash_status = "A" AND (cash_prog = "RC" OR cash_prog = "GA") THEN case_array = case_array & case_number & " "
			rept_actv_row = rept_actv_row + 1
		LOOP UNTIL rept_actv_row = 19
			PF8
			rept_actv_row = 7
	LOOP UNTIL case_number = "" OR last_page = "THIS IS THE LAST PAGE"
NEXT

case_array = trim(case_array)
case_array = split(case_array)

'navigates to ELIG to determine if RCA or GA has been correctly fiated into SNAP budget.
FOR EACH case_number IN case_array

		







