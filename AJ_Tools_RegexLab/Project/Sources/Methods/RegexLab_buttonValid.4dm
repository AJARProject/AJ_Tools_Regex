//%attributes = {}
  // RegexLab_buttonValid ( success )
  //
  // success : (Boolean) True is success

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 26.10.18, 11:07:57
	  // ----------------------------------------------------
	  // Method: RegexLab_buttonValid
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1)

C_BOOLEAN:C305($success_b)
C_POINTER:C301($obj_button_valid_ptr)


$obj_button_valid_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"obj_button_valid")
$success_b:=$1

If ($success_b)
	OBJECT SET VISIBLE:C603(*;"obj_button_valid";True:C214)
	$obj_button_valid_ptr->:=0
	OBJECT SET FORMAT:C236(*;"obj_button_valid";"1;4;#Common/Button.png;160")
Else 
	OBJECT SET VISIBLE:C603(*;"obj_button_valid";True:C214)
	$obj_button_valid_ptr->:=1
	OBJECT SET FORMAT:C236(*;"obj_button_valid";"1;4;#Common/Button.png;160")
End if 