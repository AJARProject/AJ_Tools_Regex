//%attributes = {}
  // RegexLab_load_data ( { import } )
  //
  // import : (boolean) true : select a json file from the export folder and replace all the current examples
  //                              false : select a json file from the export folder and add to the existing examples
  //
#DECLARE($param1 : Boolean) -> $result : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 09.11.18, 15:32:22
	  // ----------------------------------------------------
	  // Method: RegexLab_load_data
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

var $json_obj : Object
var $toImport : Boolean
var $options_l; $testPathName_l; $param_count_l : Integer
var $json_t; $doc_t; $mainPath_t; $fileName_t; $export_t : Text



$json_obj:=New object

$param_count_l:=Count parameters
If ($param_count_l>=1)
	$toImport:=$param1
End if 

$mainPath_t:=Storage.path.data

Case of 
	: ($param_count_l=0)
		$fileName_t:="regex_examples.json"
		$export_t:="json"+Folder separator
		$testPathName_l:=Test path name($mainPath_t+$export_t+$fileName_t)
		If ($testPathName_l=1)
			$json_t:=Document to text($mainPath_t+$export_t+$fileName_t; "UTF-8")
		Else 
			$json_t:=""
		End if 
		
	: ($param_count_l=1)
		
		If ($toImport)
			$options_l:=Allow alias files+Package open+Use sheet window
			$doc_t:=Select document("";".json";"Select the json file to import:";$options_l)
			If (OK=1)
				$json_t:=Document to text(document; "UTF-8")  // load the document
			End if 
		Else 
			$fileName_t:="regex_examples.json"
			$export_t:="json"+Folder separator
			$testPathName_l:=Test path name($mainPath_t+$export_t+$fileName_t)
			If ($testPathName_l=1)
				$json_t:=Document to text($mainPath_t+$export_t+$fileName_t; "UTF-8")
			Else 
				$json_t:=""
			End if 
		End if 
		
End case 

If ($json_t="")
	$json_obj.fail:=True
Else 
	$json_obj:=JSON Parse($json_t)
	$json_obj.fail:=False
End if 

$result:=$json_obj