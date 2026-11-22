//%attributes = {"preemptive":"capable"}
// Match ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which search will be done
//   - pattern: (text) Regular expression
//   - start: (longint) (option) Position in string where search will start (default 1)
//   - position_only: (Boolean) (option) If True, the occurrence must start exactly at "start"
//   - whole_string: (Boolean) (option) If True, the whole string must match the pattern
//       (behaviour of version 5.1.0 and before when position_only was not True)
//
// result: (object) which contains :
//   - success: (boolean) True if an occurrence is found, else False
//   - string_extracted: (text) Occurrence found ("" if none)
//   - position: (longint) Position of the occurrence (0 if none)
//   - length: (longint) Length of the occurrence (0 if none)
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//       [{position; length; group (0); string_extracted}]
//
// The request object is not modified.
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 17.10.18, 18:29:43
// ----------------------------------------------------
// Description :
// Searches the first occurrence of a pattern called "regular expression"
// in a target string, from the "start" position.
// It returns the string found and also the position and length.
// The function sets the attribute "success" to True if the
// search has found one occurrence.
// 5.2.0: search from "start" by default (5.1.0 tested the whole string and
// ignored "start" unless position_only was True). whole_string:True keeps the
// 5.1.0 behaviour.
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj : Object
var $found_b : Boolean
var $length_found_l; $pos_found_l; $start_l : Integer

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)
	$request_obj:=OB Copy($request)  // the caller's object is not modified
	
	$result_obj.string_extracted:=""
	$result_obj.position:=0
	$result_obj.length:=0
	
	$result_obj.listbox:=New collection
	
	If ($request_obj.string=Null)
		$request_obj.string:=""
	End if 
	If ($request_obj.pattern=Null)
		$request_obj.pattern:=""
	End if 
	
	If ($request_obj.start=Null)
		$start_l:=1
	Else 
		$start_l:=Num($request_obj.start)
	End if 
	If ($start_l<1)
		$start_l:=1
	End if 
	
	Case of 
		: ($request_obj.pattern="")
			$found_b:=False
			
		: (Bool($request_obj.position_only))  // occurrence must start at $start_l
			If ($start_l<=Length($request_obj.string))
				$found_b:=Match regex($request_obj.pattern; $request_obj.string; $start_l; $pos_found_l; $length_found_l; *)
			End if 
			
		: (Bool($request_obj.whole_string))  // 5.1.0 behaviour: the whole string must match
			$found_b:=Match regex($request_obj.pattern; $request_obj.string)
			If ($found_b)
				$pos_found_l:=1
				$length_found_l:=Length($request_obj.string)
			End if 
			
		Else   // first occurrence from $start_l
			If ($start_l<=Length($request_obj.string))
				$found_b:=Match regex($request_obj.pattern; $request_obj.string; $start_l; $pos_found_l; $length_found_l)
			End if 
	End case 
	
	If ($found_b)
		$result_obj.string_extracted:=Substring($request_obj.string; $pos_found_l; $length_found_l)
		$result_obj.position:=$pos_found_l
		$result_obj.length:=$length_found_l
		$result_obj.listbox.push(New object("position"; $pos_found_l; "length"; $length_found_l; "group"; 0; "string_extracted"; $result_obj.string_extracted))
	End if 
	
	$result_obj.success:=$found_b
	
End if 

return $result_obj
