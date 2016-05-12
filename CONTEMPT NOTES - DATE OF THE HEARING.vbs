'GATHERING STATS----------------------------------------------------------------------------------------------------
name_of_script = "CONTEMPT NOTES - DATE OF THE HEARING.vbs"
start_time = timer

'LOADING ROUTINE FUNCTIONS (FOR PRISM)---------------------------------------------------------------
Dim URL, REQ, FSO					'Declares variables to be good to option explicit users
If beta_agency = "" then 			'For scriptwriters only
	url = "https://raw.githubusercontent.com/MN-CS-Script-Team/PRISM-Scripts/master/Shared%20Functions%20Library/PRISM%20Functions%20Library.vbs"
ElseIf beta_agency = True then		'For beta agencies and testers
	url = "https://raw.githubusercontent.com/MN-CS-Script-Team/PRISM-Scripts/beta/Shared%20Functions%20Library/PRISM%20Functions%20Library.vbs"
Else								'For most users
	url = "https://raw.githubusercontent.com/MN-CS-Script-Team/PRISM-Scripts/release/Shared%20Functions%20Library/PRISM%20Functions%20Library.vbs"
End if
Set req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a URL
req.open "GET", url, False									'Attempts to open the URL
req.send													'Sends request
If req.Status = 200 Then									'200 means great success
	Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
	Execute req.responseText								'Executes the script code
ELSE														'Error message, tells user to try to reach github.com, otherwise instructs to contact Veronica with details (and stops script).
	MsgBox 	"Something has gone wrong. The code stored on GitHub was not able to be reached." & vbCr &_ 
			vbCr & _
			"Before contacting Robert Kalb, please check to make sure you can load the main page at www.GitHub.com." & vbCr &_
			vbCr & _
			"If you can reach GitHub.com, but this script still does not work, ask an alpha user to contact Robert Kalb and provide the following information:" & vbCr &_
			vbTab & "- The name of the script you are running." & vbCr &_
			vbTab & "- Whether or not the script is ""erroring out"" for any other users." & vbCr &_
			vbTab & "- The name and email for an employee from your IT department," & vbCr & _
			vbTab & vbTab & "responsible for network issues." & vbCr &_
			vbTab & "- The URL indicated below (a screenshot should suffice)." & vbCr &_
			vbCr & _
			"Robert will work with your IT department to try and solve this issue, if needed." & vbCr &_ 
			vbCr &_
			"URL: " & url
			StopScript
END IF

BeginDialog Contempt_Hearing_Note, 0, 0, 371, 350, "Contempt Hearing Note"
  Text 15, 10, 90, 10, "Type of Contempt Hearing"
  DropListBox 140, 5, 210, 15, "Initial Contempt"+chr(9)+"Evidentiary"+chr(9)+"Pay or Report"+chr(9)+"Mahady "+chr(9)+"Bail Hearing", Hearing_Type
  Text 15, 30, 160, 10, "District Court Judge / Child Support Magistrate"
  DropListBox 175, 30, 175, 15, "William F. Bannon"+chr(9)+"Kevin Holden"+chr(9)+"Daniel A. Tollefson"+chr(9)+"William J. Cashman"+chr(9)+"Kris Davick-Halfen"+chr(9)+"Frederick L. Grunke"+chr(9)+"Frank J. Kundrat"+chr(9)+"Vicki E. Landwehr"+chr(9)+"Mary B. Mahler"+chr(9)+"Andrew Pearson"+chr(9)+"John H. Scherer", Judge_list
  Text 15, 55, 55, 10, "County Attorney "
  DropListBox 15, 70, 145, 15, "Kirsten A. Simonds"+chr(9)+"Patrick M. Moen"+chr(9)+"Nathan S. Crowe", CAO_List
  Text 180, 55, 110, 10, "Child Support Officer"
  DropListBox 180, 70, 170, 15, "Jannell Boeckermann"+chr(9)+"Bonnie Brang"+chr(9)+"Michelle Brown "+chr(9)+"Jan Dingman"+chr(9)+"Laura Douiver"+chr(9)+"Kelli Gauthier"+chr(9)+"Kallista Imdieke"+chr(9)+"Melissa Kellen"+chr(9)+"Annette Kostreba"+chr(9)+"Tammy Larson"+chr(9)+"Jenn Latterell"+chr(9)+"April Miller"+chr(9)+"Carina Moore"+chr(9)+"Sara Moser"+chr(9)+"Marsha Nelson"+chr(9)+"Billie O'Brien"+chr(9)+"Lisa Popp"+chr(9)+"Jean Staneart"+chr(9)+"Janet Zachman ", CSO_List
  CheckBox 15, 105, 55, 10, "NCP Present ", NCP_Present
  Text 80, 105, 60, 10, " Represented by:"
  EditBox 145, 100, 210, 15, Represented_by
  CheckBox 15, 125, 50, 10, "CP Present", CP_Present
  Text 80, 125, 55, 10, "Represented by:"
  EditBox 145, 120, 210, 15, Represented_by
  Text 15, 145, 130, 10, "Total arrears on the date of the hearing"
  EditBox 160, 140, 195, 15, Total_arrears_on_the_hearing_date
  Text 15, 165, 115, 10, "Total arrears under the contempt:"
  EditBox 135, 160, 85, 15, Total_arrears_under_the_contempt
  Text 225, 165, 20, 10, "as of"
  EditBox 250, 160, 105, 15, as_of
  Text 15, 185, 70, 10, "Summary of Hearing:"
  EditBox 100, 185, 255, 15, Summary_of_Hearing
  Text 15, 215, 65, 10, "Next Steps for CSO:"
  EditBox 100, 210, 255, 15, Next_steps_for_CSO
  Text 15, 240, 95, 10, "Next hearing date and time:"
  EditBox 110, 235, 245, 15, Next_hearing_date_and_time
  Text 15, 260, 95, 10, "Signed Promise to Appear?"
  CheckBox 120, 260, 30, 10, "Yes", Check_Yes
  CheckBox 155, 260, 25, 10, "No", Check_No
  Text 15, 280, 45, 10, "Bail amount:"
  EditBox 75, 275, 85, 15, Bail_amount
  Text 170, 305, 65, 10, "Worker's Signature"
  EditBox 240, 300, 115, 15, Workers_Signature
  ButtonGroup ButtonPressed
    OkButton 245, 325, 50, 15
    CancelButton 305, 325, 50, 15
