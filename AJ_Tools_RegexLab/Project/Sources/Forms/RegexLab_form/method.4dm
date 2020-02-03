  // RegexLab_form

If (False:C215)
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
C_OBJECT:C1216($data_obj)
C_TEXT:C284($testName_t)
C_LONGINT:C283($index_l;$itemRef_l)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		
		
		OBJECT GET COORDINATES:C663(*;"listbox_Subform";$left_lb_l;$top_lb_l;<>right_lb_l;<>bottom_lb_l)
		
		C_OBJECT:C1216($data_obj)
		$data_obj:=RegexLab_load_data 
		Form:C1466.examples.push(Form:C1466.full_examples[0])  //in case of examples and/or full_examples lenght are 0
		
		If (Not:C34($data_obj.fail))
			If ($data_obj.full_examples#Null:C1517) | ($data_obj.examples#Null:C1517)
				If ($data_obj.full_examples.length>0) | ($data_obj.examples.length>0)
					Form:C1466.full_examples:=$data_obj.full_examples
					Form:C1466.examples:=$data_obj.examples
				End if 
			End if 
			
			RegexLab_Load_Current ($data_obj)
			
			  // load the current function which is :
			  // - the last used stored
			  // - the last use
			  // - or the first function
			If ($data_obj.current_function=Null:C1517)
				If ($data_obj.testSelected.function=Null:C1517)
					Form:C1466.current_function:=$data_obj.current[0].function
				Else 
					Form:C1466.current_function:=$data_obj.testSelected.function
				End if 
			Else 
				Form:C1466.current_function:=$data_obj.current_function
			End if 
		Else 
			RegexLab_Load_Current ($data_obj)
			Form:C1466.current_function:=Form:C1466.current[0].function
			ALERT:C41("No data file founded")
		End if 
		
		  //OBJECT SET ENABLED(*;"cancel_button_obj";False)
		  //OBJECT SET ENABLED(*;"save_button_obj";False)
		
		  // select the row
		current:=Form:C1466.current.query("function = :1";Form:C1466.current_function)
		$testName_t:=current[0].name
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
		
		ARRAY LONGINT:C221($_Pos_l;0)
		
		  //RegexLab_Update_TabCtrl 
		
		RegexLab_test 
		
		CALL FORM:C1391(Current form window:C827;"RegexLab_Update_TabCtrl")
		
	: ($evt=On Timer:K2:25)
		
		If (Frontmost window:C447#Current form window:C827)
			OBJECT SET ENABLED:C1123(*;"obj_PPPattern";False:C215)
			OBJECT SET ENABLED:C1123(*;"obj_PPReplacement";False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;"obj_PPPattern";True:C214)
			OBJECT SET ENABLED:C1123(*;"obj_PPReplacement";True:C214)
			
		End if 
		
	: ($evt=On Resize:K2:27)
		
		  //RegexLab_Splitter_position
		
	: ($evt=On Bound Variable Change:K2:52)
		
		
		
	: ($evt=On Unload:K2:2)
		
	: ($evt=On Close Box:K2:21)
		RegexLab_Close 
		
End case 
