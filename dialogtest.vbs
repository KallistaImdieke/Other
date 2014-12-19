EMConnect ""

function dialog_library(dialog_name,return_variable_array)
'Clears array before a new dialog is called
Erase return_variable_array


'This is where you set the dialog parameters (height, width, title)
If dialog_name = "FIRST" then
	dlg_width  = 191
	dlg_height = 103
	dlg_title  = "First Dialog"
	'PREFILL DATA STARTS HERE
		return_variable_array(0) = "10101010" 'Should be pre-checked
  'PREFILL DATA ENDS HERE

ElseIf dialog_name = "SECOND" then
	dlg_width  = 148
	dlg_height = 110
	dlg_title  = "Second Dialog"
		'PREFILL DATA STARTS HERE
		return_variable_array(1) = 1 'Should be pre-checked
	'PREFILL DATA ENDS HERE
End If

'START OF DIALOG LIBRARY - DO NOT EDIT
BeginDialog global_dialog_library, 0, 0, dlg_width, dlg_height, dlg_title
  'START OF DIALOGS IN LIBRARY
	
	'---------------------------------'
	' RETURN ARRAY VALUE DEFFINITIONS '
	'---------------------------------'
	'
	' 0  - Case Number
	' 1  - HC Check
	' 2  -
	' 3  -
	' 4  -
	' 5  -
	' 6  -
	' 7  -
	' 8  -
	' 9  -
	' 10 -
	
	If dialog_name = "FIRST" then

		'Dialog - "FIRST" - Starts Here
	
		ButtonGroup ButtonPressed
			OkButton 27, 67, 50, 15
			CancelButton 90, 68, 50, 15
		Text 26, 17, 22, 9, "Case Number"
		EditBox 58, 18, 57, 11, return_variable_array(0)

		'Dialog - "First" - Ends Here
		
	ElseIf dialog_name = "SECOND" then
	  
		'Dialog - "SECOND" - Starts Here
		
		ButtonGroup ButtonPressed
			OkButton 7, 11, 50, 15
			CancelButton 61, 9, 50, 15
		CheckBox 24, 50, 50, 10, "HC Check", return_variable_array(1)

		'Dialog - "SECOND" - Ends Here
	
	End If
		
	Dialog global_dialog_library
		If buttonpressed = 0 then stopscript
		
	'END OF DIALOGS IN LIBRARY - NO EDITING AFTER THIS POINT
'END OF DIALOG LIBRARY - DO NOT EDIT		
EndDialog

end function

'This is needed. 100 is the Arrays "Length" I can explain this more if you would like
Dim return_variables(100)

'Example calling Dialog "First"
call dialog_library("FIRST", return_variables)

'Sets case_number for later use in the script
case_number = return_variables(0)

'Showing both values so you can see only what we set is returned
msgbox(return_variables(0) & return_variables(1))

'Example calling Dialog "Second"
call dialog_library("SECOND", return_variables)

'Showing both values so you can see only what we set is returned
msgbox(return_variables(0) & return_variables(1))

'Example Showing renaming variables within the script

'case_number = return_variables(0)
hc_check = return_variables(1)

if case_number <> "" then msgbox("Case Number: " & case_number)

'Converted check value to text just for fun lol
If hc_check = 1 then
	hc_check = "Yes"
ElseIf hc_check = 0 then
	hc_check = "No"
End IF

if hc_check <> "" then msgbox("HC Checked? " & hc_check)


Stopscript