  // RegexLab_form

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 24.10.18, 15:26:09
	  // ----------------------------------------------------
	  // Method: RegexLab_form
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 
var $data_obj : Object
var $testName_t : Text
var $index_l; $itemRef_l; $evt : Integer
var $left_lb_l; $top_lb_l : Real

$evt:=Form event code
Case of 
	: ($evt=On Load)
		
		
		OBJECT GET COORDINATES(*;"listbox_Subform";$left_lb_l;$top_lb_l;<>right_lb_l;<>bottom_lb_l)
		
		$data_obj:=RegexLab_load_data 
		Form.examples.push(Form.full_examples[0])  //in case of examples and/or full_examples lenght are 0
		
		If (Not($data_obj.fail))
			If ($data_obj.full_examples#Null) | ($data_obj.examples#Null)
				If ($data_obj.full_examples.length>0) | ($data_obj.examples.length>0)
					Form.full_examples:=$data_obj.full_examples
					Form.examples:=$data_obj.examples
				End if 
			End if 
			
			RegexLab_Load_Current ($data_obj)
			
			  // load the current function which is :
			  // - the last used stored
			  // - the last use
			  // - or the first function
			If ($data_obj.current_function=Null)
				If ($data_obj.testSelected.function=Null)
					Form.current_function:=$data_obj.current[0].function
				Else 
					Form.current_function:=$data_obj.testSelected.function
				End if 
			Else 
				Form.current_function:=$data_obj.current_function
			End if 
		Else 
			RegexLab_Load_Current ($data_obj)
			Form.current_function:=Form.current[0].function
			ALERT("No data file founded")
		End if 
		
		  //OBJECT SET ENABLED(*;"cancel_button_obj";False)
		  //OBJECT SET ENABLED(*;"save_button_obj";False)
		
		  // select the row
		current:=Form.current.query("function = :1";Form.current_function)
		$testName_t:=current[0].name
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
		
		ARRAY LONGINT($_Pos_l;0)
		
		  //RegexLab_Update_TabCtrl 
		
		RegexLab_test 
		
		CALL FORM(Current form window;"RegexLab_Update_TabCtrl")
		
	: ($evt=On Timer)
		
		If (Frontmost window#Current form window)
			OBJECT SET ENABLED(*;"obj_PPPattern";False)
			OBJECT SET ENABLED(*;"obj_PPReplacement";False)
		Else 
			OBJECT SET ENABLED(*;"obj_PPPattern";True)
			OBJECT SET ENABLED(*;"obj_PPReplacement";True)
			
		End if 
		
	: ($evt=On Resize)
		
		  //RegexLab_Splitter_position
		
	: ($evt=On Bound Variable Change)
		
		
		
	: ($evt=On Unload)
		
	: ($evt=On Close Box)
		RegexLab_Close 
		
End case 
