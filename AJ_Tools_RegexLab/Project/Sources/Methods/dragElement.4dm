//%attributes = {}
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 24.03.10, 10:57:02
  // ----------------------------------------------------
  // Method: dragElement
  // Description
  //
  //
  // Parameters
  // ----------------------------------------------------


#DECLARE($param1 : Integer; $param2 : Text; $param3 : Text; $param4 : Text)

var $_tabctrl_ptr : Pointer
var $itemPos_l; $itemRef_l; $itemSubList_l : Integer
var $itemText_t; $myText2_t; $myText_t; $myTextReplacement_t : Text
var $itemSubExpanded_b : Boolean



$itemText_t:=Form.tab.values[Form.tab.index]  // selected tab


Case of 
	: ($itemText_t="Match")  //Match
		
		If (Position("fr";Get database localization)>0)  //C'est du français
			
			
		Else   //This is english
			
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form.testSelected.target)+"\n$result:=$regex.match($str)"
		End if 
		
	: ($itemText_t="Matches")  //Match
		
		If (Position("fr";Get database localization)>0)  //C'est du français
			
			
		Else   //This is english
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form.testSelected.target)+"\n$result:=$regex.matches($str)"
		End if 
		
		
	: ($itemText_t="Substitute")  //Substitution
		
		
		If (Position("fr";Get database localization)>0)  //C'est du français
			
		Else   //This is english code
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form.testSelected.target)+"\n"
			$myText2_t:=$myText2_t+"$str.string_for_replacement:="+convert_escape_character (Form.testSelected.replacement)+"\n"
			$myText2_t:=$myText2_t+"$result:=$regex.subsitute($str)"
		End if 
		
		
		
	: ($itemText_t="Split")  //Splitting
		
		If (Position("fr";Get database localization)>0)  //C'est du français
			
		Else   //c'est en anglais
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form.testSelected.target)+"\n$result:=$regex.split($str)"
		End if 
		
		
	: ($itemText_t="Extract")  //Extracting
		
		If (Position("fr";Get database localization)>0)  //C'est du français
			
		Else   //c'est en anglais
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form.testSelected.target)+"\n"
			$myText2_t:=$myText2_t+"$str.group:=New collection\n"
			$myText2_t:=$myText2_t+"$str.group:=Split string("+convert_escape_character (Form.testSelected.groupList)+";"+"\",\""+";sk ignore empty strings)\n"
			$myText2_t:=$myText2_t+"$result:=$regex.extract($str)"
			
		End if 
		
		
		
	Else 
		BEEP
		
		TRACE
		
End case 

SET TEXT TO PASTEBOARD($myText2_t)

  //--------------------------------------------------------
  //Réinitialisation des diverses variables et tableaux
$myText_t:=""
$myText2_t:=""
$myTextReplacement_t:=""

  //--------------------------------------------------------






