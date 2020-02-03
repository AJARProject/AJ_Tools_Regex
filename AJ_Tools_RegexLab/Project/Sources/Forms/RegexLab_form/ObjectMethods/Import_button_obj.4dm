Case of 
	: (Form event code:C388=On Load:K2:1)
		
	: (Form event code:C388=On Clicked:K2:4)
		
		C_OBJECT:C1216($data_obj)
		$data_obj:=RegexLab_load_data (True:C214)
		If (Not:C34($data_obj.fail))
			Form:C1466.full_examples:=$data_obj.full_examples
			Form:C1466.examples:=$data_obj.examples
			
			If ($data_obj.current_function=Null:C1517)
				If ($data_obj.testSelected.function=Null:C1517)
					Form:C1466.current_function:=$data_obj.current[0].function
				Else 
					Form:C1466.current_function:=$data_obj.testSelected.function
				End if 
			Else 
				Form:C1466.current_function:=$data_obj.current_function
			End if 
			
			
			
			  // select the row
			C_OBJECT:C1216(current)
			current:=Form:C1466.current.query("function = :1";Form:C1466.current_function)
			$testName_t:=current[0].name
			  //RegexLab_Load_Examples(Form.current_function)
			If ($testName_t#"")
				$index_l:=Form:C1466.examples.findIndex("findParam";"name";$testName_t)
			Else 
				$index_l:=-1
			End if 
			If ($index_l>=0)
				LISTBOX SELECT ROW:C912(*;"listbox_name_obj";$index_l+1)  // first by default
				Form:C1466.testSelected:=Form:C1466.examples[$index_l]
			Else 
				LISTBOX SELECT ROW:C912(*;"listbox_name_obj";1)  // first by default
				Form:C1466.testSelected:=Form:C1466.examples[0]
			End if 
			RegexLab_Load_Examples (Form:C1466.current_function)
			RegexLab_RegulexDisplay 
			
			
			RegexLab_test 
			
			CALL FORM:C1391(Current form window:C827;"RegexLab_Update_TabCtrl")
		End if 
End case 
