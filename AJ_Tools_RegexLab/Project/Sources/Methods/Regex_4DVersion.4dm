//%attributes = {}
  // Regex_4DVersion -> return
  //
  // return : (text) return 4D Main version number as a string

If (False:C215)
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

C_TEXT:C284($0;$4dversion_t)

$4dversion_t:=String:C10(Num:C11(Substring:C12(Application version:C493;1;2)))

$0:=$4dversion_t