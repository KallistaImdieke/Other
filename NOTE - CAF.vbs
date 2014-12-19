'STATS GATHERING----------------------------------------------------------------------------------------------------
name_of_script = "NOTES - CAF.vbs"
start_time = timer

'LOADING ROUTINE FUNCTIONS FROM GITHUB REPOSITORY---------------------------------------------------------------------------
url = "https://raw.githubusercontent.com/MN-Script-Team/BZS-FuncLib/master/MASTER%20FUNCTIONS%20LIBRARY.vbs"
SET req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a URL
req.open "GET", url, FALSE									'Attempts to open the URL
req.send													'Sends request
IF req.Status = 200 THEN									'200 means great success
	Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
	Execute req.responseText								'Executes the script code
ELSE														'Error message, tells user to try to reach github.com, otherwise instructs to contact Veronica with details (and stops script).
	MsgBox 	"Something has gone wrong. The code stored on GitHub was not able to be reached." & vbCr &_ 
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

'DATE CALCULATIONS----------------------------------------------------------------------------------------------------
next_month = dateadd("m", + 1, date)
footer_month = datepart("m", next_month)
If len(footer_month) = 1 then footer_month = "0" & footer_month
footer_year = datepart("yyyy", next_month)
footer_year = "" & footer_year - 2000

'DIALOGS-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTION global_dialogs(dialog_name, dlg_para, case_number, worker_signature)

	ERASE dlg_para

