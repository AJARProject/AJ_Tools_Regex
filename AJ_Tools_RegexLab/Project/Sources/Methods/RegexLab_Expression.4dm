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

#DECLARE() -> $result : Text

var $regex; $str; $result_obj : Object
var $pattern_t; $text_substitute_t : Text
$regex:=New regex 

$pattern_t:="(\\(\\?[ismwx-]+\\))(.*)"  //Motif (expression régulière)
$text_substitute_t:="\\2"


If (Form.testSelected#Null)
	If (Form.testSelected.pattern#Null)
		$str:=New object("pattern";$pattern_t;"string";Form.testSelected.pattern;"string_for_replacement";$text_substitute_t)
		$result_obj:=$regex.matches($str)
		If ($result_obj.success)
			$result:=$result_obj.string_extracted[2]
		Else 
			$result:=Form.testSelected.pattern
		End if 
	Else 
		$result:=""
	End if 
Else 
	$result:=""
End if 



