//%attributes = {}
  // RegexLab_Init_ItemSelected -> object
  //
  // collection : (object) init testSelected object

If (False:C215)
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

C_OBJECT:C1216($0;$testSelected_obj)

$testSelected_obj:=New object:C1471

  //init property
$testSelected_obj.description:=""
$testSelected_obj.name:=""
$testSelected_obj.pattern:=""
$testSelected_obj.target:=""
$testSelected_obj.groupList:=""
$testSelected_obj.replacement:=""

$0:=$testSelected_obj