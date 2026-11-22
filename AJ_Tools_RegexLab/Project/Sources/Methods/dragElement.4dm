//%attributes = {}
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 24.03.10, 10:57:02
  // ----------------------------------------------------
  // Method: dragElement
  // Description
  //
  //
  // Parameters
  // ----------------------------------------------------


#DECLARE($param1 : Integer; $param2 : Text; $param3 : Text; $param4 : Text)

// Puts on the clipboard the 4D code (v21 syntax) that runs the current example
// with AJ_Tools_Regex. The same code is produced whatever the database language
// (the French branches used to be empty, so the clipboard was emptied).

var $function_t; $method_t; $code_t; $groups_t; $group_t : Text
var $groups_c : Collection

$function_t:=Form.tab.values[Form.tab.index]  // selected tab

Case of 
	: ($function_t="Match")
		$method_t:="match"
	: ($function_t="Matches")
		$method_t:="matches"
	: ($function_t="Substitute")
		$method_t:="substitute"
	: ($function_t="Split")
		$method_t:="split"
	: ($function_t="Extract")
		$method_t:="extract"
	Else 
		$method_t:=""
End case 

If ($method_t#"")
	$code_t:="var $regex : Object:=New regex\r"
	$code_t:=$code_t+"var $params : Object:={pattern: "+convert_escape_character(String(Form.testSelected.pattern))
	$code_t:=$code_t+"; string: "+convert_escape_character(String(Form.testSelected.target))
	
	If ($method_t="substitute")
		$code_t:=$code_t+"; string_for_replacement: "+convert_escape_character(String(Form.testSelected.replacement))
	End if 
	
	If ($method_t="extract")
		$groups_c:=New collection
		For each ($group_t; Split string(String(Form.testSelected.groupList); ","; sk ignore empty strings+sk trim spaces))
			$groups_c.push(String(Num($group_t)))
		End for each 
		If ($groups_c.length>0)
			$code_t:=$code_t+"; group: ["+$groups_c.join("; ")+"]"
		End if 
	End if 
	
	$code_t:=$code_t+"}\r"
	$code_t:=$code_t+"var $result : Object:=$regex."+$method_t+"($params)\r"
	SET TEXT TO PASTEBOARD($code_t)
Else 
	BEEP
End if 
