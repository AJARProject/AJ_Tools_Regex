
var $temp_col : Collection
var $evt : Integer
$evt:=Form event code
Case of 
	: ($evt=-10200)
		  // Split for each group ?
		If (Form.testSelected.captureSplitGroups=1)
			  // no filtering needed
			RegexLab_test 
			
		Else 
			$temp_col:=New collection
			  // filtering only gropup Zero
			$temp_col.combine(Form.testSelected.result.listbox.query("group = :1";0))
			Form.testSelected.result.listbox:=$temp_col
		End if 
		
		
End case 
