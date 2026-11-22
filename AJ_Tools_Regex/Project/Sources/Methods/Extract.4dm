//%attributes = {"preemptive":"capable"}
// Extract ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which extraction will be done
//   - pattern: (text) Regular expression
//   - group: (collection) - (longint) (optional) group(s) to extract
//
// result: (object) which contains :
//   - success: (boolean) True if the expression is resolved. else False
//   - string_extracted: (collection) - (text) string(s) which match the pattern and part of the group(s)
//   - position: (collection) - (longint)  Position of the text(s) extracted
//   - length: (collection) - (longint)  Length of the text(s) extracted
//   - group: (collection) - (longint) Contains the capture group number of the matched strings collection element
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 19.10.18, 13:31:25
// ----------------------------------------------------
// Method: Extract
// Description
// Extracts all matches of a regular expression in a text.
//
// NB :If group is empty or 0, only the whole pattern matches are extracted.
// If the pattern contains grouping parentheses, the groups to extract can
// be defined with the collection of group numbers. For example, by
// specifing [0,1]", all matches of the whole pattern and the first
// sub-pattern will be extracted.
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj : Object
var $temp_col : Collection
var $item_t : Text

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)
	
	$result_obj.string_extracted:=New collection
	$result_obj.position:=New collection
	$result_obj.length:=New collection
	$result_obj.group:=New collection
	$result_obj.listbox:=New collection
	
	$request_obj:=$request
	
	If (($request_obj.pattern="") | ($request_obj.string=""))
		$result_obj.success:=False
	Else 
		
		$result_obj:=Matches($request_obj)
		
		If ($result_obj.success)
			
			If ($request_obj.group.length=0)  // no group to extract is defined so I put Zero
				$request_obj.group.push("0")
			End if 
			
			$temp_col:=New collection
			// We remove each group not included in the collection
			For each ($item_t; $request_obj.group)
				$temp_col.combine($result_obj.listbox.query("group = :1"; Num($item_t)))
			End for each 
			$result_obj.string_extracted:=$temp_col.extract("string_extracted")
			$result_obj.position:=$temp_col.extract("position")
			$result_obj.length:=$temp_col.extract("length")
			$result_obj.group:=$temp_col.extract("group")
			$result_obj.listbox:=$temp_col
			$result_obj.success:=True
			
		Else 
			$result_obj.success:=False
		End if 
	End if 
End if 

return $result_obj
