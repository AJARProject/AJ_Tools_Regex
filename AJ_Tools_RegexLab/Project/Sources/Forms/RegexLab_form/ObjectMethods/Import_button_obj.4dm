var $data_obj : Object
var $testName_t : Text
var $index_l : Integer
Case of 
	: (Form event code=On Load)
		
	: (Form event code=On Clicked)
		
		$data_obj:=RegexLab_load_data (True)
		If (Not($data_obj.fail))
			Form.full_examples:=$data_obj.full_examples
			Form.examples:=$data_obj.examples
			
			If ($data_obj.current_function=Null)
				If ($data_obj.testSelected.function=Null)
					Form.current_function:=$data_obj.current[0].function
				Else 
					Form.current_function:=$data_obj.testSelected.function
				End if 
			Else 
				Form.current_function:=$data_obj.current_function
			End if 
			
			
			
			  // select the row
			var current : Object
			current:=Form.current.query("function = :1";Form.current_function)
			$testName_t:=current[0].name
			  //RegexLab_Load_Examples(Form.current_function)
			If ($testName_t#"")
				$index_l:=Form.examples.findIndex("findParam";"name";$testName_t)
			Else 
				$index_l:=-1
			End if 
			If ($index_l>=0)
				LISTBOX SELECT ROW(*;"listbox_name_obj";$index_l+1)  // first by default
				Form.testSelected:=Form.examples[$index_l]
			Else 
				LISTBOX SELECT ROW(*;"listbox_name_obj";1)  // first by default
				Form.testSelected:=Form.examples[0]
			End if 
			RegexLab_Load_Examples (Form.current_function)
			RegexLab_RegulexDisplay 
			
			
			RegexLab_test 
			
			CALL FORM(Current form window;"RegexLab_Update_TabCtrl")
		End if 
End case 
