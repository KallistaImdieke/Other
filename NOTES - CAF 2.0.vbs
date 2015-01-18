OPTION EXPLICIT

'DIMMING THE VARIABLES------------------------------------------------------------------------------------------------
DIM case_number
DIM ButtonPressed
DIM footer_month
DIM footer_year
DIM cash_check
DIM HC_check
DIM SNAP_check
DIM EMER_check
DIM CAF_type
DIM CAF_datestamp
DIM interview_type
DIM interview_date
DIM how_app_was_received
DIM HC_document_received
DIM HC_datestamp
DIM HH_comp
DIM cit_id
DIM IMIG
DIM AREP
DIM SCHL
DIM DISA
DIM FACI
DIM PREG
DIM ABPS
DIM verifs_needed
DIM earned_income
DIM unearned_income
DIM income_changes
DIM notes_on_abawd
DIM notes_on_income
DIM is_any_work_temporary
DIM SHEL_HEST
DIM COEX_DCEX
DIM CASH_ACCTs
DIM other_assets
DIM INSA
DIM ACCI
DIM DIET
DIM BILS
DIM FMED
DIM retro_request
DIM reason_expedited_wasnt_processed
DIM FIAT_reasons
DIM application_signed_check
DIM expedited_check
DIM appt_letter_sent_check
DIM R_R_check
DIM intake_packet_check
DIM EBT_referral_check
DIM WF1_check
DIM IAA_check
DIM updated_MMIS_check
DIM managed_care_packet_check
DIM managed_care_referral_check
DIM client_delay_check
DIM client_delay_TIKL_check
DIM other_notes
DIM CAF_status
DIM actions_taken
DIM worker_signature
DIM name_of_script
DIM start_time
DIM run_another_script_fso
DIM fso_command
DIM text_from_the_other_script
DIM url
DIM req
DIM fso
DIM next_month
DIM HH_memb_row
DIM MAXIS_footer_month
DIM MAXIS_footer_year
DIM STAT_check
DIM cancel_confirm
DIM case_note_confirm
DIM HH_member_array
DIM programs_applied_for
DIM TIKL_check
DIM PND2_check
DIM case_note_check
DIM mode_check
DIM person_delay_row
DIM person_delay_check
DIM MAXIS_check
DIM PND2_row
DIM PND2_col
DIM additional_app_check
DIM PND2_SNAP_status_check
DIM PND2_HC_status_check
DIM next_to_page_2_button
DIM next_to_page_02_button
DIM prev_panel_button
DIM next_panel_button
DIM prev_memb_button
DIM next_memb_button
DIM EATS_button
DIM IMIG_button
DIM AREP_button
DIM ALTP_button
DIM SCHL_button
DIM STIN_button
DIM STEC_button
DIM DISA_button
DIM PDED_button
DIM FACI_button
DIM PREG_button
DIM ABPS_button
DIM ELIG_DWP_button
DIM ELIG_FS_button
DIM ELIG_GA_button
DIM ELIG_HC_button
DIM ELIG_MFIP_button
DIM ELIG_MSA_button
DIM ELIG_WB_button
DIM ADDR_button
DIM MEMB_button
DIM MEMI_button
DIM PROG_button
DIM REVW_button
DIM TYPE_button
DIM next_to_page_03_button
DIM previous_to_page_01_button
DIM previous_to_page_02_button
DIM move_verifs_needed
DIM SHEL_button
DIM BUSI_button
DIM JOBS_button
DIM PBEN_button
DIM RBIC_button
DIM UNEA_button
DIM HEST_button
DIM COEX_button
DIM DCEX_button
DIM CASH_button
DIM ACCT_button
DIM CARS_button
DIM REST_button
DIM SECU_button
DIM TRAN_button
DIM OTHR_button
DIM INSA_button
DIM MEDI_button
DIM ACCI_button
DIM DIET_button
DIM BILS_button
DIM FMED_button
DIM HCRE_button

'STATS GATHERING----------------------------------------------------------------------------------------------------
'name_of_script = "NOTES - CAF.vbs"
'start_time = timer

'LOADING ROUTINE FUNCTIONS
Set run_another_script_fso = CreateObject("Scripting.FileSystemObject")
Set fso_command = run_another_script_fso.OpenTextFile("C:\Users\Ashley\Documents\GitHub\GitSome-at-Home\MASTER FUNCTIONS LIBRARY.vbs")
text_from_the_other_script = fso_command.ReadAll
fso_command.Close
Execute text_from_the_other_script

