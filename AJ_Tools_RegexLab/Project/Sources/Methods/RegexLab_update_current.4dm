//%attributes = {}
C_LONGINT:C283($itemPos_l;$itemRef_l;$itemSubList_l)
C_TEXT:C284($itemText_t)
C_BOOLEAN:C305($itemSubExpanded_b)
  // MI 27-Nov-2018 09:49:37 (GMT+1)
$itemPos_l:=Selected list items:C379(Form:C1466.tab)
GET LIST ITEM:C378(Form:C1466.tab;$itemPos_l;$itemRef_l;$itemText_t;$itemSubList_l;$itemSubExpanded_b)
C_COLLECTION:C1488($c)
C_LONGINT:C283($index)
$c:=Form:C1466.current
$index:=$c.findIndex("findFunction";$itemText_t)
Form:C1466.current[$index].name:=Form:C1466.testSelected.name