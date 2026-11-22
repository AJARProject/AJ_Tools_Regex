  // MI 09-Nov-2018 14:10:56 (GMT+1)

var $itemPos_l; $itemRef_l; $itemSubList_l; $index_l : Integer
var $itemText_t : Text
var $itemSubExpanded_b : Boolean
var $col_item : Collection
var $temp_o : Object
Case of 
	: (Form event code=On Load)
		
	: (Form event code=On Clicked)
		
		If (Form.examples.length#0)
			  //$current:=Form.current
			$itemText_t:=Form.tab.values[Form.tab.index]  // selected tab
			Form.testSelected.function:=$itemText_t
			
			  // check if the rule is new
			$col_item:=Form.full_examples.query("regexID = :1";Form.testSelected.regexID)
			If ($col_item.length>0)  //already existing
				$index_l:=Form.examples.findIndex("findParam";"regexID";Form.testSelected.regexID)
				If ($index_l>=0)
					Form.examples[$index_l]:=Form.testSelected
					$index_l:=Form.full_examples.findIndex("findParam";"regexID";Form.testSelected.regexID)
					Form.full_examples[$index_l]:=Form.testSelected
				Else 
					  //Todo error handler
				End if 
			Else   //New
				  // save
				$temp_o:=New object
				$temp_o.function:=Form.testSelected.function
				$temp_o.name:=Form.testSelected.name
				$temp_o.pattern:=Form.testSelected.pattern
				$temp_o.replacement:=Form.testSelected.replacement
				$temp_o.groupList:=Form.testSelected.groupList
				$temp_o.description:=Form.testSelected.description
				$temp_o.regexID:=Form.testSelected.regexID
				
				Form.full_examples.push($temp_o)
				Form.examples:=Form.full_examples.query("function = :1";Form.testSelected.function)
			End if 
			
			RegexLab_update_current 
			RegexLab_save_data 
			
			  //OBJECT SET ENABLED(*;"cancel_button_obj";False)
			  //OBJECT SET ENABLED(*;"save_button_obj";False)
			  //OBJECT SET ENABLED(*;"new_button_obj";True)
		End if 
End case 



