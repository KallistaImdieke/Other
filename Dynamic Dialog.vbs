FUNCTION global_dialog(dialog_name, dlg_para, worker_signature)

Erase dlg_para

'		VARIABLES KEY
'		case_number = dlg_para(0)
'		snap_approved_check = dlg_para(1)
'		hc_approved_check = dlg_para(2)
'		cash_approved_check = dlg_para(3)
'		emer_approved_check = dlg_para(4) 
'		type_of_approval = dlg_para(5)
'		benefit_breakdown = dlg_para(6)
'		autofill_snap_check = dlg_para(7)
'		snap_start_mo = dlg_para(8)
'		snap_start_yr = dlg_para(9) 
'		snap_end_mo = dlg_para(10)
'		snap_end_yr = dlg_para(11)
'		autofill_cash_check = dlg_para(12)
'		cash_start_mo = dlg_para(13)
'		cash_start_yr = dlg_para(14)
'		cash_end_mo = dlg_para(15)
'		cash_end_yr = dlg_para(16)
'		other_notes = dlg_para(17)
'		programs_pending = dlg_para(18)
'		docs_needed = dlg_para(19)
'		docs_datestamp = dlg_para(20)
'		docs_received = dlg_para(21)
'		verif_notes = dlg_para(22)
'		actions_taken = dlg_para(23)
'		docs_needed = dlg_para(24) 

	IF dialog_name = "approved" THEN
		a = 271
		b = 285
		c = "Approved Programs"
	ELSEIF dialog_name = "docs" THEN
		a = 466
		b = 140
		c = "Docs Received"
	END IF

BeginDialog global_dialog, 0, 0, a, b, (chr(34) & c & chr(34))
    IF dialog_name = "approved" THEN
        CheckBox 15, 25, 35, 10, "SNAP", dlg_para(1)
        CheckBox 75, 25, 55, 10, "Health Care", dlg_para(2)
        CheckBox 155, 25, 35, 10, "Cash", dlg_para(3)
        CheckBox 210, 25, 55, 10, "Emergency", dlg_para(4)
        ComboBox 70, 40, 85, 15, ""+chr(9)+"Initial"+chr(9)+"Renewal"+chr(9)+"Recertification"+chr(9)+"Change"+chr(9)+"Reinstate", dlg_para(5)
        EditBox 65, 60, 70, 15, dlg_para(0)
        EditBox 120, 85, 145, 15, dlg_para(6)
'        CheckBox 5, 105, 255, 10, "Check here to have the script autofill the SNAP approval.", dlg_para(7)
'        EditBox 155, 120, 15, 15, dlg_para(8)
'        EditBox 170, 120, 15, 15, dlg_para(9)
'        EditBox 230, 120, 15, 15, dlg_para(10)
'        EditBox 245, 120, 15, 15, dlg_para(11)
'        CheckBox 5, 145, 255, 10, "Check here to have the script autofill the CASH approval.", dlg_para(12)
'        EditBox 155, 160, 15, 15, dlg_para(13)
'        EditBox 170, 160, 15, 15, dlg_para(14)
'        EditBox 230, 160, 15, 15, dlg_para(15)
'        EditBox 245, 160, 15, 15, dlg_para(16)
        EditBox 55, 185, 210, 15, dlg_para(17)
        EditBox 85, 205, 180, 15, dlg_para(18)
        EditBox 65, 225, 200, 15, dlg_para(19)
        EditBox 65, 245, 80, 15, worker_signature
        ButtonGroup ButtonPressed
            OkButton 155, 260, 50, 15
            CancelButton 210, 260, 50, 15
        Text 5, 5, 70, 10, "Approved Programs:"
        Text 5, 45, 65, 10, "Type of Approval:"
        Text 5, 65, 55, 10, "Case Number:"
        Text 5, 80, 110, 20, "Benefit Breakdown (Issuance/Spenddown/Premium):"
        Text 10, 125, 130, 10, "Select SNAP approval range (MM YY)..."
        Text 195, 125, 25, 10, "through"
        Text 10, 165, 130, 10, "Select CASH approval range (MM YY)..."
        Text 195, 165, 25, 10, "through"
        Text 5, 190, 45, 10, "Other Notes:"
        Text 5, 210, 75, 10, "Pending Program(s):"
        Text 5, 230, 55, 10, "Verifs Needed:"
        Text 5, 250, 60, 10, "Worker Signature: "
    ELSEIF dialog_name = "docs" THEN
        EditBox 215, 5, 65, 15, dlg_para(20)
        EditBox 60, 25, 215, 15, dlg_para(21)
        EditBox 75, 45, 390, 15, dlg_para(22)
        EditBox 60, 65, 405, 15, dlg_para(23)
        EditBox 70, 85, 110, 15, worker_signature
        EditBox 115, 120, 350, 15, dlg_para(24)
        ButtonGroup ButtonPressed
            OkButton 355, 5, 50, 15
            CancelButton 410, 5, 50, 15
        Text 5, 10, 50, 10, "Case number:"
        Text 160, 10, 55, 10, "Doc datestamp:"
        Text 5, 30, 55, 10, "Docs received:"
        Text 5, 50, 70, 10, "Notes on your docs:"
        Text 280, 30, 190, 10, "Note: just list the docs here. This is the title of your note."
        Text 5, 90, 65, 10, "Worker signature:"
        Text 5, 70, 50, 10, "Actions taken: "
        Text 5, 125, 110, 10, "Verifs still needed (if applicable):"
    END IF
