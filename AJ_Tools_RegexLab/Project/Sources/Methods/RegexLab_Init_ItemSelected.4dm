//%attributes = {}
  // RegexLab_Init_ItemSelected -> object
  //
  // collection : (object) init testSelected object

#DECLARE() -> $result : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 25.10.18, 13:52:05
	  // Modified by: Gary Criblez (27.11.2018)
	  // ----------------------------------------------------
	  // Method: RegexLab_Init_ItemSelected
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

var $testSelected_obj : Object

$testSelected_obj:=New object

  //init property
$testSelected_obj.description:=""
$testSelected_obj.name:=""
$testSelected_obj.pattern:=""
$testSelected_obj.target:=""
$testSelected_obj.groupList:=""
$testSelected_obj.replacement:=""

$result:=$testSelected_obj