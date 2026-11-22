//%attributes = {"preemptive":"capable"}
// Matches ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which search will be done
//   - pattern: (text) Regular expression
//   - start: (longint) (option) Position in string where search will start
//   - position_only: (boolean) (option) If True, only search at position indicated
//
// result: (object) which contains :
//   - success: (boolean) True if the expression is resolved. else False
//   - string_extracted: (collection) - (text)  Result of the regex extraction(s)
//   - position: (collection) - (longint)  Position of the text(s) extracted
//   - length: (collection) - (longint)  Length of the text(s) extracted
//   - group: (collection) - (longint)  Contains the capture group number of the corresponding string_extracted collection element
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 17.10.18, 18:29:43
// ----------------------------------------------------
// Description :
// Extracts strings based on a search using a target string and a
// pattern called "regular expression".
// It gives also the position and length of every occurence of the
// extracted strings.
// The function returns the attribute "success" to True if the search
// has found at least one occurrence.
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj : Object
var $vfound_b : Boolean
var $size_l; $start_l; $startPrevious_l; $item0_l : Integer
var $col_string_extracted; $col_group; $col_pos; $col_length; $col_listbox : Collection

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)  // if there is an object parameter
	
	$request_obj:=$request
	
	If ($request_obj.pattern#Null) & ($request_obj.string#Null)
		If ($request_obj.pattern#"") & ($request_obj.string#"")
			
			$result_obj.string_extracted:=New collection
			$result_obj.position:=New collection
			$result_obj.length:=New collection
			$result_obj.group:=New collection
			$result_obj.listbox:=New collection
			
			$col_string_extracted:=New collection
			$col_pos:=New collection
			$col_length:=New collection
			$col_group:=New collection
			$col_listbox:=New collection
			
			If ($request_obj.start=Null)
				$start_l:=1
			Else 
				$start_l:=$request_obj.start
			End if 
			
			If ($request_obj.position_only=Null)
				$request_obj.position_only:=False
			End if 
			
			$startPrevious_l:=0
			
			Repeat 
				
				ARRAY LONGINT($_pos_found_l; 0)
				ARRAY LONGINT($_length_found_l; 0)
				
				If ($request_obj.position_only)
					$vfound_b:=Match regex($request_obj.pattern; $request_obj.string; $start_l; $_pos_found_l; $_length_found_l; *)
				Else 
					$vfound_b:=Match regex($request_obj.pattern; $request_obj.string; $start_l; $_pos_found_l; $_length_found_l)
				End if 
				
				If ($vfound_b)
					
					$result_obj.success:=True
					$size_l:=Size of array($_pos_found_l)
					
					$start_l:=$_pos_found_l{0}+$_length_found_l{0}
					
					If ($startPrevious_l<$start_l)
						$startPrevious_l:=$start_l
						For ($item0_l; 0; $size_l)
							
							$col_pos.push($_pos_found_l{$item0_l})
							$col_length.push($_length_found_l{$item0_l})
							$col_group.push($item0_l)
							$col_string_extracted.push(Substring($request_obj.string; $_pos_found_l{$item0_l}; $_length_found_l{$item0_l}))
							
							$col_listbox.push(New object("position"; $_pos_found_l{$item0_l}; "length"; $_length_found_l{$item0_l}; "group"; $item0_l; "string_extracted"; Substring($request_obj.string; $_pos_found_l{$item0_l}; $_length_found_l{$item0_l})))
							
						End for 
						
					Else 
						$start_l:=$start_l+1
					End if 
					
				End if 
				
			Until (($vfound_b=False) | ($start_l>Length($request_obj.string)))
			
			// now copy to the collections to the target object
			$result_obj.position:=$col_pos.copy()
			$result_obj.length:=$col_length.copy()
			$result_obj.group:=$col_group.copy()
			$result_obj.string_extracted:=$col_string_extracted.copy()
			$result_obj.listbox:=$col_listbox.copy()
			
		End if 
		
	End if 
	
End if 

return $result_obj
