//%attributes = {}
C_LONGINT:C283($itemRef_l)
ARRAY LONGINT:C221($_Pos_l;0)

$itemRef_l:=Find in list:C952(Form:C1466.tab;Form:C1466.current_function;0;$_Pos_l)  // get the ref
SELECT LIST ITEMS BY REFERENCE:C630(Form:C1466.tab;$itemRef_l)