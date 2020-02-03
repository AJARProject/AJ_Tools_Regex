//%attributes = {}
  // ----------------------------------------------------
  // Method : MNU_RELEASE_MENU
  // Created 21/07/06 by vdl
  // ----------------------------------------------------
  // Description
  // Clears from memory  the menu $1 and all menu called from this one
  //----------------------------------------------------
C_TEXT:C284($1;$vt_menu)

C_LONGINT:C283($vl_indice)

ARRAY TEXT:C222($tt_Labels;0)
ARRAY TEXT:C222($tt_References;0)


$vt_menu:=$1


If (Length:C16($vt_menu)>0)
	GET MENU ITEMS:C977($vt_menu;$tt_Labels;$tt_References)
	For ($vl_indice;1;Size of array:C274($tt_References);1)
		If (Length:C16($tt_References{$vl_indice})>0)
			MNU_RELEASE_MENU ($tt_References{$vl_indice})  //<-- Recursive
		End if 
	End for 
	RELEASE MENU:C978($vt_menu)
End if 