EndDialog

Dialog global_dialog
	IF ButtonPressed = 0 THEN stopscript
END FUNCTION

DIM dlg_para(1000)

'----------THE SCRIPT----------

call global_dialog("docs", dlg_para, worker_signature)
		docs_datestamp = dlg_para(20)
		docs_received = dlg_para(21)
		verif_notes = dlg_para(22)
		actions_taken = dlg_para(23)
		docs_needed = dlg_para(24) 


call global_dialog("approved", dlg_para, worker_signature)

'		VARIABLES KEY
		case_number = dlg_para(0)
		snap_approved_check = dlg_para(1)
		hc_approved_check = dlg_para(2)
		cash_approved_check = dlg_para(3)
		emer_approved_check = dlg_para(4) 
		type_of_approval = dlg_para(5)
		benefit_breakdown = dlg_para(6)
'		autofill_snap_check = dlg_para(7)
'		snap_start_mo = dlg_para(8)
'		snap_start_yr = dlg_para(9) 
'		snap_end_mo = dlg_para(10)
'		snap_end_yr = dlg_para(11)
'		autofill_cash_check = dlg_para(12)
'		cash_start_mo = dlg_para(13)
'		cash_start_yr = dlg_para(14)
'		cash_end_mo = dlg_para(15)
'		cash_end_yr = dlg_para(16)
		other_notes = dlg_para(17)
		programs_pending = dlg_para(18)
		docs_needed = dlg_para(19)

IF snap_approved_check = 1 THEN approved_progs = approved_progs & "SNAP/"
IF hc_approved_check = 1 THEN approved_progs = approved_progs & "HC/"
IF cash_approved_check = 1 THEN approved_progs = approved_progs & "CASH/"
IF emer_approved_check = 1 THEN approved_progs = approved_progs & "EMER/"
IF len(approved_progs) > 0 THEN approved_progs = left(approved_progs, (len(approved_progs) - 1))

msgbox ("***PROGRAMS APPROVED: " & approved_progs & "***" & chr(13) & _
		"* Benefit Breakdown: " & benefit_breakdown & chr(13) & _
		"* Approval Notes: " & other_notes & chr(13) & _
		"* Programs Pending: " & programs_pending & chr(13) & _
		"* Docs Needed: " & docs_needed & chr(13) & _
		"---" & chr(13) & _
		worker_signature)

msgbox ("***DOCS RECEIVED: " & docs_received & "***" & chr(13) & _
		"* Datestamp: " & docs_datestamp & chr(13) & _
		"* Notes: " & verif_notes & chr(13) & _
		"* Actions Taken: " & actions_taken & chr(13) & _
		"* Verifs Needed: " & verifs_needed & chr(13) & _
		"---" & chr(13) & _
		worker_signature)

