
$evt:=Form event code:C388
Case of 
	: ($evt=-10200)
		  // Split for each group ?
		If (Form:C1466.testSelected.captureSplitGroups=1)
			  // no filtering needed
			RegexLab_test 
			
		Else 
			C_COLLECTION:C1488($temp_col)
			$temp_col:=New collection:C1472
			  // filtering only gropup Zero
			$temp_col.combine(Form:C1466.testSelected.result.listbox.query("group = :1";0))
			Form:C1466.testSelected.result.listbox:=$temp_col
		End if 
		
		
End case 
