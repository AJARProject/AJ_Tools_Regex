//%attributes = {}
  // Regex_4DVersion -> return
  //
  // return : (text) return 4D Main version number as a string

#DECLARE() -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 22.10.18, 16:15:24
	  // ----------------------------------------------------
	  // Method: Regex_4DVersion
	  // Description
	  // Return the 4D main version number (E.g. 16 or 17 or more recent
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

var $4dversion_t : Text

$4dversion_t:=String(Num(Substring(Application version;1;2)))

$result:=$4dversion_t