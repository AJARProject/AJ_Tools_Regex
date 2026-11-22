//%attributes = {"preemptive":"capable"}
// Substitute ( param_object ) -> result
//
// param_object: (object) which contains :
//   - string: (text) String in which substitution will be done
//   - pattern: (text) Regular expression
//   - string_for_replacement: (text) Replacement string (if missing or empty, occurrences are deleted)
//
// result: (object) which contains :
//   - success: (boolean) True if at least one occurrence is found, else False
//   - string_resulting: (text) String after substitution
//   - string_match: (collection) - (text) string(s) which match the pattern (whole match then groups)
//   - position: (collection) - (longint)  Position of the text(s) matched
//   - length: (collection) - (longint)  Length of the text(s) matched
//   - group: (collection) - (longint)  Capture group number of each string_match element
//   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
//
// The request object is not modified.
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
// The highest existing group number is used first: with 12 groups, \12 is
// group 12 and \10 group 10; with 3 groups, \12 is group 1 followed by "2".
// A reference to a group that does not exist (\9 with 3 groups) is kept as is.
// A group that does not take part in the match is replaced by "".
// Text inserted from a group is never substituted again.
// 5.2.0: \0 is supported and group references are resolved in one pass.
// ----------------------------------------------------
#DECLARE($request : Object) : Object

var $result_obj; $request_obj; $entry : Object
var $replacement_t; $resulting_t; $insert_t; $digits_t : Text
var $groupCount_l; $i; $k; $first_l; $last_l; $scan_l; $refPos_l; $refLen_l; $num_l : Integer
var $groups_c; $matches_c : Collection
var $refFound_b : Boolean

$result_obj:=New object
$result_obj.success:=False  // default value

If ($request#Null)
	
	$result_obj.listbox:=New collection
	
	$request_obj:=OB Copy($request)  // the caller's object is not modified
	
	If ($request_obj.pattern="") | ($request_obj.string="")
		$result_obj.success:=False
	Else 
		
		$result_obj:=Matches($request_obj)
		
		If ($result_obj.success)
			
			$result_obj.string_match:=$result_obj.string_extracted.copy()
			$result_obj.string_extracted:=Null
			
			If ($request_obj.string_for_replacement=Null)
				$replacement_t:=""
			Else 
				$replacement_t:=String($request_obj.string_for_replacement)
			End if 
			
			// one object per occurrence: position, length and the texts of groups 0..n
			$matches_c:=New collection
			For ($i; 0; $result_obj.listbox.length-1)
				$entry:=$result_obj.listbox[$i]
				If ($entry.group=0)
					$matches_c.push(New object("position"; $entry.position; "length"; $entry.length; "groups"; New collection))
				End if 
				$matches_c[$matches_c.length-1].groups.push($entry.string_extracted)
			End for 
			
			$resulting_t:=$request_obj.string
			// from the last occurrence to the first, so earlier positions stay valid
			For ($i; $matches_c.length-1; 0; -1)
				$groups_c:=$matches_c[$i].groups
				$groupCount_l:=$groups_c.length-1  // highest group number
				
				// build the replacement text for this occurrence (one pass, left to right)
				$insert_t:=""
				$scan_l:=1
				If (Length($replacement_t)>0)
					Repeat 
						$refFound_b:=Match regex("\\\\(\\d+)"; $replacement_t; $scan_l; $refPos_l; $refLen_l)
						If ($refFound_b)
							$insert_t:=$insert_t+Substring($replacement_t; $scan_l; $refPos_l-$scan_l)
							$digits_t:=Substring($replacement_t; $refPos_l+1; $refLen_l-1)
							// longest leading digits that name an existing group (highest group first)
							$num_l:=-1
							For ($k; Length($digits_t); 1; -1)
								If ($num_l<0)
									If (Num(Substring($digits_t; 1; $k))<=$groupCount_l)
										$num_l:=Num(Substring($digits_t; 1; $k))
										$first_l:=$k
									End if 
								End if 
							End for 
							If ($num_l<0)  // no such group: keep the reference as is
								$insert_t:=$insert_t+Substring($replacement_t; $refPos_l; $refLen_l)
							Else 
								$insert_t:=$insert_t+String($groups_c[$num_l])+Substring($digits_t; $first_l+1)
							End if 
							$scan_l:=$refPos_l+$refLen_l
						End if 
					Until (Not($refFound_b) | ($scan_l>Length($replacement_t)))
				End if 
				$insert_t:=$insert_t+Substring($replacement_t; $scan_l)
				
				$last_l:=$matches_c[$i].position
				$resulting_t:=Delete string($resulting_t; $last_l; $matches_c[$i].length)  // delete the whole match
				$resulting_t:=Insert string($resulting_t; $insert_t; $last_l)  // insert the replacement
			End for 
			
			$result_obj.string_resulting:=$resulting_t
			$result_obj.success:=True
		Else 
			$result_obj.success:=False
		End if 
		
	End if 
End if 

return $result_obj
