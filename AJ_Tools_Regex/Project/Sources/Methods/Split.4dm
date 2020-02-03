//%attributes = {"preemptive":"capable"}
  // Split ( object ) -> result
  //
  // param_object: (object) which contains :
  //   - string: (text) String in which search will be done
  //   - pattern: (text) Regular expression
  //
  // result: (object) which contains :
  //   - success: (boolean) True if the expression is resolved. else False
  //   - text_extracted: (object) - (text)  Result of the regex extraction
  //   - position: (object) - (longint)  Position of the text extracted
  //   - length: (object) - (longint)  Length of the text extracted
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
  // 
  //
  // Parameters
  // ----------------------------------------------------

C_OBJECT:C1216($0;$result_obj)
C_OBJECT:C1216($1;$request_obj)
C_BOOLEAN:C305($isOk_b)

ARRAY LONGINT:C221($_pos_l;0)
ARRAY LONGINT:C221($_length_l;0)


$isOk_b:=False:C215

$_pos_l{0}:=0
$_length_l{0}:=0

$result_obj:=New object:C1471
$result_obj.success:=False:C215  // default value

If ($1#Null:C1517)
	
	$request_obj:=$1
	If ($request_obj.pattern="") | ($request_obj.string="")
		
		$result_obj.success:=False:C215
		
	Else 
		
		$result_obj.text_extracted:=New collection:C1472
		$result_obj.position:=New collection:C1472
		$result_obj.length:=New collection:C1472
		$result_obj.listbox:=New collection:C1472
		
		$pos_l:=1
		
		Repeat 
			$isOk_b:=Match regex:C1019($request_obj.pattern;$request_obj.string;$pos_l;$_pos_l;$_length_l)  //v1.2
			
			If ($isOk_b)
				$result_obj.text_extracted.push(Substring:C12($request_obj.string;$pos_l;$_pos_l{0}-$pos_l))
				If ($_length_l{0}=0)
					$result_obj.success:=False:C215
					$isOk_b:=False:C215
				Else 
					$result_obj.position.push($pos_l)
					$result_obj.length.push($_pos_l{0}-$pos_l)
					$result_obj.listbox.push(New object:C1471("position";$pos_l;"length";$_pos_l{0}-$pos_l;"group";"0";"string_extracted";Substring:C12($request_obj.string;$pos_l;$_pos_l{0}-$pos_l)))
					$pos_l:=$_pos_l{0}+$_length_l{0}
					$result_obj.success:=True:C214
				End if 
				
			Else   // last separator
				  //Test if the resulting string is empty or not
				If (Substring:C12($request_obj.string;$pos_l)#"")
					$result_obj.text_extracted.push(Substring:C12($request_obj.string;$pos_l))
					$result_obj.position.push($pos_l)
					$result_obj.length.push(Length:C16(Substring:C12($request_obj.string;$pos_l)))
					$result_obj.listbox.push(New object:C1471("position";$pos_l;"length";Length:C16(Substring:C12($request_obj.string;$pos_l));"group";"0";"string_extracted";Substring:C12($request_obj.string;$pos_l)))
					
				End if 
			End if 
			
		Until (Not:C34($isOk_b))
		
	End if 
	
End if 

$0:=$result_obj

