  // MI 09-Nov-2018 14:10:56 (GMT+1)
C_LONGINT:C283($itemPos_l;$itemRef_l;$itemSubList_l;$index_l)
C_TEXT:C284($itemText_t)
C_BOOLEAN:C305($itemSubExpanded_b)
C_COLLECTION:C1488($col_item)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Form:C1466.examples.length#0)
			  //$current:=Form.current
			$itemPos_l:=Selected list items:C379(Form:C1466.tab)
			GET LIST ITEM:C378(Form:C1466.tab;$itemPos_l;$itemRef_l;$itemText_t;$itemSubList_l;$itemSubExpanded_b)
			Form:C1466.testSelected.function:=$itemText_t
			
			  // check if the rule is new
			$col_item:=Form:C1466.full_examples.query("regexID = :1";Form:C1466.testSelected.regexID)
			If ($col_item.length>0)  //already existing
				$index_l:=Form:C1466.examples.findIndex("findParam";"regexID";Form:C1466.testSelected.regexID)
				If ($index_l>=0)
					Form:C1466.examples[$index_l]:=Form:C1466.testSelected
					$index_l:=Form:C1466.full_examples.findIndex("findParam";"regexID";Form:C1466.testSelected.regexID)
					Form:C1466.full_examples[$index_l]:=Form:C1466.testSelected
				Else 
					  //Todo error handler
				End if 
			Else   //New
				  // save
				C_OBJECT:C1216($temp_o)
				$temp_o:=New object:C1471
				$temp_o.function:=Form:C1466.testSelected.function
				$temp_o.name:=Form:C1466.testSelected.name
				$temp_o.pattern:=Form:C1466.testSelected.pattern
				$temp_o.replacement:=Form:C1466.testSelected.replacement
				$temp_o.groupList:=Form:C1466.testSelected.groupList
				$temp_o.description:=Form:C1466.testSelected.description
				$temp_o.regexID:=Form:C1466.testSelected.regexID
				
				Form:C1466.full_examples.push($temp_o)
				Form:C1466.examples:=Form:C1466.full_examples.query("function = :1";Form:C1466.testSelected.function)
			End if 
			
			RegexLab_update_current 
			RegexLab_save_data 
			
			  //OBJECT SET ENABLED(*;"cancel_button_obj";False)
			  //OBJECT SET ENABLED(*;"save_button_obj";False)
			  //OBJECT SET ENABLED(*;"new_button_obj";True)
		End if 
End case 



