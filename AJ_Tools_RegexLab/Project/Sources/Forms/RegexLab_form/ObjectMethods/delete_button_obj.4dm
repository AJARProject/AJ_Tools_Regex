
  // MI 12-Nov-2018 16:33:09 (GMT+1)
var $itemPos_l; $itemRef_l; $itemSubList_l; $index_l; $index1_l; $index2_l; $column_l; $row_l : Integer
var $functionName_t; $testName_t : Text
var $itemSubExpanded_b : Boolean
var $col; $c : Collection
Case of 
	: (Form event code=On Load)
		
	: (Form event code=On Clicked)
		  // which function (tabcontrol) is selected
		If (Form.examples.length#0)
			$functionName_t:=Form.tab.values[Form.tab.index]  // selected tab
			LISTBOX GET CELL POSITION(*;"listbox_name_obj";$column_l;$row_l)
			  //Form.actual_row:=$row_l
			
			  // Function switch - store the current item when switching
			$col:=Form.current.query("function = :1";$functionName_t)
			If ($col[0].name=Null)
				$index1_l:=-1
			Else 
				$testName_t:=$col[0].name
				$index1_l:=Form.examples.findIndex("findParam";"name";$testName_t)
				Form.examples.remove($index1_l)  // delete the current collection /function
				  //$index2_l:=Form.full_examples.findIndex("findParam";"name";$testName_t)
				  //Form.full_examples.remove($index2_l)  // delete the current collection /function
			End if 
			
			If (Form.examples.length#0)
				  // select a new item above if possible
				If ($row_l>Form.examples.length)
					$row_l:=Form.examples.length
					LISTBOX SELECT ROW(*;"listbox_name_obj";$row_l)  // the last one
				Else 
					If ($row_l=1)
						LISTBOX SELECT ROW(*;"listbox_name_obj";1)  // current -1
					Else 
						LISTBOX SELECT ROW(*;"listbox_name_obj";$row_l-1)  // current -1
					End if 
				End if 
				
				If ($index1_l#-1)
					If ($index1_l=0)
						Form.testSelected:=Form.examples[$index1_l]
					Else 
						Form.testSelected:=Form.examples[$index1_l-1]
					End if 
				End if 
				
				
				  //update the web area for displaying the regex graph
				RegexLab_RegulexDisplay 
				
				  //calculate the current regex rule
				RegexLab_test 
				
				
				$c:=Form.current
				$index_l:=$c.findIndex("findFunction";$functionName_t)
				Form.current[$index_l].name:=Form.testSelected.name
				
			Else 
				Form.testSelected:=RegexLab_Init_ItemSelected 
				REDRAW(OBJECT Get pointer(Object named;"listbox_name_obj")->)
				RegexLab_RegulexDisplay 
			End if 
		End if 
End case 