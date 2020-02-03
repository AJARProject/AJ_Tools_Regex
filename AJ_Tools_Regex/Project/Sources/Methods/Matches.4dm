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
  //   - group: (collection) - (longint)  Contains the capture group number of the corresponding text_extracted collection element
  //   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
  //
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 17.10.18, 18:29:43
  // ----------------------------------------------------
  // Description :
  // Extracts strings based on a search using a target string and a 
  // pattern called "regular expression". 
  // It gives also the position and lentgh of every occurence of the
  // extracted strings.
  // The function returns the attribute "success" to True if the search
  // has found t least one occurrence.
  // ----------------------------------------------------

C_OBJECT:C1216($0;$result_obj)
C_OBJECT:C1216($1;$request_obj)
C_BOOLEAN:C305($vfound_b)
C_LONGINT:C283($size_l;$start_l)

$result_obj:=New object:C1471
$result_obj.success:=False:C215  // default value

C_COLLECTION:C1488($col_string_extracted;$col_group;$col_pos;$col_length;$col_listbox)

If ($1#Null:C1517)  // if there is an object parameter
	
	$request_obj:=$1
	
	If ($request_obj.pattern#Null:C1517) & ($request_obj.string#Null:C1517)
		If ($request_obj.pattern#"") & ($request_obj.string#"")
			
			
			$result_obj.string_extracted:=New collection:C1472
			$result_obj.position:=New collection:C1472
			$result_obj.length:=New collection:C1472
			$result_obj.group:=New collection:C1472
			$result_obj.listbox:=New collection:C1472
			
			$col_string_extracted:=New collection:C1472
			$col_pos:=New collection:C1472
			$col_length:=New collection:C1472
			$col_group:=New collection:C1472
			$col_listbox:=New collection:C1472
			
			If ($request_obj.start=Null:C1517)
				$start_l:=1
			Else 
				$start_l:=$request_obj.start
			End if 
			
			If ($request_obj.position_only=Null:C1517)
				$request_obj.position_only:=False:C215
			End if 
			
			$startPrevious_l:=0
			
			Repeat 
				
				ARRAY LONGINT:C221($_pos_found_l;0)
				ARRAY LONGINT:C221($_length_found_l;0)
				
				If ($request_obj.position_only)
					$vfound_b:=Match regex:C1019($request_obj.pattern;$request_obj.string;$start_l;$_pos_found_l;$_length_found_l;*)
				Else 
					$vfound_b:=Match regex:C1019($request_obj.pattern;$request_obj.string;$start_l;$_pos_found_l;$_length_found_l)
				End if 
				
				If ($vfound_b)
					
					$result_obj.success:=True:C214
					$size_l:=Size of array:C274($_pos_found_l)
					  //$element_l:=0
					
					$start_l:=$_pos_found_l{0}+$_length_found_l{0}
					
					If ($startPrevious_l<$start_l)
						$startPrevious_l:=$start_l
						For ($item0_l;0;$size_l)
							
							$col_pos.push($_pos_found_l{$item0_l})
							$col_length.push($_length_found_l{$item0_l})
							$col_group.push($item0_l)
							$col_string_extracted.push(Substring:C12($request_obj.string;$_pos_found_l{$item0_l};$_length_found_l{$item0_l}))
							
							$col_listbox.push(New object:C1471("position";$_pos_found_l{$item0_l};"length";$_length_found_l{$item0_l};"group";$item0_l;"string_extracted";Substring:C12($request_obj.string;$_pos_found_l{$item0_l};$_length_found_l{$item0_l})))
							
						End for 
						
					Else 
						$start_l:=$start_l+1
					End if 
					
					
				End if 
				
			Until (($vfound_b=False:C215) | ($start_l>Length:C16($request_obj.string)))
			
			  // now copy to the collections to the target object
			$result_obj.position:=$col_pos.copy()
			$result_obj.length:=$col_length.copy()
			$result_obj.group:=$col_group.copy()
			$result_obj.string_extracted:=$col_string_extracted.copy()
			$result_obj.listbox:=$col_listbox.copy()
			
		End if 
		
		
	End if 
	
End if 

$0:=$result_obj






