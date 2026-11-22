//%attributes = {}
  // RegexLab_Load_Examples ( function )
  //
  // function : (text) name of the function
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 22.10.18, 09:09:30
  // ----------------------------------------------------
  // Method: RegexLab_Load_Examples
  // Description
  // 
  //
  // Parameters
  // ----------------------------------------------------


#DECLARE($param1 : Text; $param2 : Text; $param3 : Boolean)

var $function_t; $element_t : Text
var $doCopy_b : Boolean
var $data_obj : Object
$function_t:=$param1

If (Count parameters=2)
	$element_t:=$param2
Else 
	$element_t:=""
End if 

If (Count parameters=3)
	$doCopy_b:=$param3
Else 
	$doCopy_b:=False
End if 

Form.examples:=Form.full_examples.query("function = :1";$function_t).sort("RegexLabSortName")



If ($doCopy_b)  // copy the previous selected example from the previous function to the new one.
	
	$data_obj:=New object
	$data_obj.name:=Form.examples[Form.testSelected].name
	$data_obj.pattern:=Form.examples[Form.testSelected].pattern
	$data_obj.target:=Form.examples[Form.testSelected].target
	$data_obj.replacement:=Form.examples[Form.testSelected].replacement
	$data_obj.groupList:=Form.examples[Form.testSelected].groupList
	$data_obj.description:=Form.examples[Form.testSelected].description
	$data_obj.regexID:=Generate UUID
	Form.examples.push($data_obj)
	
	OBJECT SET ENABLED(*;"Button_save";True)
	
Else 
	
	OBJECT SET ENABLED(*;"Button_save";False)
	
End if 

  //Regex_listbox_reset

  // update the form display with the specific subform
Case of 
	: ($function_t="Match")  //Match
		OBJECT SET SUBFORM(*;"listbox_subform";"Match_subform")
	: ($function_t="Matches")  //Matches
		OBJECT SET SUBFORM(*;"listbox_subform";"Matches_subform")
	: ($function_t="Substitute")  //Substitute
		OBJECT SET SUBFORM(*;"listbox_subform";"Substitute_subform")
	: ($function_t="Split")  //Split
		OBJECT SET SUBFORM(*;"listbox_subform";"Split_subform")
	: ($function_t="Extract")  //Extract
		OBJECT SET SUBFORM(*;"listbox_subform";"Extract_subform")
	Else 
		OBJECT SET SUBFORM(*;"listbox_subform";"Match_subform")
End case 