'Commented out for development
'LOADING ROUTINE FUNCTIONS FROM GITHUB REPOSITORY---------------------------------------------------------------------------
'url = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/master/MASTER%20FUNCTIONS%20LIBRARY.vbs"
'SET req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a URL
'req.open "GET", url, FALSE									'Attempts to open the URL
'req.send													'Sends request
'IF req.Status = 200 THEN									'200 means great success
'	Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
'	Execute req.responseText								'Executes the script code
'ELSE														'Error message, tells user to try to reach github.com, otherwise instructs to contact Veronica with details (and stops script).
'	MsgBox 	"Something has gone wrong. The code stored on GitHub was not able to be reached." & vbCr &_ 
'			vbCr & _
'			"Before contacting Veronica Cary, please check to make sure you can load the main page at www.GitHub.com." & vbCr &_
'			vbCr & _
'			"If you can reach GitHub.com, but this script still does not work, ask an alpha user to contact Veronica Cary and provide the following information:" & vbCr &_
'			vbTab & "- The name of the script you are running." & vbCr &_
'			vbTab & "- Whether or not the script is ""erroring out"" for any other users." & vbCr &_
'			vbTab & "- The name and email for an employee from your IT department," & vbCr & _
'			vbTab & vbTab & "responsible for network issues." & vbCr &_
'			vbTab & "- The URL indicated below (a screenshot should suffice)." & vbCr &_
'			vbCr & _
'			"Veronica will work with your IT department to try and solve this issue, if needed." & vbCr &_ 
'			vbCr &_
'			"URL: " & url
'			script_end_procedure("Script ended due to error connecting to GitHub.")
'END IF

'DATE CALCULATIONS----------------------------------------------------------------------------------------------------
next_month = dateadd("m", + 1, date)
footer_month = datepart("m", next_month)
If len(footer_month) = 1 then footer_month = "0" & footer_month
footer_year = datepart("yyyy", next_month)
footer_year = "" & footer_year - 2000

'VARIABLES WHICH NEED DECLARING------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HH_memb_row = 5 'This helps the navigation buttons work!
Dim row
Dim col
application_signed_check = 1 'The script should default to having the application signed.


'GRABBING THE CASE NUMBER, THE MEMB NUMBERS, AND THE FOOTER MONTH------------------------------------------------------------------------------------------------------------------------------------------------
EMConnect ""

call find_variable("Case Nbr: ", case_number, 8)
case_number = trim(case_number)
case_number = replace(case_number, "_", "")
If IsNumeric(case_number) = False then case_number = ""

call find_variable("Month: ", MAXIS_footer_month, 2)
If row <> 0 then 
  footer_month = MAXIS_footer_month
  call find_variable("Month: " & footer_month & " ", MAXIS_footer_year, 2)
  If row <> 0 then footer_year = MAXIS_footer_year
End if

case_number = trim(case_number)
case_number = replace(case_number, "_", "")
If IsNumeric(case_number) = False then case_number = ""

Do
  CALL global_dialog("CASE NUMBER DIALOG")
  If ButtonPressed = 0 then stopscript
  If case_number = "" or IsNumeric(case_number) = False or len(case_number) > 8 then MsgBox "You need to type a valid case number."
Loop until case_number <> "" and IsNumeric(case_number) = True and len(case_number) <= 8
transmit
MAXIS_check_function

'GRABBING THE DATE RECEIVED AND THE HH MEMBERS---------------------------------------------------------------------------------------------------------------------------------------------------------------------
call navigate_to_screen("stat", "hcre")
EMReadScreen STAT_check, 4, 20, 21
If STAT_check <> "STAT" then script_end_procedure("Can't get in to STAT. This case may be in background. Wait a few seconds and try again. If the case is not in background contact an alpha user for your agency.")
ERRR_screen_check


'Creating a custom dialog for determining who the HH members are
call HH_member_custom_dialog(HH_member_array)

'GRABBING THE INFO FOR THE CASE NOTE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

If CAF_type = "Recertification" then                                                          'For recerts it goes to one area for the CAF datestamp. For other app types it goes to STAT/PROG.
  call autofill_editbox_from_MAXIS(HH_member_array, "REVW", CAF_datestamp)
Else
  call autofill_editbox_from_MAXIS(HH_member_array, "PROG", CAF_datestamp)
