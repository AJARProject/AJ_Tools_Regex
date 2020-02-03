//%attributes = {"preemptive":"capable"}
  // Matches ( param_object ) -> result
  //
  // param_object: (object) which contains :
  //   - string: (text) String in which search will be done
  //   - pattern: (text) Regular expression
  //   - start: (longint) (option) Position in string where search will start
  //   - position_only: (Boolean) (option) If True, only search at position indicated
  //
  // result: (object) which contains :
  //   - success: (boolean) True if the expression is resolved. else False
  //   - string_extracted: (collection) - (text)  Result of the regex extraction(s)
  //   - position: (collection) - (longint)  Position of the text(s) extracted 
  //   - length: (collection) - (longint)  Length of the text(s) extracted
  //   - listbox (collection of objects) to use directly with a 4D Listbox (see regexLab 5)
  //
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 17.10.18, 18:29:43
  // ----------------------------------------------------
  // Description :
  // Verify if a target string comply with a defined pattern called
  // "regular expression".
  // It returns the string found and also the position and lentgh.
  // The function put in result the attribute "success" to True if the
  // search has found one occurrence.
  // ----------------------------------------------------
C_OBJECT:C1216($0;$result_obj)
C_OBJECT:C1216($1;$request_obj)

C_BOOLEAN:C305($found_b)
C_LONGINT:C283($length_found_l)
C_LONGINT:C283($pos_found_l)
C_LONGINT:C283($start_l)


$result_obj:=New object:C1471
$result_obj.success:=False:C215  // default value

If ($1#Null:C1517)
	$request_obj:=$1
	
	$result_obj.string_extracted:=New object:C1471
	$result_obj.position:=New object:C1471
	$result_obj.length:=New object:C1471
	
	$result_obj.listbox:=New collection:C1472
	
	
	If ($request_obj.position_only=Null:C1517)
		$request_obj.position_only:=False:C215
	End if 
	If ($request_obj.string=Null:C1517)
		$request_obj.string:=""
	End if 
	If ($request_obj.pattern=Null:C1517)
		$request_obj.pattern:=""
	End if 
	
	
	If (Not:C34($request_obj.position_only))  // starting with 1st character
		$found_b:=Match regex:C1019($request_obj.pattern;$request_obj.string)
		If ($found_b)
			$result_obj.string_extracted:=$request_obj.string
			$result_obj.position:=1
			$result_obj.length:=Length:C16($request_obj.string)
			$result_obj.listbox.push(New object:C1471("position";1;"length";Length:C16($request_obj.string);"group";"0";"string_extracted";$request_obj.string))
		End if 
		
	Else 
		If ($request_obj.start=Null:C1517)
			$start_l:=1
		Else 
			$start_l:=$request_obj.start
		End if 
		$found_b:=Match regex:C1019($request_obj.pattern;$request_obj.string;$start_l;$pos_found_l;$length_found_l;*)
		If ($found_b)
			$result_obj.string_extracted:=Substring:C12($request_obj.string;$pos_found_l;$length_found_l)
			$result_obj.position:=$pos_found_l
			$result_obj.length:=$length_found_l
			$result_obj.listbox.push(New object:C1471("position";$pos_found_l;"length";$length_found_l;"group";"0";"string_extracted";Substring:C12($request_obj.string;$pos_found_l;$length_found_l)))
			
		End if 
	End if 
	
	$result_obj.success:=$found_b
	
Else 
	$result_obj.success:=False:C215
	
End if 

$0:=$result_obj