'	VARIABLES KEY
'	footer_month = dlg_para(0)
'	footer_year = dlg_para(1)
'	cash_check = dlg_para(2)
'	hc_check = dlg_para(3)
'	snap_check = dlg_para(4)
'	emer_check = dlg_para(5)
'	caf_type = dlg_para(6)
'	disable_semicolon_check = dlg_para(7)
'	caf_date_stamp = dlg_para(8)
'	interview_type = dlg_para(9)
'	interview_date = dlg_para(10)
'	how_app_was_received = dlg_para(11)
'	HC_document_received = dlg_para(12)
'	hc_datestamp = dlg_para(13)
'	hh_comp = dlg_para(14)
'	cit_id = dlg_para(15)
'	IMIG = dlg_para(16)
'	AREP = dlg_para(17)
'	SCHL = dlg_para(18)
'	DISA = dlg_para(19)
'	FACI = dlg_para(20)
'	PREG = dlg_para(21)
'	ABPS = dlg_para(22)
'	verifs_needed = dlg_para(23)

	IF dialog_name = "case_number_dialog" THEN
		a = 181
		b = 185
		c = "Case Number Dialog"
	ELSEIF dialog_name = "CAF_dialog_01" THEN
		a = 451
		b = 260
		c = "CAF Dialog Pt 1"
	ELSEIF dialog_name = "CAF_dialog_02" THEN
		a = 451
		b = 315
		c = "CAF Dialog Pt 2"
	ELSEIF dialog_name = "CAF_dialog_03" THEN
		a = 451
		b = 355
		c = "CAF Dialog Pt 3"
	END IF

	BeginDialog dialog_name, 0, 0, a, b, (chr(34) & c  & chr(34))
		IF dialog_name = "case_number_dialog" THEN
			EditBox 80, 5, 70, 15, case_number
			EditBox 65, 25, 30, 15, dlg_para(0)
			EditBox 140, 25, 30, 15, dlg_para(1)
			CheckBox 10, 60, 30, 10, "cash", dlg_para(2)
			CheckBox 50, 60, 30, 10, "HC", dlg_para(3)
			CheckBox 90, 60, 35, 10, "SNAP", dlg_para(4)
			CheckBox 135, 60, 35, 10, "EMER", dlg_para(5)
			DropListBox 70, 80, 75, 15, "Intake"+chr(9)+"Reapplication"+chr(9)+"Recertification"+chr(9)+"Add program", dlg_para(6)
			CheckBox 5, 100, 160, 10, "Disable semicolons?", dlg_para(7)
			ButtonGroup ButtonPressed
				OkButton 35, 165, 50, 15
				CancelButton 95, 165, 50, 15
			Text 25, 10, 50, 10, "Case number:"
			Text 10, 30, 50, 10, "Footer month:"
			Text 110, 30, 25, 10, "Year:"
			GroupBox 5, 45, 170, 30, "Programs applied for"
			Text 30, 85, 35, 10, "CAF type:"
			Text 15, 110, 160, 50, "(Disabling semicolons will cause your ''income'', ''asset'', and other sections to enter with word wrap, instead of each panel getting it's own line. This can be useful in households with many members, and could help keep case notes from exceeding four pages.)"
		ELSEIF dialog_name = "CAF_dialog_01" THEN
			EditBox 60, 5, 50, 15, dlg_para(8)
			ComboBox 175, 5, 70, 15, " "+chr(9)+"phone"+chr(9)+"office", dlg_para(9)
			EditBox 60, 25, 50, 15, dlg_para(10)
			ComboBox 230, 25, 95, 15, " "+chr(9)+"in-person"+chr(9)+"dropped off"+chr(9)+"mailed in"+chr(9)+"ApplyMN"+chr(9)+"faxed", dlg_para(11)
			ComboBox 220, 45, 105, 15, " "+chr(9)+"DHS-2128 (LTC Renewal)"+chr(9)+"DHS-3417B (Req. to Apply...)"+chr(9)+"DHS-3418 (HC Renewal)"+chr(9)+"DHS-3531 (LTC Application)", dlg_para(12)
			EditBox 390, 45, 50, 15, dlg_para(13)
			EditBox 75, 70, 370, 15, dlg_para(14)
			EditBox 35, 90, 200, 15, dlg_para(15)
			EditBox 265, 90, 180, 15, dlg_para(16)
			EditBox 60, 110, 120, 15, dlg_para(17)
			EditBox 270, 110, 175, 15, dlg_para(18)
			EditBox 60, 130, 210, 15, dlg_para(19)
			EditBox 310, 130, 135, 15, dlg_para(20)
			EditBox 35, 160, 410, 15, dlg_para(21)
			EditBox 35, 180, 410, 15, dlg_para(22)
			EditBox 55, 210, 390, 15, dlg_para(23)
			ButtonGroup ButtonPressed
				PushButton 340, 240, 50, 15, "NEXT", next_to_page_02_button
				CancelButton 395, 240, 50, 15
				PushButton 335, 15, 45, 10, "prev. panel", prev_panel_button
				PushButton 335, 25, 45, 10, "next panel", next_panel_button
				PushButton 395, 15, 45, 10, "prev. memb", prev_memb_button
				PushButton 395, 25, 45, 10, "next memb", next_memb_button
				PushButton 5, 75, 60, 10, "HH comp/EATS:", EATS_button
				PushButton 240, 95, 20, 10, "IMIG:", IMIG_button
				PushButton 5, 115, 25, 10, "AREP/", AREP_button
				PushButton 30, 115, 25, 10, "ALTP:", ALTP_button
				PushButton 190, 115, 25, 10, "SCHL/", SCHL_button
				PushButton 215, 115, 25, 10, "STIN/", STIN_button
				PushButton 240, 115, 25, 10, "STEC:", STEC_button
				PushButton 5, 135, 25, 10, "DISA/", DISA_button
				PushButton 30, 135, 25, 10, "PDED:", PDED_button
				PushButton 280, 135, 25, 10, "FACI:", FACI_button
				PushButton 5, 165, 25, 10, "PREG:", PREG_button
				PushButton 5, 185, 25, 10, "ABPS:", ABPS_button
				PushButton 10, 240, 20, 10, "DWP", ELIG_DWP_button
				PushButton 30, 240, 15, 10, "FS", ELIG_FS_button
				PushButton 45, 240, 15, 10, "GA", ELIG_GA_button
				PushButton 60, 240, 15, 10, "HC", ELIG_HC_button
				PushButton 75, 240, 20, 10, "MFIP", ELIG_MFIP_button
				PushButton 95, 240, 20, 10, "MSA", ELIG_MSA_button
				PushButton 115, 240, 15, 10, "WB", ELIG_WB_button
				PushButton 150, 240, 25, 10, "ADDR", ADDR_button
				PushButton 175, 240, 25, 10, "MEMB", MEMB_button
				PushButton 200, 240, 25, 10, "MEMI", MEMI_button
				PushButton 225, 240, 25, 10, "PROG", PROG_button
				PushButton 250, 240, 25, 10, "REVW", REVW_button
				PushButton 275, 240, 25, 10, "TYPE", TYPE_button
			Text 5, 10, 55, 10, "CAF datestamp:"
			Text 120, 10, 50, 10, "Interview type:"
			GroupBox 330, 5, 115, 35, "STAT-based navigation"
			Text 5, 30, 55, 10, "Interview date:"
			Text 120, 30, 110, 10, "How was application received?:"
			Text 5, 50, 210, 10, "If HC applied for (or recertifying): what document was received?:"
			Text 335, 50, 55, 10, "HC datestamp:"
			Text 5, 95, 25, 10, "CIT/ID:"
			Text 5, 215, 50, 10, "Verifs needed:"
			GroupBox 5, 230, 130, 25, "ELIG panels:"
			GroupBox 145, 230, 160, 25, "other STAT panels:"
		ELSEIF dialog_name = "CAF_dialog_02" THEN
			EditBox 60, 45, 385, 15, earned_income
			EditBox 70, 65, 375, 15, unearned_income
			EditBox 85, 85, 360, 15, income_changes
			EditBox 65, 105, 380, 15, notes_on_abawd
			EditBox 105, 125, 340, 15, notes_on_income
			EditBox 155, 145, 290, 15, is_any_work_temporary
			EditBox 60, 175, 385, 15, SHEL_HEST
			EditBox 60, 195, 250, 15, COEX_DCEX
			EditBox 65, 225, 380, 15, CASH_ACCTs
			EditBox 155, 245, 290, 15, other_assets
			EditBox 55, 275, 390, 15, verifs_needed
			ButtonGroup ButtonPressed
				PushButton 340, 295, 50, 15, "NEXT", next_to_page_03_button
				CancelButton 395, 295, 50, 15
				PushButton 275, 300, 60, 10, "previous page", previous_to_page_01_button
				PushButton 10, 15, 20, 10, "DWP", ELIG_DWP_button
				PushButton 30, 15, 15, 10, "FS", ELIG_FS_button
				PushButton 45, 15, 15, 10, "GA", ELIG_GA_button
				PushButton 60, 15, 15, 10, "HC", ELIG_HC_button
				PushButton 75, 15, 20, 10, "MFIP", ELIG_MFIP_button
				PushButton 95, 15, 20, 10, "MSA", ELIG_MSA_button
				PushButton 115, 15, 15, 10, "WB", ELIG_WB_button
				PushButton 150, 15, 25, 10, "BUSI", BUSI_button
				PushButton 175, 15, 25, 10, "JOBS", JOBS_button
				PushButton 200, 15, 25, 10, "PBEN", PBEN_button
				PushButton 225, 15, 25, 10, "RBIC", RBIC_button
				PushButton 250, 15, 25, 10, "UNEA", UNEA_button
				PushButton 335, 15, 45, 10, "prev. panel", prev_panel_button
				PushButton 335, 25, 45, 10, "next panel", next_panel_button
				PushButton 395, 15, 45, 10, "prev. memb", prev_memb_button
				PushButton 395, 25, 45, 10, "next memb", next_memb_button
				PushButton 5, 90, 75, 10, "STWK/inc. changes:", STWK_button
				PushButton 5, 180, 25, 10, "SHEL/", SHEL_button
				PushButton 30, 180, 25, 10, "HEST:", HEST_button
				PushButton 5, 200, 25, 10, "COEX/", COEX_button
				PushButton 30, 200, 25, 10, "DCEX:", DCEX_button
				PushButton 5, 230, 25, 10, "CASH/", CASH_button
				PushButton 30, 230, 30, 10, "ACCTs:", ACCT_button
				PushButton 5, 250, 25, 10, "CARS/", CARS_button
				PushButton 30, 250, 25, 10, "REST/", REST_button
				PushButton 55, 250, 25, 10, "SECU/", SECU_button
				PushButton 80, 250, 25, 10, "TRAN/", TRAN_button
				PushButton 105, 250, 45, 10, "other assets:", OTHR_button
			GroupBox 5, 5, 130, 25, "ELIG panels:"
			GroupBox 145, 5, 135, 25, "Income panels"
			GroupBox 330, 5, 115, 35, "STAT-based navigation"
			Text 5, 50, 55, 10, "Earned income:"
			Text 5, 70, 65, 10, "Unearned income:"
			Text 5, 110, 50, 10, "ABAWD notes:"
			Text 5, 130, 100, 10, "Notes on income and budget:"
			Text 5, 150, 150, 10, "Is any work temporary? If so, explain details:"
			Text 5, 280, 50, 10, "Verifs needed:"
		ELSEIF dialog_name = "CAF_dialog_03" THEN
			EditBox 60, 45, 385, 15, INSA
			EditBox 35, 65, 410, 15, ACCI
			EditBox 35, 85, 175, 15, DIET
			EditBox 245, 85, 200, 15, BILS
			EditBox 35, 105, 285, 15, FMED
			EditBox 390, 105, 55, 15, retro_request
			EditBox 180, 135, 265, 15, reason_expedited_wasnt_processed
			EditBox 100, 155, 345, 15, FIAT_reasons
			CheckBox 10, 180, 80, 10, "Application signed?", application_signed_check
			CheckBox 95, 180, 50, 10, "Expedited?", expedited_check
			CheckBox 150, 180, 65, 10, "Appt letter sent?", appt_letter_sent_check
			CheckBox 220, 180, 65, 10, "R/R explained?", R_R_check
			CheckBox 290, 180, 80, 10, "Intake packet given?", intake_packet_check
			CheckBox 375, 180, 70, 10, "EBT referral sent?", EBT_referral_check
			CheckBox 10, 195, 95, 10, "Workforce referral made?", WF1_check
			CheckBox 120, 195, 70, 10, "IAAs/OMB given?", IAA_check
			CheckBox 205, 195, 65, 10, "Updated MMIS?", updated_MMIS_check
			CheckBox 280, 195, 105, 10, "Managed care packet sent?", managed_care_packet_check
			CheckBox 10, 210, 115, 10, "Managed care referral made?", managed_care_referral_check
			CheckBox 135, 210, 290, 10, "Check here to have the script update PND2 to show client delay (pending cases only).", client_delay_check
			CheckBox 10, 225, 250, 10, "Check here to have the script create a TIKL to deny at the 30/45 day mark.", TIKL_check
			CheckBox 10, 240, 265, 10, "Check here to send a TIKL (10 days from now) to update PND2 for Client Delay.", client_delay_TIKL_check
			EditBox 55, 255, 230, 15, other_notes
			ComboBox 330, 255, 115, 15, " "+chr(9)+"incomplete"+chr(9)+"approved", CAF_status
			EditBox 55, 275, 390, 15, verifs_needed
			EditBox 55, 295, 390, 15, actions_taken
			EditBox 395, 315, 50, 15, worker_signature
			ButtonGroup ButtonPressed
				OkButton 340, 335, 50, 15
				CancelButton 395, 335, 50, 15
				PushButton 10, 15, 20, 10, "DWP", ELIG_DWP_button
				PushButton 30, 15, 15, 10, "FS", ELIG_FS_button
				PushButton 45, 15, 15, 10, "GA", ELIG_GA_button
				PushButton 60, 15, 15, 10, "HC", ELIG_HC_button
				PushButton 75, 15, 20, 10, "MFIP", ELIG_MFIP_button
				PushButton 95, 15, 20, 10, "MSA", ELIG_MSA_button
				PushButton 115, 15, 15, 10, "WB", ELIG_WB_button
				PushButton 335, 15, 45, 10, "prev. panel", prev_panel_button
				PushButton 335, 25, 45, 10, "next panel", next_panel_button
				PushButton 395, 15, 45, 10, "prev. memb", prev_memb_button
				PushButton 395, 25, 45, 10, "next memb", next_memb_button
				PushButton 5, 50, 25, 10, "INSA/", INSA_button
				PushButton 30, 50, 25, 10, "MEDI:", MEDI_button
				PushButton 5, 70, 25, 10, "ACCI:", ACCI_button
				PushButton 5, 90, 25, 10, "DIET:", DIET_button
				PushButton 215, 90, 25, 10, "BILS:", BILS_button
				PushButton 5, 110, 25, 10, "FMED:", FMED_button
				PushButton 325, 110, 60, 10, "Retro Req. date:", HCRE_button
				PushButton 265, 340, 60, 10, "previous page", previous_to_page_02_button
			GroupBox 5, 5, 130, 25, "ELIG panels:"
			GroupBox 330, 5, 115, 35, "STAT-based navigation"
			Text 5, 140, 170, 10, "Reason expedited wasn't processed (if applicable):"
			Text 5, 160, 95, 10, "FIAT reasons (if applicable):"
			Text 5, 260, 50, 10, "Other notes:"
			Text 290, 260, 40, 10, "CAF status:"
			Text 5, 280, 50, 10, "Verifs needed:"
			Text 5, 300, 50, 10, "Actions taken:"
			Text 330, 320, 60, 10, "Worker signature:"
		END IF
	EndDialog

	DIALOG dialog_name