End if
If HC_check = 1 and CAF_type <> "Recertification" then call autofill_editbox_from_MAXIS(HH_member_array, "HCRE-retro", retro_request)     'Grabbing retro info for HC cases that aren't recertifying
call autofill_editbox_from_MAXIS(HH_member_array, "MEMB", HH_comp)                                                                        'Grabbing HH comp info from MEMB.
If SNAP_check = 1 then call autofill_editbox_from_MAXIS(HH_member_array, "EATS", HH_comp)                                                 'Grabbing EATS info for SNAP cases, puts on HH_comp variable
'Removing semicolons from HH_comp variable, it is not needed.
HH_comp = replace(HH_comp, "; ", "")


'I put these sections in here, just because SHEL should come before HEST, it just looks cleaner.
call autofill_editbox_from_MAXIS(HH_member_array, "SHEL", SHEL_HEST) 
call autofill_editbox_from_MAXIS(HH_member_array, "HEST", SHEL_HEST) 

'Now it grabs the rest of the info, not dependent on which programs are selected.
call autofill_editbox_from_MAXIS(HH_member_array, "ABPS", ABPS)
call autofill_editbox_from_MAXIS(HH_member_array, "ACCI", ACCI)
call autofill_editbox_from_MAXIS(HH_member_array, "ACCT", CASH_ACCTs)
call autofill_editbox_from_MAXIS(HH_member_array, "AREP", AREP)
call autofill_editbox_from_MAXIS(HH_member_array, "BILS", BILS)
call autofill_editbox_from_MAXIS(HH_member_array, "BUSI", earned_income)
call autofill_editbox_from_MAXIS(HH_member_array, "CASH", CASH_ACCTs)
call autofill_editbox_from_MAXIS(HH_member_array, "CARS", other_assets)
call autofill_editbox_from_MAXIS(HH_member_array, "COEX", COEX_DCEX)
call autofill_editbox_from_MAXIS(HH_member_array, "DCEX", COEX_DCEX)
call autofill_editbox_from_MAXIS(HH_member_array, "DIET", DIET)
call autofill_editbox_from_MAXIS(HH_member_array, "DISA", DISA)
call autofill_editbox_from_MAXIS(HH_member_array, "FACI", FACI)
call autofill_editbox_from_MAXIS(HH_member_array, "FMED", FMED)
call autofill_editbox_from_MAXIS(HH_member_array, "IMIG", IMIG)
call autofill_editbox_from_MAXIS(HH_member_array, "INSA", INSA)
call autofill_editbox_from_MAXIS(HH_member_array, "JOBS", earned_income)
call autofill_editbox_from_MAXIS(HH_member_array, "MEDI", INSA)
call autofill_editbox_from_MAXIS(HH_member_array, "MEMI", cit_id)
call autofill_editbox_from_MAXIS(HH_member_array, "OTHR", other_assets)
call autofill_editbox_from_MAXIS(HH_member_array, "PBEN", income_changes)
call autofill_editbox_from_MAXIS(HH_member_array, "PREG", PREG)
call autofill_editbox_from_MAXIS(HH_member_array, "RBIC", earned_income)
call autofill_editbox_from_MAXIS(HH_member_array, "REST", other_assets)
call autofill_editbox_from_MAXIS(HH_member_array, "SCHL", SCHL)
call autofill_editbox_from_MAXIS(HH_member_array, "SECU", other_assets)
call autofill_editbox_from_MAXIS(HH_member_array, "STWK", income_changes)
call autofill_editbox_from_MAXIS(HH_member_array, "UNEA", unearned_income)
call autofill_editbox_from_MAXIS(HH_member_array, "WREG", notes_on_abawd)

'MAKING THE GATHERED INFORMATION LOOK BETTER FOR THE CASE NOTE
If cash_check = 1 then programs_applied_for = programs_applied_for & "cash, "
If HC_check = 1 then programs_applied_for = programs_applied_for & "HC, "
If SNAP_check = 1 then programs_applied_for = programs_applied_for & "SNAP, "
If EMER_check = 1 then programs_applied_for = programs_applied_for & "emergency, "
programs_applied_for = trim(programs_applied_for)
if right(programs_applied_for, 1) = "," then programs_applied_for = left(programs_applied_for, len(programs_applied_for) - 1)


'SHOULD DEFAULT TO TIKLING FOR APPLICATIONS THAT AREN'T RECERTS.
If CAF_type <> "Recertification" then TIKL_check = 1


