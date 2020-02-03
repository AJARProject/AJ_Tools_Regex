//%attributes = {}
  // RegexLab_save_data ( {export} )
  //
  // export : (boolean) if true request for a specific name, false : filename = YYYY-MM-DD-HH-MM-SS.json

If (False:C215)
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
C_TEXT:C284($1)
C_TEXT:C284($mainPath_t;$json_t;$fileName_t;$export_path_t;$export_t)
C_TIME:C306($docRef_h)
$mainPath_t:=Get 4D folder:C485(Data folder:K5:33)
$json_t:=JSON Stringify:C1217(Form:C1466)



Case of 
	: (Count parameters:C259=0)
		  // default saved in the folder containing the current data file
		$fileName_t:="regex_examples.json"
		$export_t:="json"+Folder separator:K24:12
		$export_path_t:=$mainPath_t+$export_t
	: (Count parameters:C259=1)
		$fileName_t:=$1
		If ($fileName_t="")
			$fileName_t:="regex_examples.json"
		End if 
		$export_t:="export"+Folder separator:K24:12
		$export_path_t:=$mainPath_t+$export_t
		
End case 



ON ERR CALL:C155("IO ERROR HANDLER")
If ((Test path name:C476($export_path_t)=Is a folder:K24:2)=False:C215)
	CREATE FOLDER:C475($export_path_t)
End if 
$export_path_t:=$export_path_t+$fileName_t
$docRef_h:=Create document:C266($export_path_t)
If (OK=1)
	CLOSE DOCUMENT:C267($docRef_h)
	TEXT TO DOCUMENT:C1237($export_path_t;$json_t)
	If (Shift down:C543)
		SHOW ON DISK:C922($export_path_t)
	End if 
Else 
	ALERT:C41("error:"+String:C10(gError)+"\r"+"The document could not be created, I/O error "+"\r\r"+$export_path_t)
End if 
ON ERR CALL:C155("")
