//%attributes = {}
  // ----------------------------------------------------
  // Method : MNU_RELEASE_MENU
  // Created 21/07/06 by vdl
  // ----------------------------------------------------
  // Description
  // Clears from memory  the menu $1 and all menu called from this one
  //----------------------------------------------------


#DECLARE($param1 : Text)

var $vt_menu : Text
var $vl_indice : Integer
ARRAY TEXT($tt_Labels;0)
ARRAY TEXT($tt_References;0)


$vt_menu:=$param1


If (Length($vt_menu)>0)
	GET MENU ITEMS($vt_menu;$tt_Labels;$tt_References)
	For ($vl_indice;1;Size of array($tt_References);1)
		If (Length($tt_References{$vl_indice})>0)
			MNU_RELEASE_MENU ($tt_References{$vl_indice})  //<-- Recursive
		End if 
	End for 
	RELEASE MENU($vt_menu)
End if 
