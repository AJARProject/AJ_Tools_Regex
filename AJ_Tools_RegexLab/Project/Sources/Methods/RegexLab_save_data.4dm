//%attributes = {}
  // RegexLab_save_data ( {export} )
  //
  // export : (boolean) if true request for a specific name, false : filename = YYYY-MM-DD-HH-MM-SS.json

#DECLARE($param1 : Text)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 09.11.18, 15:28:32
	  // ----------------------------------------------------
	  // Method: RegexLab_save_data
	  // Description
	  // Save all the  examples of the Lab
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

  // context call -> form RegexLab
var $mainPath_t; $json_t; $fileName_t; $export_path_t; $export_t : Text
var $docRef_h : Time
$mainPath_t:=Storage.path.data  // Lab folder (see RegexLab_Init)
$json_t:=JSON Stringify(Form)



Case of 
	: (Count parameters=0)
		  // default saved in the folder containing the current data file
		$fileName_t:="regex_examples.json"
		$export_t:="json"+Folder separator
		$export_path_t:=$mainPath_t+$export_t
	: (Count parameters=1)
		$fileName_t:=$param1
		If ($fileName_t="")
			$fileName_t:="regex_examples.json"
		End if 
		$export_t:="export"+Folder separator
		$export_path_t:=$mainPath_t+$export_t
		
End case 



ON ERR CALL("IO ERROR HANDLER")
If ((Test path name($export_path_t)=Is a folder)=False)
	CREATE FOLDER($export_path_t)
End if 
$export_path_t:=$export_path_t+$fileName_t
$docRef_h:=Create document($export_path_t)
If (OK=1)
	CLOSE DOCUMENT($docRef_h)
	TEXT TO DOCUMENT($export_path_t;$json_t)
	If (Shift down)
		SHOW ON DISK($export_path_t)
	End if 
Else 
	ALERT("error:"+String(gError)+"\r"+"The document could not be created, I/O error "+"\r\r"+$export_path_t)
End if 
ON ERR CALL("")
