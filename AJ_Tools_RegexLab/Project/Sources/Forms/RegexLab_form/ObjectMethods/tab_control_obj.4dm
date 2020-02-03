  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 14.01.11, 17:16:13
  // ----------------------------------------------------
  // Method: REGEX LAB.tabctrl_obj
  // Description
  //
  //
  // Parameters
  // ----------------------------------------------------
C_LONGINT:C283($itemPos_l;$itemRef_l;$index_l;$itemSubList_l)
C_BOOLEAN:C305($itemSubExpanded_b)
C_TEXT:C284($function_t)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
	: (Form event code:C388=On Clicked:K2:4)
		
		
		$itemPos_l:=Selected list items:C379(Form:C1466.tab)
		GET LIST ITEM:C378(Form:C1466.tab;$itemPos_l;$itemRef_l;$function_t;$itemSubList_l;$itemSubExpanded_b)
		
		If (Windows Alt down:C563)  //Copy or Duplicate the current example
			Case of 
				: ($function_t="Match")  //Matching
					RegexLab_Load_Examples ("Match";"";True:C214)
				: ($function_t="Matches")  //Matching
					RegexLab_Load_Examples ("Matches";"";True:C214)
				: ($function_t="Substitute")  //Substitution
					RegexLab_Load_Examples ("Substitute";"";True:C214)
				: ($function_t="Split")  //Splitting
					RegexLab_Load_Examples ("Split";"";True:C214)
				: ($function_t="Extract")  //Extracting
					RegexLab_Load_Examples ("Extract";"";True:C214)
					
			End case 
			
		Else   // Switch to the selected function
			
			
			Case of 
				: ($function_t="Match")  //Matching
					RegexLab_Load_Examples ("Match")
				: ($function_t="Matches")  //Matching
					RegexLab_Load_Examples ("Matches")
				: ($function_t="Substitute")  //Substitution
					RegexLab_Load_Examples ("Substitute")
				: ($function_t="Split")  //Splitting
					RegexLab_Load_Examples ("Split")
				: ($function_t="Extract")  //Extracting
					RegexLab_Load_Examples ("Extract")
			End case 
		End if 
		
		Form:C1466.current_function:=$function_t
		If (Form:C1466.examples.length#0)
			  // Function switch
			C_COLLECTION:C1488($current)
			C_TEXT:C284($testName_t)
			$current:=Form:C1466.current.query("function = :1";$function_t)
			
			
			If ($current[0].name=Null:C1517)
				$index_l:=-1
			Else 
				$testName_t:=$current[0].name
				$index_l:=Form:C1466.examples.findIndex("findParam";"name";$testName_t)
			End if 
			
			If ($index_l>=0)
				LISTBOX SELECT ROW:C912(*;"listbox_name_obj";$index_l+1)
				OBJECT SET SCROLL POSITION:C906(*;"listbox_name_obj";$index_l+1)
				Form:C1466.testSelected:=Form:C1466.examples[$index_l]
			Else 
				LISTBOX SELECT ROW:C912(*;"listbox_name_obj";1)  // first by default
				OBJECT SET SCROLL POSITION:C906(*;"listbox_name_obj";1)
				Form:C1466.testSelected:=Form:C1466.examples[0]
			End if 
			
			
			
			RegexLab_RegulexDisplay 
			
			RegexLab_test 
		Else 
			RegexLab_RegulexDisplay 
		End if 
	: (Form event code:C388=On Validate:K2:3) | (Form event code:C388=On Close Detail:K2:24)
		
		
End case 

