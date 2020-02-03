//%attributes = {}
  // ----------------------------------------------------
  // Nom utilisateur (OS) : Maurice Inzirillo
  // Date et heure : 11.12.14, 14:24:28
  // ----------------------------------------------------
  // Méthode : RegexLab_Expression
  // Description
  // For VisualRegex display
  //
  // Paramètres
  // ----------------------------------------------------

C_TEXT:C284($0)
C_OBJECT:C1216($regex;$str)
C_OBJECT:C1216($result_obj)
$regex:=New regex 

$pattern_t:="(\\(\\?[ismwx-]+\\))(.*)"  //Motif (expression régulière)
$text_substitute_t:="\\2"


If (Form:C1466.testSelected#Null:C1517)
	If (Form:C1466.testSelected.pattern#Null:C1517)
		$str:=New object:C1471("pattern";$pattern_t;"string";Form:C1466.testSelected.pattern;"string_for_replacement";$text_substitute_t)
		$result_obj:=$regex.matches($str)
		If ($result_obj.success)
			$0:=$result_obj.string_extracted[2]
		Else 
			$0:=Form:C1466.testSelected.pattern
		End if 
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 



