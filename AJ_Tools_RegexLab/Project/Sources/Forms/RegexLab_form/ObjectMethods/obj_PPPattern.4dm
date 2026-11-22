  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 25.03.10, 10:37:31
  // ----------------------------------------------------
  // Method: 
  // Description
  // 
  //
  // Parameters
  // ----------------------------------------------------




var $vp_Pattern_button; $vp_Replacement_button : Pointer
dragElement (Form event code;Form.testSelected.pattern;Form.testSelected.replacement;"Pattern")

  // clipboard button "pattern"
$vp_Pattern_button:=OBJECT Get pointer(Object named;"obj_PPPattern")
$vp_Pattern_button->:=2

  // clipboard button "replacement"
$vp_Replacement_button:=OBJECT Get pointer(Object named;"obj_PPReplacement")
$vp_Replacement_button->:=0

OBJECT SET FORMAT(*;"obj_PPPattern";"1;4;?2075;0")
OBJECT SET FORMAT(*;"obj_PPReplacement";"1;4;?2075;160")


