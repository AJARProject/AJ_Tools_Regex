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




dragElement (Form event code:C388;Form:C1466.testSelected.pattern;Form:C1466.testSelected.replacement;"Pattern")

  // clipboard button "pattern"
$vp_Pattern_button:=OBJECT Get pointer:C1124(Object named:K67:5;"obj_PPPattern")
$vp_Pattern_button->:=2

  // clipboard button "replacement"
$vp_Replacement_button:=OBJECT Get pointer:C1124(Object named:K67:5;"obj_PPReplacement")
$vp_Replacement_button->:=0

OBJECT SET FORMAT:C236(*;"obj_PPPattern";"1;4;?2075;0")
OBJECT SET FORMAT:C236(*;"obj_PPReplacement";"1;4;?2075;160")