'CASE NOTE DIALOG--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Do
  Do
    Do
      Do
        Do
          CALL global_dialog("CAF DIALOG 01")
          If ButtonPressed = 0 then 
            cancel_confirm = MsgBox("Are you sure you want to cancel the script? Press YES to cancel. Press NO to return to the script.", vbYesNo)
            If cancel_confirm = vbYes then stopscript
          End if
        Loop until ButtonPressed <> vbNo
        EMReadScreen STAT_check, 4, 20, 21
        If STAT_check = "STAT" then call stat_navigation
        transmit 'Forces a screen refresh, to keep MAXIS from erroring out in the event of a password prompt.
        MAXIS_check_function
      Loop until MAXIS_check = "MAXIS" or MAXIS_check = "AXIS " 
      If ButtonPressed <> next_to_page_02_button then call navigation_buttons
    Loop until ButtonPressed = next_to_page_02_button
    Do
      Do
        Do
          Do
            CALL global_dialog("CAF DIALOG 02")
	            If ButtonPressed = 0 then 
      	      cancel_confirm = MsgBox("Are you sure you want to cancel the script? Press YES to cancel. Press NO to return to the script.", vbYesNo)
            If cancel_confirm = vbYes then stopscript
            End if
          Loop until ButtonPressed <> vbNo
          EMReadScreen STAT_check, 4, 20, 21
          If STAT_check = "STAT" then call stat_navigation
          transmit 'Forces a screen refresh, to keep MAXIS from erroring out in the event of a password prompt.
          MAXIS_check_function
        Loop until MAXIS_check = "MAXIS" or MAXIS_check = "AXIS " 
        If ButtonPressed <> next_to_page_03_button then call navigation_buttons
      Loop until ButtonPressed = next_to_page_03_button or ButtonPressed = previous_to_page_01_button
      If ButtonPressed = previous_to_page_01_button then exit do
      Do
        Do
          Do
            CALL global_dialog("CAF DIALOG 03")
            If ButtonPressed = 0 then 
	            cancel_confirm = MsgBox("Are you sure you want to cancel the script? Press YES to cancel. Press NO to return to the script.", vbYesNo)
      	      If cancel_confirm = vbYes then stopscript
            End if
          Loop until ButtonPressed <> vbNo
          EMReadScreen STAT_check, 4, 20, 21
          If STAT_check = "STAT" then call stat_navigation
          transmit 'Forces a screen refresh, to keep MAXIS from erroring out in the event of a password prompt.
          MAXIS_check_function
        Loop until MAXIS_check = "MAXIS" or MAXIS_check = "AXIS " 
        If ButtonPressed <> -1 then call navigation_buttons
        If ButtonPressed = previous_to_page_02_button then exit do
      Loop until ButtonPressed = -1 or ButtonPressed = previous_to_page_02_button
    Loop until ButtonPressed = -1
    If ButtonPressed = previous_to_page_01_button then exit do 'In case the script skipped the third page as a result of hitting "previous page" on part 2
    If actions_taken = "" or CAF_datestamp = "" or worker_signature = "" or CAF_status = "" THEN MsgBox "You need to:" & chr(13) & chr(13) & "-Fill in the datestamp, and/or" & chr(13) & "-Actions taken sections, and/or" & chr(13) & "-HCAPP Status, and/or" & chr(13) & "-Sign your case note." & chr(13) & chr(13) & "Check these items after pressing ''OK''."
  Loop until actions_taken <> "" and CAF_datestamp <> "" and worker_signature <> "" and CAF_status <> ""
  If ButtonPressed = -1 then case_note_confirm = MsgBox("Do you want to case note? Press YES to confirm. Press NO to return to the script.", vbYesNo)
  If case_note_confirm = vbYes then
    If client_delay_check = 1 and CAF_type <> "Recertification" then 'UPDATES PND2 FOR CLIENT DELAY IF CHECKED
      call navigate_to_screen("rept", "pnd2")
      EMGetCursor PND2_row, PND2_col
      for i = 0 to 1 'This is put in a for...next statement so that it will check for "additional app" situations, where the case could be on multiple lines in REPT/PND2. It exits after one if it can't find an additional app.
        EMReadScreen PND2_SNAP_status_check, 1, PND2_row, 62						
        If PND2_SNAP_status_check = "P" then EMWriteScreen "C", PND2_row, 62
        EMReadScreen PND2_HC_status_check, 1, PND2_row, 65
        If PND2_HC_status_check = "P" then
          EMWriteScreen "x", PND2_row, 3
          transmit
          person_delay_row = 7
          Do
            EMReadScreen person_delay_check, 1, person_delay_row, 39
            If person_delay_check <> " " then EMWriteScreen "c", person_delay_row, 39
            person_delay_row = person_delay_row + 2
          Loop until person_delay_check = " " or person_delay_row > 20
          PF3
        End if
        EMReadScreen additional_app_check, 14, PND2_row + 1, 17
        If additional_app_check <> "ADDITIONAL APP" then exit for
        PND2_row = PND2_row + 1
      next
      PF3
      EMReadScreen PND2_check, 4, 2, 52
      If PND2_check = "PND2" then
        MsgBox "PND2 might not have been updated for client delay. There may have been a MAXIS error. Check this manually after case noting."
        PF10
        client_delay_check = 0
      End if
    End if
    If TIKL_check = 1 and CAF_type <> "Recertification" then
      If cash_check = 1 or EMER_check = 1 or SNAP_check = 1 then
        call navigate_to_screen("dail", "writ")
        call create_MAXIS_friendly_date(CAF_datestamp, 30, 5, 18) 
        EMSetCursor 9, 3
        If cash_check = 1 then EMSendKey "cash/"
        If SNAP_check = 1 then EMSendKey "SNAP/"
        If EMER_check = 1 then EMSendKey "EMER/"
        EMSendKey "<backspace>" & " pending 30 days. Evaluate for possible denial."
        transmit
        PF3
      End if
      If HC_check = 1 then
        call navigate_to_screen("dail", "writ")
        call create_MAXIS_friendly_date(CAF_datestamp, 45, 5, 18) 
        EMSetCursor 9, 3
        EMSendKey "HC pending 45 days. Evaluate for possible denial. If any members are elderly/disabled, allow an additional 15 days and reTIKL out."
        transmit
        PF3
      End if
    End if
    If client_delay_TIKL_check = checked then
      call navigate_to_screen("dail", "writ")
      call create_MAXIS_friendly_date(date, 10, 5, 18) 
      EMSetCursor 9, 3
      EMSendKey ">>>UPDATE PND2 FOR CLIENT DELAY IF APPROPRIATE<<<"
      transmit
      PF3
    End if
    call navigate_to_screen("case", "note")
    PF9
    EMReadScreen case_note_check, 17, 2, 33
    EMReadScreen mode_check, 1, 20, 09
    If case_note_check <> "Case Notes (NOTE)" or mode_check <> "A" then MsgBox "The script can't open a case note. Are you in inquiry? Check MAXIS and try again."
  End if
