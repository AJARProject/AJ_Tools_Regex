//%attributes = {}
  // RegexLab_buttonValid ( success )
  //
  // success : (Boolean) True is success

#DECLARE($param1 : Boolean)

If (False)
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

var $success_b : Boolean
var $obj_button_valid_ptr : Pointer



$obj_button_valid_ptr:=OBJECT Get pointer(Object named;"obj_button_valid")
$success_b:=$param1

If ($success_b)
	OBJECT SET VISIBLE(*;"obj_button_valid";True)
	$obj_button_valid_ptr->:=0
	OBJECT SET FORMAT(*;"obj_button_valid";"1;4;#Common/Button.png;160")
Else 
	OBJECT SET VISIBLE(*;"obj_button_valid";True)
	$obj_button_valid_ptr->:=1
	OBJECT SET FORMAT(*;"obj_button_valid";"1;4;#Common/Button.png;160")
End if 