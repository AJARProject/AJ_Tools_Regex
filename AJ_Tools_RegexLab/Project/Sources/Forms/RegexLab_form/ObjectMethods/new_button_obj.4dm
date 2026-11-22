  // MI 26-Oct-2018 08:44:34 (GMT+1)


var $itemPos_l; $itemRef_l; $itemSubList_l; $index_l; $column_l; $row_l : Integer
var $function_t : Text
var $itemSubExpanded_b : Boolean
var $regex_obj; $str_obj; $temp_obj : Object
$regex_obj:=New regex 
$str_obj:=New object

Case of 
	: (Form event code=On Load)
		
	: (Form event code=On Clicked)
		
		$function_t:=Form.tab.values[Form.tab.index]  // selected tab
		
		LISTBOX GET CELL POSITION(*;"listbox_name_obj";$column_l;$row_l)
		
		$temp_obj:=RegexLab_Init_ItemSelected 
		$temp_obj.function:=$function_t
		$temp_obj.regexID:=Generate UUID  // not needed anymore
		Form.full_examples.push($temp_obj)
		Form.examples.push($temp_obj)
		Form.testSelected:=Form.examples[Form.examples.length-1]
		
		$index_l:=Form.examples.findIndex("findParam";"name";Form.testSelected.name)
		If ($index_l>=0)
			LISTBOX SELECT ROW(*;"listbox_name_obj";$index_l+1)
			OBJECT SET SCROLL POSITION(*;"listbox_name_obj";$index_l+1)
		Else 
			  //Todo error handler
			TRACE
		End if 
		
		  //If (Form.testSelected=Null)
		Form.testSelected:=New object
		  //End if 
		
		If (Form.testSelected.result=Null)
			Form.testSelected.result:=New object
		Else 
			Form.testSelected.result.clear()
		End if 
		
		Case of 
			: ($function_t="Match")  //Matching
				OBJECT SET SUBFORM(*;"listbox_subform";"Match_subform")  //update the subform
			: ($function_t="Matches")  //Matching
				OBJECT SET SUBFORM(*;"listbox_subform";"Matches_subform")  //update the subform
			: ($function_t="Substitute")  //Substitution
				Form.testSelected.result.replacement:=""
				Form.testSelected.result.string_resulting:=""
				OBJECT SET SUBFORM(*;"listbox_subform";"Substitute_subform")  //update the subform
			: ($function_t="Split")  //Splitting
				OBJECT SET SUBFORM(*;"listbox_subform";"Split_subform")  //update the subform
			: ($function_t="Extract")  //Extracting
				Form.testSelected.result.groupList:=""
				OBJECT SET SUBFORM(*;"listbox_subform";"Extract_subform")  //update the subform
			Else 
				  //Error TODO Error handling
		End case 
		
		RegexLab_RegulexDisplay 
		
End case 

