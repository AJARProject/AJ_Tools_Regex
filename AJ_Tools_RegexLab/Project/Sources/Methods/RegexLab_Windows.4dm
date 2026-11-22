//%attributes = {"shared":true}
  // ----------------------------------------------------
  // Nom utilisateur (OS) : Maurice Inzirillo
  // Date et heure : 29.08.07, 18:14:45
  // ----------------------------------------------------
  // Méthode : RegexLab_Windows
  // Description
  //
  //
  // Paramètres
  // ----------------------------------------------------





var $process_id_l; $window_id_l : Integer
var $form_Name_t; $method_t; $process_t; $proc_Name_t : Text
var $init_obj : Object
$method_t:="Regex_Lab"
$process_t:=$method_t

$proc_Name_t:=Process info(Current process).name  // was PROCESS PROPERTIES (obsolete in 4D 21 R4)

If ($proc_Name_t#$process_t)
	$process_id_l:=New process(Current method name;64*1024;$process_t;*)  // Stack size 8 Ko -> 64 Ko
	BRING TO FRONT($process_id_l)
Else 
	
	RegexLab_Menu ("release")
	RegexLab_Menu ("install")
	$form_Name_t:="RegexLab_form"
	
	$init_obj:=RegexLab_Init 
	
	$window_id_l:=Open form window($form_Name_t;Plain form window;Horizontally centered;Vertically centered;*)
	DIALOG($form_Name_t;$init_obj)
	CLOSE WINDOW
	
End if 