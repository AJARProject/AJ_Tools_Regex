//%attributes = {"preemptive":"capable"}
// Substitute ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which substitution will be done
//   - pattern: (text) Regular expression
//   - string_for_replacement: (text) Replacement string (if empty string, occurrences are deleted)
//
// result: (object) which contains :
//   - success: (boolean) True if the expression is resolved. else False
//   - string_resulting: (text) Result of the substitution
//   - string_match: (collection) - (text) string(s) which match the pattern
//   - position: (collection) - (longint)  Position of the text(s) extracted
//   - length: (collection) - (longint)  Length of the text(s) extracted
//   - group: (collection) - (longint)  Contains the capture group number of the matched strings collection element
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 19.10.18, 10:02:02
// ----------------------------------------------------
// Description :
// Substitutes all matches of a regular expression in a text with a replacement
// string expression. A resulting text after substitution is returned.
//
// NB : The replacement text may contain group references in the \digit form.
// Each group reference is substituted by the corresponding sub-pattern match
// (\0 is the whole pattern match, \1 the first group, \2 the second etc.).
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj : Object
var $vl_Element; $arraysize_l : Integer
var $replacement_t : Text

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)
	
	$result_obj.listbox:=New collection
	
	$request_obj:=$request
	
	If ($request_obj.pattern="") | ($request_obj.string="")
		$result_obj.success:=False
	Else 
		
		$result_obj:=Matches($request_obj)
		
		If ($result_obj.success)
			
			$vl_Element:=1
			$result_obj.string_match:=New collection
			$result_obj.string_match:=$result_obj.string_extracted.copy()
			$result_obj.string_extracted:=Null
			$arraysize_l:=$result_obj.string_match.length
			$result_obj.string_resulting:=$request_obj.string
			$replacement_t:=$request_obj.string_for_replacement
			
			If ($arraysize_l>0)  //needless to process if the size of the array is null
				$vl_Element:=$arraysize_l
				Repeat 
					If ($result_obj.group[$vl_Element-1]#0)
						If (Position("\\"+String($result_obj.group[$vl_Element-1]); $request_obj.string_for_replacement)>0)
							$replacement_t:=Replace string($replacement_t; "\\"+String($result_obj.group[$vl_Element-1]); $result_obj.string_match[$vl_Element-1])  //Je remplace \X par l'élément X du tableau
						End if 
					Else 
						$result_obj.string_resulting:=Delete string($result_obj.string_resulting; $result_obj.position[$vl_Element-1]; $result_obj.length[$vl_Element-1])  //I delete the content of the entire pattern 0
						$result_obj.string_resulting:=Insert string($result_obj.string_resulting; $replacement_t; $result_obj.position[$vl_Element-1])  //I insert the substitution expression
						$replacement_t:=$request_obj.string_for_replacement
					End if 
					$vl_Element:=$vl_Element-1
				Until ($vl_Element=0)
			End if 
			
			$result_obj.success:=True
		Else 
			$result_obj.success:=False
		End if 
		
	End if 
End if 

return $result_obj
