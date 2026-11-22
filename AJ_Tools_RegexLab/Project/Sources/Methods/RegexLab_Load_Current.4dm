//%attributes = {}
  // MI 13-Nov-2018 09:23:20 (GMT+1)


#DECLARE($param1 : Object)

var $data_obj; $match; $matches; $substitute; $split; $extract : Object
$data_obj:=$param1

If ($data_obj.current#Null)
	Form.current:=$data_obj.current
Else 
	  // store the line selected for each page/function
	$match:=New object("function";"Match")
	$matches:=New object("function";"Matches")
	$substitute:=New object("function";"Substitute")
	$split:=New object("function";"Split")
	$extract:=New object("function";"Extract")
	Form.current:=New collection($match;$matches;$substitute;$split;$extract)
End if 
