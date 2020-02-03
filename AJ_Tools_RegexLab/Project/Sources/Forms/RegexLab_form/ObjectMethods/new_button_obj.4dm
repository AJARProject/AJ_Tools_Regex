  // MI 26-Oct-2018 08:44:34 (GMT+1)

C_LONGINT:C283($itemPos_l;$itemRef_l;$itemSubList_l;$index_l;$column_l;$row_l)
C_TEXT:C284($function_t)
C_BOOLEAN:C305($itemSubExpanded_b)
C_OBJECT:C1216($regex_obj;$str_obj)

$regex_obj:=New regex 
$str_obj:=New object:C1471

Case of 
	: (Form event code:C388=On Load:K2:1)
		
	: (Form event code:C388=On Clicked:K2:4)
		
		$itemPos_l:=Selected list items:C379(Form:C1466.tab)
		GET LIST ITEM:C378(Form:C1466.tab;$itemPos_l;$itemRef_l;$function_t;$itemSubList_l;$itemSubExpanded_b)
		
		LISTBOX GET CELL POSITION:C971(*;"listbox_name_obj";$column_l;$row_l)
		
		C_OBJECT:C1216($temp_obj)
		$temp_obj:=RegexLab_Init_ItemSelected 
		$temp_obj.function:=$function_t
		$temp_obj.regexID:=Generate UUID:C1066  // not needed anymore
		Form:C1466.full_examples.push($temp_obj)
		Form:C1466.examples.push($temp_obj)
		Form:C1466.testSelected:=Form:C1466.examples[Form:C1466.examples.length-1]
		
		$index_l:=Form:C1466.examples.findIndex("findParam";"name";Form:C1466.testSelected.name)
		If ($index_l>=0)
			LISTBOX SELECT ROW:C912(*;"listbox_name_obj";$index_l+1)
			OBJECT SET SCROLL POSITION:C906(*;"listbox_name_obj";$index_l+1)
		Else 
			  //Todo error handler
			TRACE:C157
		End if 
		
		  //If (Form.testSelected=Null)
		Form:C1466.testSelected:=New object:C1471
		  //End if 
		
		If (Form:C1466.testSelected.result=Null:C1517)
			Form:C1466.testSelected.result:=New object:C1471
		Else 
			Form:C1466.testSelected.result.clear()
		End if 
		
		Case of 
			: ($function_t="Match")  //Matching
				OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Match_subform")  //update the subform
			: ($function_t="Matches")  //Matching
				OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Matches_subform")  //update the subform
			: ($function_t="Substitute")  //Substitution
				Form:C1466.testSelected.result.replacement:=""
				Form:C1466.testSelected.result.string_resulting:=""
				OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Substitute_subform")  //update the subform
			: ($function_t="Split")  //Splitting
				OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Split_subform")  //update the subform
			: ($function_t="Extract")  //Extracting
				Form:C1466.testSelected.result.groupList:=""
				OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Extract_subform")  //update the subform
			Else 
				  //Error TODO Error handling
		End case 
		
		RegexLab_RegulexDisplay 
		
End case 