EndDialog


'case number dialog-
BeginDialog case_number_dialog, 0, 0, 176, 85, "Case number dialog"
  EditBox 60, 5, 75, 15, PRISM_case_number
  ButtonGroup ButtonPressed
    OkButton 70, 65, 50, 15
    CancelButton 125, 65, 50, 15
  Text 5, 10, 50, 10, "Case number:"
EndDialog


'Connecting to BlueZone
EMConnect ""

call PRISM_case_number_finder(PRISM_case_number)

'Case number display dialog
Do
	Dialog case_number_dialog
	If buttonpressed = 0 then stopscript
	call PRISM_case_number_validation(PRISM_case_number, case_number_valid)
	If case_number_valid = False then MsgBox "Your case number is not valid. Please make sure it uses the following format: ''XXXXXXXXXX-XX''"
Loop until case_number_valid = True



'Displays dialog for date of the hearing caad note and checks for information
Do
	Do
		Do
			Do 	
				Do
					Do	
						Do				
							'Shows dialog, validates that PRISM is up and not timed out, with transmit
							Dialog Contempt_Hearing_Note
							If buttonpressed = 0 then stopscript
							transmit
							EMReadScreen PRISM_check, 5, 1, 36
							If PRISM_check <> "PRISM" then MsgBox "You appear to have timed out, or are out of PRISM. Navigate to PRISM and try again."
						Loop until PRISM_check = "PRISM"
						'Makes sure worker enters in signature
						If Workers_Signature = "" then MsgBox "Sign your CAAD note"
					Loop until Workers_Signature <> ""
					'Makes sure worker selects Type of Contempt Hearing
					If Hearing_Type = "" or Hearing_Type = "Select Hearing Type:" then MsgBox "You must enter in a hearing type!"
				Loop until Hearing_Type <> "" and Hearing_Type <> "Select Hearing Type"
				'Makes sure worker select county attorney
				If CAO_List = "Select one:" then MsgBox "Please select a County Attorney"
			Loop until CAO_List <> "Select one:"			
			'Makes sure worker selects District Court Judge/Child Support Magistrate
			If Judge_list = "Select one:" then MsgBox "Please select a Judge/Magistrate"
		Loop until Judge_list <> "Select one:"
		'Makes sure worker selects CSO
		If CSO_List = "Select one:" then MsgBox "Please select a Child Support Officer"
	Loop until CSO_List <> "Select one:"
	'Makes sure worker provide hearing notes
	If Summary_of_Hearing = "" then MsgBox "Please enter hearing notes"
Loop until Summary_of_Hearing <> ""

'Going to CAAD note
call navigate_to_PRISM_screen("CAAD")

'Entering case number
call enter_PRISM_case_number(PRISM_case_number, 20, 8)


PF5					'Did this because you have to add a new note

EMWriteScreen "M3909", 4, 54  'adds correct caad code 

EMSetCursor 16, 4			'Because the cursor does not default to this location

call write_editbox_in_PRISM_case_note("Type of Contempt Hearing", Hearing_Type, 4) 
call write_editbox_in_PRISM_case_note("District Court Judge/Child Support Magistrate", Judge_List, 4)
call write_editbox_in_PRISM_case_note("County Attorney", CAO_list, 4)
call write_editbox_in_PRISM_case_note("Child Support Officer", CSO_List, 4)
if NCP_present = 1 then
	call write_new_line_in_PRISM_case_note("* NCP present")
	call write_editbox_in_PRISM_case_note("Represented by", NCP_Represented_by, 4)
else 
	call write_new_line_in_PRISM_case_note ("* NCP not present")
end if
if CP_present = 1 then
	call write_new_line_in_PRISM_case_note("* CP present")
	call write_editbox_in_PRISM_case_note("Represented by", CP_Represented_by, 4)
else 
	call write_new_line_in_PRISM_case_note ("* CP not present")
end if
call write_editbox_in_PRISM_case_note("Total arrears on the date of hearing", Total_arrears_on_the_hearing_date, 4)
call write_editbox_in_PRISM_case_note("Total arrears under the contempt", Total_arrears_under_the_contempt, 4)
call write_editbox_in_PRISM_case_note("Contempt arrears through:", as_of, 4)
call write_editbox_in_PRISM_case_note("Summary of Hearing", Summary_of_Hearing, 4)
call write_editbox_in_PRISM_case_note("Next Steps needed:", Next_steps_for_CSO, 4)
call write_editbox_in_PRISM_case_note("Next Hearing Date and Time", Next_hearing_date_and_time, 4)
If Check_Yes = 1 then
	call write_new_line_in_PRISM_case_note("NCP signed promise to appear")
else
If Check_No = 1 then
	call write_new_line_in_PRISM_case_note("NCP did not sign promise to appear")
end if
END IF
call write_editbox_in_PRISM_case_note("Bail amount", Bail_amount, 4)
call write_new_line_in_PRISM_case_note("---")	
call write_new_line_in_PRISM_case_note(worker_signature)

script_end_procedure("")
