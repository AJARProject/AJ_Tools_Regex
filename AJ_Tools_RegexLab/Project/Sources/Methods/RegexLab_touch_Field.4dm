//%attributes = {}
var $index_l; $evt : Integer
var $item : Collection
var $temp_obj : Object
var field_value_t : Text
$evt:=Form event code
If (Form.examples.length#0)
	Case of 
		: ($evt=On Before Keystroke)
			
		: ($evt=On After Keystroke) | ($evt=On Data Change)
			
			  // check if the rule is new
			$item:=Form.full_examples.query("regexID = :1";Form.testSelected.regexID)
			If ($item.length>0)  //already existing
				$index_l:=Form.examples.findIndex("findParam";"regexID";Form.testSelected.regexID)
				If ($index_l>=0)
					Form.examples[$index_l]:=Form.testSelected
					$index_l:=Form.full_examples.findIndex("findParam";"regexID";Form.testSelected.regexID)
					Form.full_examples[$index_l]:=Form.testSelected
				End if 
				
			Else   //New
				  // save
				$temp_obj:=New object
				$temp_obj.function:=Form.testSelected.function
				$temp_obj.name:=Form.testSelected.name
				$temp_obj.pattern:=Form.testSelected.pattern
				$temp_obj.replacement:=Form.testSelected.replacement
				$temp_obj.groupList:=Form.testSelected.groupList
				$temp_obj.description:=Form.testSelected.description
				$temp_obj.regexID:=Generate UUID  // not needed anymore
				Form.full_examples.push($temp_obj)
				Form.examples:=Form.full_examples.query("function = :1";Form.testSelected.function)
				
			End if 
			
	End case 
	
End if 
