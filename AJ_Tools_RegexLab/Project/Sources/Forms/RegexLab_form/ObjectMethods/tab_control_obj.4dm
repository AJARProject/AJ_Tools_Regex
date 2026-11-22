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

var $itemPos_l; $itemRef_l; $index_l; $itemSubList_l : Integer
var $itemSubExpanded_b : Boolean
var $function_t; $testName_t : Text
var $current : Collection
Case of 
	: (Form event code=On Load)
		
	: (Form event code=On Clicked)
		
		
		$itemPos_l:=Selected list items(Form.tab)
		GET LIST ITEM(Form.tab;$itemPos_l;$itemRef_l;$function_t;$itemSubList_l;$itemSubExpanded_b)
		
		If (Windows Alt down)  //Copy or Duplicate the current example
			Case of 
				: ($function_t="Match")  //Matching
					RegexLab_Load_Examples ("Match";"";True)
				: ($function_t="Matches")  //Matching
					RegexLab_Load_Examples ("Matches";"";True)
				: ($function_t="Substitute")  //Substitution
					RegexLab_Load_Examples ("Substitute";"";True)
				: ($function_t="Split")  //Splitting
					RegexLab_Load_Examples ("Split";"";True)
				: ($function_t="Extract")  //Extracting
					RegexLab_Load_Examples ("Extract";"";True)
					
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
		
		Form.current_function:=$function_t
		If (Form.examples.length#0)
			  // Function switch
			$current:=Form.current.query("function = :1";$function_t)
			
			
			If ($current[0].name=Null)
				$index_l:=-1
			Else 
				$testName_t:=$current[0].name
				$index_l:=Form.examples.findIndex("findParam";"name";$testName_t)
			End if 
			
			If ($index_l>=0)
				LISTBOX SELECT ROW(*;"listbox_name_obj";$index_l+1)
				OBJECT SET SCROLL POSITION(*;"listbox_name_obj";$index_l+1)
				Form.testSelected:=Form.examples[$index_l]
			Else 
				LISTBOX SELECT ROW(*;"listbox_name_obj";1)  // first by default
				OBJECT SET SCROLL POSITION(*;"listbox_name_obj";1)
				Form.testSelected:=Form.examples[0]
			End if 
			
			
			
			RegexLab_RegulexDisplay 
			
			RegexLab_test 
		Else 
			RegexLab_RegulexDisplay 
		End if 
	: (Form event code=On Validate) | (Form event code=On Close Detail)
		
		
End case 

