FUNCTION global_dialog(dialog_name, dlg_para)

	dlg_para = Array()

	IF dialog_name = "CAF1" THEN
		a = 181
		b = 95
		c = chr(34) & "CAF1" & chr(34)
		x = 0
		y = 3
'		dlg_para(0, 0) = case_number
'		dlg_para(0, 1) = worker_signature
'		dlg_para(0, 2) = bene_month
'		dlg_para(0, 3) = bene_year
	ELSEIF dialog_name = "CAF2" THEN
		a = 191
		b = 95
		c = chr(34) & "CAF2" & chr(34)
		x = 1
		y = 2
'		dlg_para(1, 0) = date_received
'		dlg_para(1, 1) = arep
'		dlg_para(1, 2) = appl_status
	END IF

	
	BeginDialog dynamic_dialog, 0, 0, a, b, c
		IF dialog_name = "CAF1" THEN
			EditBox 95, 5, 65, 15, dlg_para(0)
			EditBox 95, 25, 20, 15, dlg_para(2)
			EditBox 120, 25, 20, 15, dlg_para(3)
			EditBox 95, 45, 70, 15, dlg_para(1)
			ButtonGroup ButtonPressed
				OkButton 40, 70, 50, 15
				CancelButton 90, 70, 50, 15
			Text 10, 10, 50, 10, "Case Number:"
			Text 10, 30, 70, 10, "Benefit Month, Year"
			Text 10, 50, 75, 10, "Worker Signature"
		ELSEIF dialog_name = "CAF2" THEN
			EditBox 95, 5, 70, 15, dlg_para(0)
			EditBox 95, 25, 70, 15, dlg_para(1)
			EditBox 95, 45, 70, 15, dlg_para(2)
			ButtonGroup ButtonPressed
				OkButton 45, 70, 50, 15
				CancelButton 95, 70, 50, 15
			Text 10, 10, 55, 10, "Date Received:"
			Text 10, 30, 70, 10, "AREP"
			Text 10, 50, 75, 10, "APPL Status"
		END IF
	EndDialog

	DIALOG dynamic_dialog
END FUNCTION

call global_dialog("CAF1", dlg_para)
	case_number = dlg_para(0)
	worker_signature = dlg_para(1)
	bene_month = dlg_para(2)
	bene_year = dlg_para(3)
call global_dialog("CAF2", dlg_para)	

MsgBox ("CAF has been received on " & dlg_para(1, 0) & " for case: " & dlg_para(0, 0) & "." & chr(13) & _
		"CL is currently reporting AREP = " & dlg_para(1, 1) & chr(13) & _
		"Application is currently " & dlg_para(1, 2) & chr(13) & _
		"---" & chr(13) & _
		dlg_para(0, 1))



