//%attributes = {"preemptive":"capable"}
// Match ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which search will be done
//   - pattern: (text) Regular expression
//   - start: (longint) (option) Position in string where search will start
//   - position_only: (Boolean) (option) If True, only search at position indicated
//
// result: (object) which contains :
//   - success: (boolean) True if the expression is resolved. else False
//   - string_extracted: (text) Result of the regex extraction
//   - position: (longint) Position of the text extracted
//   - length: (longint) Length of the text extracted
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 17.10.18, 18:29:43
// ----------------------------------------------------
// Description :
// Verify if a target string comply with a defined pattern called
// "regular expression".
// It returns the string found and also the position and length.
// The function put in result the attribute "success" to True if the
// search has found one occurrence.
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj : Object
var $found_b : Boolean
var $length_found_l; $pos_found_l; $start_l : Integer

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)
	$request_obj:=$request
	
	$result_obj.string_extracted:=New object
	$result_obj.position:=New object
	$result_obj.length:=New object
	
	$result_obj.listbox:=New collection
	
	If ($request_obj.position_only=Null)
		$request_obj.position_only:=False
	End if 
	If ($request_obj.string=Null)
		$request_obj.string:=""
	End if 
	If ($request_obj.pattern=Null)
		$request_obj.pattern:=""
	End if 
	
	If (Not($request_obj.position_only))  // starting with 1st character
		$found_b:=Match regex($request_obj.pattern; $request_obj.string)
		If ($found_b)
			$result_obj.string_extracted:=$request_obj.string
			$result_obj.position:=1
			$result_obj.length:=Length($request_obj.string)
			$result_obj.listbox.push(New object("position"; 1; "length"; Length($request_obj.string); "group"; "0"; "string_extracted"; $request_obj.string))
		End if 
		
	Else 
		If ($request_obj.start=Null)
			$start_l:=1
		Else 
			$start_l:=$request_obj.start
		End if 
		$found_b:=Match regex($request_obj.pattern; $request_obj.string; $start_l; $pos_found_l; $length_found_l; *)
		If ($found_b)
			$result_obj.string_extracted:=Substring($request_obj.string; $pos_found_l; $length_found_l)
			$result_obj.position:=$pos_found_l
			$result_obj.length:=$length_found_l
			$result_obj.listbox.push(New object("position"; $pos_found_l; "length"; $length_found_l; "group"; "0"; "string_extracted"; Substring($request_obj.string; $pos_found_l; $length_found_l)))
		End if 
	End if 
	
	$result_obj.success:=$found_b
	
Else 
	$result_obj.success:=False
End if 

return $result_obj
