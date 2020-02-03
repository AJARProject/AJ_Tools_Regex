//%attributes = {}
  // RegexLab_load_data ( { import } )
  //
  // import : (boolean) true : select a json file from the export folder and replace all the current examples
  //                              false : select a json file from the export folder and add to the existing examples
  //
If (False:C215)
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

C_OBJECT:C1216($0;$json_obj)
C_BOOLEAN:C305($1;$toImport)

C_LONGINT:C283($options_l;$testPathName_l)
C_LONGINT:C283($param_count_l)

C_TEXT:C284($json_t;$doc_t)

$json_obj:=New object:C1471

$toImport:=$1
$param_count_l:=Count parameters:C259

$mainPath_t:=Storage:C1525.path.data

Case of 
	: ($param_count_l=0)
		$fileName_t:="regex_examples.json"
		$export_t:="json"+Folder separator:K24:12
		$testPathName_l:=Test path name:C476($mainPath_t+$export_t+$fileName_t)
		If ($testPathName_l=1)
			$json_t:=Document to text:C1236($mainPath_t+$export_t+$fileName_t)
		Else 
			$json_t:=""
		End if 
		
	: ($param_count_l=1)
		
		If ($toImport)
			$options_l:=Alias selection:K24:10+Package open:K24:8+Use sheet window:K24:11
			$doc_t:=Select document:C905("";".json";"Select the json file to import:";$options_l)
			If (OK=1)
				$json_t:=Document to text:C1236(document)  // load the document
			End if 
		Else 
			$fileName_t:="regex_examples.json"
			$export_t:="json"+Folder separator:K24:12
			$testPathName_l:=Test path name:C476($mainPath_t+$export_t+$fileName_t)
			If ($testPathName_l=1)
				$json_t:=Document to text:C1236($mainPath_t+$export_t+$fileName_t)
			Else 
				$json_t:=""
			End if 
		End if 
		
End case 

If ($json_t="")
	$json_obj.fail:=True:C214
Else 
	$json_obj:=JSON Parse:C1218($json_t)
	$json_obj.fail:=False:C215
End if 

$0:=$json_obj