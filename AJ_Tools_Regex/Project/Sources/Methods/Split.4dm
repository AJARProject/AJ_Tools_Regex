//%attributes = {"preemptive":"capable"}
// Split ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which search will be done
//   - pattern: (text) Regular expression
//
// result: (object) which contains :
//   - success: (boolean) True if the expression is resolved. else False
//   - text_extracted: (collection) - (text)  Result of the regex extraction
//   - position: (collection) - (longint)  Position of the text extracted
//   - length: (collection) - (longint)  Length of the text extracted
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 17.10.18, 18:29:31
// ----------------------------------------------------
// Method : Split
// Description
// This function is similar in concept to Perl's – it will split a string into fields, with
// a regular expression match defining the field delimiters and the text between the
// delimiters being the field content itself.
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj : Object
var $isOk_b : Boolean
var $pos_l : Integer

ARRAY LONGINT($_pos_l; 0)
ARRAY LONGINT($_length_l; 0)

$isOk_b:=False

$_pos_l{0}:=0
$_length_l{0}:=0

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)
	
	$request_obj:=$request
	If ($request_obj.pattern="") | ($request_obj.string="")
		
		$result_obj.success:=False
		
	Else 
		
		$result_obj.text_extracted:=New collection
		$result_obj.position:=New collection
		$result_obj.length:=New collection
		$result_obj.listbox:=New collection
		
		$pos_l:=1
		
		Repeat 
			$isOk_b:=Match regex($request_obj.pattern; $request_obj.string; $pos_l; $_pos_l; $_length_l)  //v1.2
			
			If ($isOk_b)
				$result_obj.text_extracted.push(Substring($request_obj.string; $pos_l; $_pos_l{0}-$pos_l))
				If ($_length_l{0}=0)
					$result_obj.success:=False
					$isOk_b:=False
				Else 
					$result_obj.position.push($pos_l)
					$result_obj.length.push($_pos_l{0}-$pos_l)
					$result_obj.listbox.push(New object("position"; $pos_l; "length"; $_pos_l{0}-$pos_l; "group"; "0"; "string_extracted"; Substring($request_obj.string; $pos_l; $_pos_l{0}-$pos_l)))
					$pos_l:=$_pos_l{0}+$_length_l{0}
					$result_obj.success:=True
				End if 
				
			Else   // last separator
				//Test if the resulting string is empty or not
				If (Substring($request_obj.string; $pos_l)#"")
					$result_obj.text_extracted.push(Substring($request_obj.string; $pos_l))
					$result_obj.position.push($pos_l)
					$result_obj.length.push(Length(Substring($request_obj.string; $pos_l)))
					$result_obj.listbox.push(New object("position"; $pos_l; "length"; Length(Substring($request_obj.string; $pos_l)); "group"; "0"; "string_extracted"; Substring($request_obj.string; $pos_l)))
				End if 
			End if 
			
		Until (Not($isOk_b))
		
	End if 
	
End if 

return $result_obj
