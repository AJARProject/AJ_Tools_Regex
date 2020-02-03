C_LONGINT:C283($itemPos_l;$itemRef_l;$itemSubList_l;$index_l;$index1_l;$index2_l;$column_l;$row_l)
C_TEXT:C284($functionName_t)
C_BOOLEAN:C305($itemSubExpanded_b)

  // MI 12-Nov-2018 16:33:09 (GMT+1)
Case of 
	: (Form event code:C388=On Load:K2:1)
		
	: (Form event code:C388=On Clicked:K2:4)
		  // which function (tabcontrol) is selected
		If (Form:C1466.examples.length#0)
			$itemPos_l:=Selected list items:C379(Form:C1466.tab)
			GET LIST ITEM:C378(Form:C1466.tab;$itemPos_l;$itemRef_l;$functionName_t;$itemSubList_l;$itemSubExpanded_b)
			LISTBOX GET CELL POSITION:C971(*;"listbox_name_obj";$column_l;$row_l)
			  //Form.actual_row:=$row_l
			
			  // Function switch - store the current item when switching
			C_COLLECTION:C1488($col)
			C_TEXT:C284($testName_t)
			$col:=Form:C1466.current.query("function = :1";$functionName_t)
			If ($col[0].name=Null:C1517)
				$index1_l:=-1
			Else 
				$testName_t:=$col[0].name
				$index1_l:=Form:C1466.examples.findIndex("findParam";"name";$testName_t)
				Form:C1466.examples.remove($index1_l)  // delete the current collection /function
				  //$index2_l:=Form.full_examples.findIndex("findParam";"name";$testName_t)
				  //Form.full_examples.remove($index2_l)  // delete the current collection /function
			End if 
			
			If (Form:C1466.examples.length#0)
				  // select a new item above if possible
				If ($row_l>Form:C1466.examples.length)
					$row_l:=Form:C1466.examples.length
					LISTBOX SELECT ROW:C912(*;"listbox_name_obj";$row_l)  // the last one
				Else 
					If ($row_l=1)
						LISTBOX SELECT ROW:C912(*;"listbox_name_obj";1)  // current -1
					Else 
						LISTBOX SELECT ROW:C912(*;"listbox_name_obj";$row_l-1)  // current -1
					End if 
				End if 
				
				If ($index1_l#-1)
					If ($index1_l=0)
						Form:C1466.testSelected:=Form:C1466.examples[$index1_l]
					Else 
						Form:C1466.testSelected:=Form:C1466.examples[$index1_l-1]
					End if 
				End if 
				
				
				  //update the web area for displaying the regex graph
				RegexLab_RegulexDisplay 
				
				  //calculate the current regex rule
				RegexLab_test 
				
				
				C_COLLECTION:C1488($c)
				C_LONGINT:C283($index_l)
				$c:=Form:C1466.current
				$index_l:=$c.findIndex("findFunction";$functionName_t)
				Form:C1466.current[$index_l].name:=Form:C1466.testSelected.name
				
			Else 
				Form:C1466.testSelected:=RegexLab_Init_ItemSelected 
				REDRAW:C174(OBJECT Get pointer:C1124(Object named:K67:5;"listbox_name_obj")->)
				RegexLab_RegulexDisplay 
			End if 
		End if 
End case 