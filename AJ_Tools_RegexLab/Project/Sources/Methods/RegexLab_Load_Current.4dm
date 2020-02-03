//%attributes = {}
  // MI 13-Nov-2018 09:23:20 (GMT+1)

C_OBJECT:C1216($1;$data_obj)

$data_obj:=$1

If ($data_obj.current#Null:C1517)
	Form:C1466.current:=$data_obj.current
Else 
	  // store the line selected for each page/function
	$match:=New object:C1471("function";"Match")
	$matches:=New object:C1471("function";"Matches")
	$substitute:=New object:C1471("function";"Substitute")
	$split:=New object:C1471("function";"Split")
	$extract:=New object:C1471("function";"Extract")
	Form:C1466.current:=New collection:C1472($match;$matches;$substitute;$split;$extract)
End if 
