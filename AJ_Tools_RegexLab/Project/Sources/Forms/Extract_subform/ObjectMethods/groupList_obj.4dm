  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 14.01.11, 17:34:30
  // ----------------------------------------------------
  // Method: REGEX LAB.groupList_obj
  // Description
  // 
  //
  // Parameters
  // ----------------------------------------------------

var $separator_t; $string : Text
Case of 
		
		
	: (Form event code=On After Keystroke)
		
		
		
		Form.group:=New collection
		
		$separator_t:=","
		$string:=Form.groupList
		Form.group:=Split string($string;$separator_t;sk ignore empty strings)
		
End case 

