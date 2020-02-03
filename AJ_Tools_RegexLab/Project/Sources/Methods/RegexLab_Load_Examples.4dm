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

C_TEXT:C284($1;$function_t)
C_TEXT:C284($2;$element_t)
C_BOOLEAN:C305($3;$doCopy_b)

$function_t:=$1

If (Count parameters:C259=2)
	$element_t:=$2
Else 
	$element_t:=""
End if 

If (Count parameters:C259=3)
	$doCopy_b:=$3
Else 
	$doCopy_b:=False:C215
End if 

Form:C1466.examples:=Form:C1466.full_examples.query("function = :1";$function_t).sort("RegexLabSortName")



If ($doCopy_b)  // copy the previous selected example from the previous function to the new one.
	
	C_OBJECT:C1216($data_obj)
	$data_obj:=New object:C1471
	$data_obj.name:=Form:C1466.examples[Form:C1466.testSelected].name
	$data_obj.pattern:=Form:C1466.examples[Form:C1466.testSelected].pattern
	$data_obj.target:=Form:C1466.examples[Form:C1466.testSelected].target
	$data_obj.replacement:=Form:C1466.examples[Form:C1466.testSelected].replacement
	$data_obj.groupList:=Form:C1466.examples[Form:C1466.testSelected].groupList
	$data_obj.description:=Form:C1466.examples[Form:C1466.testSelected].description
	$data_obj.regexID:=Generate UUID:C1066
	Form:C1466.examples.push($data_obj)
	
	OBJECT SET ENABLED:C1123(*;"Button_save";True:C214)
	
Else 
	
	OBJECT SET ENABLED:C1123(*;"Button_save";False:C215)
	
End if 

  //Regex_listbox_reset

  // update the form display with the specific subform
Case of 
	: ($function_t="Match")  //Match
		OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Match_subform")
	: ($function_t="Matches")  //Matches
		OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Matches_subform")
	: ($function_t="Substitute")  //Substitute
		OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Substitute_subform")
	: ($function_t="Split")  //Split
		OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Split_subform")
	: ($function_t="Extract")  //Extract
		OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Extract_subform")
	Else 
		OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Match_subform")
End case 

