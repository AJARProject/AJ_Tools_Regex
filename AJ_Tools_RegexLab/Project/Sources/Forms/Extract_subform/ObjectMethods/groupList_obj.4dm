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

Case of 
		
		
	: (Form event code:C388=On After Keystroke:K2:26)
		
		
		
		Form:C1466.group:=New collection:C1472
		
		$separator_t:=","
		$string:=Form:C1466.groupList
		Form:C1466.group:=Split string:C1554($string;$separator_t;sk ignore empty strings:K86:1)
		
End case 

