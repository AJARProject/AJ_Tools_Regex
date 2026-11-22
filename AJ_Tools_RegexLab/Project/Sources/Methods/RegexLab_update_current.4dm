//%attributes = {}
  // MI 27-Nov-2018 09:49:37 (GMT+1)
var $itemPos_l; $itemRef_l; $itemSubList_l; $index : Integer
var $itemText_t : Text
var $itemSubExpanded_b : Boolean
var $c : Collection
$itemPos_l:=Selected list items(Form.tab)
GET LIST ITEM(Form.tab;$itemPos_l;$itemRef_l;$itemText_t;$itemSubList_l;$itemSubExpanded_b)
$c:=Form.current
$index:=$c.findIndex("findFunction";$itemText_t)
Form.current[$index].name:=Form.testSelected.name