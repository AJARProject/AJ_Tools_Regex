//%attributes = {}
C_TEXT:C284(field_value_t)
C_LONGINT:C283($index_l)
C_COLLECTION:C1488($item)
$evt:=Form event code:C388
If (Form:C1466.examples.length#0)
	Case of 
		: ($evt=On Before Keystroke:K2:6)
			
		: ($evt=On After Keystroke:K2:26) | ($evt=On Data Change:K2:15)
			
			  // check if the rule is new
			$item:=Form:C1466.full_examples.query("regexID = :1";Form:C1466.testSelected.regexID)
			If ($item.length>0)  //already existing
				$index_l:=Form:C1466.examples.findIndex("findParam";"regexID";Form:C1466.testSelected.regexID)
				If ($index_l>=0)
					Form:C1466.examples[$index_l]:=Form:C1466.testSelected
					$index_l:=Form:C1466.full_examples.findIndex("findParam";"regexID";Form:C1466.testSelected.regexID)
					Form:C1466.full_examples[$index_l]:=Form:C1466.testSelected
				End if 
				
			Else   //New
				  // save
				C_OBJECT:C1216($temp_obj)
				$temp_obj:=New object:C1471
				$temp_obj.function:=Form:C1466.testSelected.function
				$temp_obj.name:=Form:C1466.testSelected.name
				$temp_obj.pattern:=Form:C1466.testSelected.pattern
				$temp_obj.replacement:=Form:C1466.testSelected.replacement
				$temp_obj.groupList:=Form:C1466.testSelected.groupList
				$temp_obj.description:=Form:C1466.testSelected.description
				$temp_obj.regexID:=Generate UUID:C1066  // not needed anymore
				Form:C1466.full_examples.push($temp_obj)
				Form:C1466.examples:=Form:C1466.full_examples.query("function = :1";Form:C1466.testSelected.function)
				
			End if 
			
	End case 
	
End if 