Loop until case_note_check = "Case Notes (NOTE)" and mode_check = "A"


'Adding a colon to the beginning of the CAF status variable if it isn't blank (simplifies writing the header of the case note)
If CAF_status <> "" then CAF_status = ": " & CAF_status

'Adding footer month to the recertification case notes
If CAF_type = "Recertification" then CAF_type = footer_month & "/" & footer_year & " recert"


'THE CASE NOTE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

EMSendKey "<home>" & "***" & CAF_type & CAF_status & "***" & "<newline>"
If move_verifs_needed = True and verifs_needed <> "" then call write_editbox_in_case_note("Verifs needed", verifs_needed, 6)		'If global variable move_verifs_needed = True (on FUNCTIONS FILE), it'll case note at the top.
call write_editbox_in_case_note("CAF datestamp", CAF_datestamp, 6)
If interview_type <> "" and interview_type <> " " then call write_editbox_in_case_note("Interview type", interview_type, 6)
If interview_date <> "" then call write_editbox_in_case_note("Interview date", interview_date, 6)
If HC_document_received <> "" and HC_document_received <> " " then call write_editbox_in_case_note("HC document received", HC_document_received, 6)
If HC_datestamp <> "" then call write_editbox_in_case_note("HC datestamp", HC_datestamp, 6)
call write_editbox_in_case_note("Programs applied for", programs_applied_for, 6)
if how_app_was_received <> "" or how_app_was_received <> " " then call write_editbox_in_case_note("How CAF was received", how_app_was_received, 6)	'This one also uses " " as option, because that is the default
If HH_comp <> "" then call write_editbox_in_case_note("HH comp/EATS", HH_comp, 6)
If cit_id <> "" then call write_editbox_in_case_note("Cit/ID", cit_id, 6)
If IMIG <> "" then call write_editbox_in_case_note("IMIG", IMIG, 6)
If AREP <> "" then call write_editbox_in_case_note("AREP", AREP, 6)
If FACI <> "" then call write_editbox_in_case_note("FACI", FACI, 6)
If SCHL <> "" then call write_editbox_in_case_note("SCHL/STIN/STEC", SCHL, 6)
If DISA <> "" then call write_editbox_in_case_note("DISA", DISA, 6)
If PREG <> "" then call write_editbox_in_case_note("PREG", PREG, 6)
If ABPS <> "" then call write_editbox_in_case_note("ABPS", ABPS, 6)
If earned_income <> "" then call write_editbox_in_case_note("Earned income", earned_income, 6)
If unearned_income <> "" then call write_editbox_in_case_note("Unearned income", unearned_income, 6)
If income_changes <> "" then call write_editbox_in_case_note("STWK/inc. changes", income_changes, 6)
IF notes_on_abawd <> "" then call write_editbox_in_case_note("ABAWD Notes", notes_on_abawd, 6)
If notes_on_income <> "" then call write_editbox_in_case_note("Notes on income and budget", notes_on_income, 6)
If is_any_work_temporary <> "" then call write_editbox_in_case_note("Is any work temporary", is_any_work_temporary, 6)
If SHEL_HEST <> "" then call write_editbox_in_case_note("SHEL/HEST", SHEL_HEST, 6)
If COEX_DCEX <> "" then call write_editbox_in_case_note("COEX/DCEX", COEX_DCEX, 6)
If CASH_ACCTs <> "" then call write_editbox_in_case_note("CASH/ACCTs", CASH_ACCTs, 6)
If other_assets <> "" then call write_editbox_in_case_note("Other assets", other_assets, 6)
If INSA <> "" then call write_editbox_in_case_note("INSA", INSA, 6)
If ACCI <> "" then call write_editbox_in_case_note("ACCI", ACCI, 6)
If DIET <> "" then call write_editbox_in_case_note("DIET", DIET, 6)
If BILS <> "" then call write_editbox_in_case_note("BILS", BILS, 6)
If FMED <> "" then call write_editbox_in_case_note("FMED", FMED, 6)
If retro_request <> "" then call write_editbox_in_case_note("Retro Request (if applicable)", retro_request, 6)
If application_signed_check = 1 then call write_new_line_in_case_note("* Application was signed.")
If application_signed_check = 0 then call write_new_line_in_case_note("* Application was not signed.")
If expedited_check = 1 then call write_new_line_in_case_note("* Expedited SNAP.")
If appt_letter_sent_check = 1 then call write_new_line_in_case_note("* Appointment letter was sent before interview.")
If reason_expedited_wasnt_processed <> "" then call write_editbox_in_case_note("Reason expedited wasn't processed", reason_expedited_wasnt_processed, 6)
If R_R_check = 1 then call write_new_line_in_case_note("* R/R explained to client.")
If intake_packet_check = 1 then call write_new_line_in_case_note("* Client received intake packet.")
If EBT_referral_check = 1 then call write_new_line_in_case_note("* EBT referral made for client.")
If WF1_check = 1 then call write_new_line_in_case_note("* Workforce referral made.")
If IAA_check = 1 then call write_new_line_in_case_note("* IAAs/OMB given to client.")
If updated_MMIS_check = 1 then call write_new_line_in_case_note("* Updated MMIS.")
If managed_care_packet_check = 1 then call write_new_line_in_case_note("* Client received managed care packet.")
If managed_care_referral_check = 1 then call write_new_line_in_case_note("* Managed care referral made.")
If client_delay_check = 1 then call write_new_line_in_case_note("* PND2 updated to show client delay.")
if FIAT_reasons <> "" then call write_editbox_in_case_note("FIAT reasons", FIAT_reasons, 6)
if other_notes <> "" then call write_editbox_in_case_note("Other notes", other_notes, 6)
If move_verifs_needed = False and verifs_needed <> "" then call write_editbox_in_case_note("Verifs needed", verifs_needed, 6)		'If global variable move_verifs_needed = False (on FUNCTIONS FILE), it'll case note at the bottom.
call write_editbox_in_case_note("Actions taken", actions_taken, 6)
call write_new_line_in_case_note("---")
call write_new_line_in_case_note(worker_signature)

script_end_procedure("")