
$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		  //Form.testSelected:=RegexLab_Init_ItemSelected   //init test selected
	: ($evt=On Selection Change:K2:29)  // | ($evt=On Clicked)
		
		If (Form:C1466.examples.length#0)
			C_LONGINT:C283($col_l;$row_l;$max_row_l)
			LISTBOX GET CELL POSITION:C971(*;"listbox_name_obj";$col_l;$row_l)
			$max_row_l:=LISTBOX Get number of rows:C915(*;"listbox_name_obj")
			
			If ($row_l=0)
				LISTBOX SELECT ROW:C912(*;"listbox_name_obj";$max_row_l;lk replace selection:K53:1)
			Else 
				
			End if 
			
			RegexLab_RegulexDisplay 
			
			RegexLab_update_current 
			
			RegexLab_test 
		End if 
		
End case 
