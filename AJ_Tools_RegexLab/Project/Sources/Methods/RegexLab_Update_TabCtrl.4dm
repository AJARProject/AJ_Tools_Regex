//%attributes = {}
var $itemRef_l : Integer
ARRAY LONGINT($_Pos_l;0)

$itemRef_l:=Find in list(Form.tab;Form.current_function;0;$_Pos_l)  // get the ref
SELECT LIST ITEMS BY REFERENCE(Form.tab;$itemRef_l)