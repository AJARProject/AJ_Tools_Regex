//%attributes = {}
// Select the tab of Form.current_function (Form.tab is an object {values; index})
var $index_l : Integer
$index_l:=Form.tab.values.indexOf(Form.current_function)
If ($index_l>=0)
	Form.tab.index:=$index_l
End if 
