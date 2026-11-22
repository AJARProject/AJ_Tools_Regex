
var $col_l; $row_l; $max_row_l; $evt : Integer
$evt:=Form event code
Case of 
	: ($evt=On Load)
		  //Form.testSelected:=RegexLab_Init_ItemSelected   //init test selected
	: ($evt=On Selection Change)  // | ($evt=On Clicked)
		
		If (Form.examples.length#0)
			LISTBOX GET CELL POSITION(*;"listbox_name_obj";$col_l;$row_l)
			$max_row_l:=LISTBOX Get number of rows(*;"listbox_name_obj")
			
			If ($row_l=0)
				LISTBOX SELECT ROW(*;"listbox_name_obj";$max_row_l;lk replace selection)
			Else 
				
			End if 
			
			RegexLab_RegulexDisplay 
			
			RegexLab_update_current 
			
			RegexLab_test 
		End if 
		
End case 
