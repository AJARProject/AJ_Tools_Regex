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
C_LONGINT:C283($1)  // Event form
C_TEXT:C284($2)  // Expression
C_TEXT:C284($3)  //
C_TEXT:C284($4)

C_POINTER:C301($_tabctrl_ptr)

If (False:C215)
	C_LONGINT:C283(dragElement ;$1)
	C_TEXT:C284(dragElement ;$2)
	C_TEXT:C284(dragElement ;$3)
	C_TEXT:C284(dragElement ;$4)
End if 



$itemPos_l:=Selected list items:C379(Form:C1466.tab)
GET LIST ITEM:C378(Form:C1466.tab;$itemPos_l;$itemRef_l;$itemText_t;$itemSubList_l;$itemSubExpanded_b)


Case of 
	: ($itemText_t="Match")  //Match
		
		If (Position:C15("fr";Get database localization:C1009)>0)  //C'est du français
			
			
		Else   //This is english
			
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form:C1466.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form:C1466.testSelected.target)+"\n$result:=$regex.match($str)"
		End if 
		
	: ($itemText_t="Matches")  //Match
		
		If (Position:C15("fr";Get database localization:C1009)>0)  //C'est du français
			
			
		Else   //This is english
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form:C1466.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form:C1466.testSelected.target)+"\n$result:=$regex.matches($str)"
		End if 
		
		
	: ($itemText_t="Substitute")  //Substitution
		
		
		If (Position:C15("fr";Get database localization:C1009)>0)  //C'est du français
			
		Else   //This is english code
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form:C1466.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form:C1466.testSelected.target)+"\n"
			$myText2_t:=$myText2_t+"$str.string_for_replacement:="+convert_escape_character (Form:C1466.testSelected.replacement)+"\n"
			$myText2_t:=$myText2_t+"$result:=$regex.subsitute($str)"
		End if 
		
		
		
	: ($itemText_t="Split")  //Splitting
		
		If (Position:C15("fr";Get database localization:C1009)>0)  //C'est du français
			
		Else   //c'est en anglais
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form:C1466.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form:C1466.testSelected.target)+"\n$result:=$regex.split($str)"
		End if 
		
		
	: ($itemText_t="Extract")  //Extracting
		
		If (Position:C15("fr";Get database localization:C1009)>0)  //C'est du français
			
		Else   //c'est en anglais
			$myText2_t:="C_OBJECT($regex)\n$regex:=New regex \nC_OBJECT($str;$result)\n"
			$myText2_t:=$myText2_t+"$str:=New object\n$str.pattern:="+convert_escape_character (Form:C1466.testSelected.pattern)+"\n"
			$myText2_t:=$myText2_t+"$str.string:="+convert_escape_character (Form:C1466.testSelected.target)+"\n"
			$myText2_t:=$myText2_t+"$str.group:=New collection\n"
			$myText2_t:=$myText2_t+"$str.group:=Split string("+convert_escape_character (Form:C1466.testSelected.groupList)+";"+"\",\""+";sk ignore empty strings)\n"
			$myText2_t:=$myText2_t+"$result:=$regex.extract($str)"
			
		End if 
		
		
		
	Else 
		BEEP:C151
		
		TRACE:C157
		
End case 

SET TEXT TO PASTEBOARD:C523($myText2_t)

  //--------------------------------------------------------
  //Réinitialisation des diverses variables et tableaux
$myText_t:=""
$myText2_t:=""
$myTextReplacement_t:=""

  //--------------------------------------------------------