END FUNCTION


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
  Dialog case_number_dialog
  If ButtonPressed = 0 then stopscript
  If case_number = "" or IsNumeric(case_number) = False or len(case_number) > 8 then MsgBox "You need to type a valid case number."
Loop until case_number <> "" and IsNumeric(case_number) = True and len(case_number) <= 8
transmit
EMReadScreen MAXIS_check, 5, 1, 39
If MAXIS_check <> "MAXIS" and MAXIS_check <> "AXIS " then script_end_procedure("You are not in MAXIS or you are locked out of your case.")


'GRABBING THE DATE RECEIVED AND THE HH MEMBERS---------------------------------------------------------------------------------------------------------------------------------------------------------------------
call navigate_to_screen("stat", "hcre")
EMReadScreen STAT_check, 4, 20, 21
If STAT_check <> "STAT" then script_end_procedure("Can't get in to STAT. This case may be in background. Wait a few seconds and try again. If the case is not in background contact an alpha user for your agency.")
EMReadScreen ERRR_check, 4, 2, 52
If ERRR_check = "ERRR" then transmit 'For error prone cases.


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
earned_income = trim(earned_income)
if right(earned_income, 1) = ";" then earned_income = left(earned_income, len(earned_income) - 1)
earned_income = replace(earned_income, "$________/non-monthly", "amt unknown")
earned_income = replace(earned_income, "$________/monthly", "amt unknown")
earned_income = replace(earned_income, "$________/weekly", "amt unknown")
earned_income = replace(earned_income, "$________/biweekly", "amt unknown")
earned_income = replace(earned_income, "$________/semimonthly", "amt unknown")
earned_income = replace(earned_income, "$/non-monthly", "amt unknown")
earned_income = replace(earned_income, "$/monthly", "amt unknown")
earned_income = replace(earned_income, "$/weekly", "amt unknown")
earned_income = replace(earned_income, "$/biweekly", "amt unknown")
earned_income = replace(earned_income, "$/semimonthly", "amt unknown")
unearned_income = trim(unearned_income)
if right(unearned_income, 1) = ";" then unearned_income = left(unearned_income, len(unearned_income) - 1)
unearned_income = replace(unearned_income, "$________/non-monthly", "amt unknown")
unearned_income = replace(unearned_income, "$________/monthly", "amt unknown")
unearned_income = replace(unearned_income, "$________/weekly", "amt unknown")
unearned_income = replace(unearned_income, "$________/biweekly", "amt unknown")
unearned_income = replace(unearned_income, "$________/semimonthly", "amt unknown")
unearned_income = replace(unearned_income, "$/non-monthly", "amt unknown")
unearned_income = replace(unearned_income, "$/monthly", "amt unknown")
unearned_income = replace(unearned_income, "$/weekly", "amt unknown")
unearned_income = replace(unearned_income, "$/biweekly", "amt unknown")
unearned_income = replace(unearned_income, "$/semimonthly", "amt unknown")
other_assets = trim(other_assets)
if right(other_assets, 1) = ";" then other_assets = left(other_assets, len(other_assets) - 1)
CASH_ACCTs = trim(CASH_ACCTs)
if right(CASH_ACCTs, 1) = ";" then CASH_ACCTs = left(CASH_ACCTs, len(CASH_ACCTs) - 1)
COEX_DCEX = trim(COEX_DCEX)
if right(COEX_DCEX, 1) = ";" then COEX_DCEX = left(COEX_DCEX, len(COEX_DCEX) - 1)
SHEL_HEST = trim(SHEL_HEST)
if right(SHEL_HEST, 1) = ";" then SHEL_HEST = left(SHEL_HEST, len(SHEL_HEST) - 1)
PREG = trim(PREG)
if right(PREG, 1) = ";" then PREG = left(PREG, len(PREG) - 1)
SCHL = trim(SCHL)
if right(SCHL, 1) = ";" then SCHL = left(SCHL, len(SCHL) - 1)
DISA = trim(DISA)
if right(DISA, 1) = ";" then DISA = left(DISA, len(DISA) - 1)
FACI = trim(FACI)
if right(FACI, 1) = ";" then FACI = left(FACI, len(FACI) - 1)
INSA = trim(INSA)
if right(INSA, 1) = ";" then INSA = left(INSA, len(INSA) - 1)
ACCI = trim(ACCI)
if right(ACCI, 1) = ";" then ACCI = left(ACCI, len(ACCI) - 1)
DIET = trim(DIET)
if right(DIET, 1) = ";" then DIET = left(DIET, len(DIET) - 1)
FMED = trim(FMED)
if right(FMED, 1) = ";" then FMED = left(FMED, len(FMED) - 1)
ABPS = trim(ABPS)
if right(ABPS, 1) = ";" then ABPS = left(ABPS, len(ABPS) - 1)
cit_ID = trim(cit_ID)
if right(cit_ID, 1) = ";" then cit_ID = left(cit_ID, len(cit_ID) - 1)
If cash_check = 1 then programs_applied_for = programs_applied_for & "cash, "
If HC_check = 1 then programs_applied_for = programs_applied_for & "HC, "
If SNAP_check = 1 then programs_applied_for = programs_applied_for & "SNAP, "
If EMER_check = 1 then programs_applied_for = programs_applied_for & "emergency, "
programs_applied_for = trim(programs_applied_for)
if right(programs_applied_for, 1) = "," then programs_applied_for = left(programs_applied_for, len(programs_applied_for) - 1)
income_changes = trim(income_changes)
if right(income_changes, 1) = ";" then income_changes= left(income_changes, len(income_changes) - 1)
IMIG = trim(IMIG)
if right(IMIG, 1) = ";" then IMIG = left(IMIG, len(IMIG) - 1)

'The following shuts down the semicolons if selected in the first dialog.
If disable_semicolon_check = 1 then
  earned_income = replace(earned_income, ";", "")
  unearned_income = replace(unearned_income, ";", "")
  CASH_ACCTs = replace(CASH_ACCTs, ";", "")
  other_assets = replace(other_assets, ";", "")
  schl = replace(schl, ";", "")
  disa = replace(disa, ";", "")
  faci = replace(faci, ";", "")
  insa = replace(insa, ";", "")
  acci = replace(acci, ";", "")
  diet = replace(diet, ";", "")
  fmed = replace(fmed, ";", "")
  abps = replace(abps, ";", "")
  preg = replace(preg, ";", "")
  cit_ID = replace(cit_ID, ";", ".") 'I put a period in here because the cit_ID variable does not store a comma or period normally. This should probably be fleshed out at some point.
End if

'SHOULD DEFAULT TO TIKLING FOR APPLICATIONS THAT AREN'T RECERTS.
If CAF_type <> "Recertification" then TIKL_check = 1


'CASE NOTE DIALOG--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Do
  Do
    Do
      Do
        Do
          Dialog CAF_dialog_01
          If ButtonPressed = 0 then 
            cancel_confirm = MsgBox("Are you sure you want to cancel the script? Press YES to cancel. Press NO to return to the script.", vbYesNo)
            If cancel_confirm = vbYes then stopscript
          End if
        Loop until ButtonPressed <> no_cancel_button
        EMReadScreen STAT_check, 4, 20, 21
        If STAT_check = "STAT" then call stat_navigation
        transmit 'Forces a screen refresh, to keep MAXIS from erroring out in the event of a password prompt.
        EMReadScreen MAXIS_check, 5, 1, 39
        If MAXIS_check <> "MAXIS" and MAXIS_check <> "AXIS " then MsgBox "You do not appear to be in MAXIS. Are you passworded out? Or in MMIS? Check these and try again."
      Loop until MAXIS_check = "MAXIS" or MAXIS_check = "AXIS " 
      If ButtonPressed <> next_to_page_02_button then call navigation_buttons
    Loop until ButtonPressed = next_to_page_02_button
    Do
      Do
        Do
          Do
            Dialog CAF_dialog_02
	            If ButtonPressed = 0 then 
      	      cancel_confirm = MsgBox("Are you sure you want to cancel the script? Press YES to cancel. Press NO to return to the script.", vbYesNo)
            If cancel_confirm = vbYes then stopscript
            End if
          Loop until ButtonPressed <> no_cancel_button
          EMReadScreen STAT_check, 4, 20, 21
          If STAT_check = "STAT" then call stat_navigation
          transmit 'Forces a screen refresh, to keep MAXIS from erroring out in the event of a password prompt.
          EMReadScreen MAXIS_check, 5, 1, 39
          If MAXIS_check <> "MAXIS" and MAXIS_check <> "AXIS " then MsgBox "You do not appear to be in MAXIS. Are you passworded out? Or in MMIS? Check these and try again."
        Loop until MAXIS_check = "MAXIS" or MAXIS_check = "AXIS " 
        If ButtonPressed <> next_to_page_03_button then call navigation_buttons
      Loop until ButtonPressed = next_to_page_03_button or ButtonPressed = previous_to_page_01_button
      If ButtonPressed = previous_to_page_01_button then exit do
      Do
        Do
          Do
            Dialog CAF_dialog_03
            If ButtonPressed = 0 then 
	            cancel_confirm = MsgBox("Are you sure you want to cancel the script? Press YES to cancel. Press NO to return to the script.", vbYesNo)
      	      If cancel_confirm = vbYes then stopscript
            End if
          Loop until ButtonPressed <> no_cancel_button
          EMReadScreen STAT_check, 4, 20, 21
          If STAT_check = "STAT" then call stat_navigation
          transmit 'Forces a screen refresh, to keep MAXIS from erroring out in the event of a password prompt.
          EMReadScreen MAXIS_check, 5, 1, 39
          If MAXIS_check <> "MAXIS" and MAXIS_check <> "AXIS " then MsgBox "You do not appear to be in MAXIS. Are you passworded out? Or in MMIS? Check these and try again."
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