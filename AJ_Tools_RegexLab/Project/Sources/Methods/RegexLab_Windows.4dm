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

C_LONGINT:C283($proc_State_l;$proc_uptime_l;$process_id_l;$window_id_l)
C_TEXT:C284($form_Name_t;$method_t;$process_t;$proc_Name_t)
C_OBJECT:C1216($init_obj)




$method_t:="Regex_Lab"
$process_t:=$method_t

PROCESS PROPERTIES:C336(Current process:C322;$proc_Name_t;$proc_State_l;$proc_uptime_l)

If ($proc_Name_t#$process_t)
	$process_id_l:=New process:C317(Current method name:C684;64*1024;$process_t;*)  // Stack size 8 Ko -> 64 Ko
	BRING TO FRONT:C326($process_id_l)
Else 
	
	RegexLab_Menu ("release")
	RegexLab_Menu ("install")
	$form_Name_t:="RegexLab_form"
	
	$init_obj:=RegexLab_Init 
	
	$window_id_l:=Open form window:C675($form_Name_t;Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4;*)
	DIALOG:C40($form_Name_t;$init_obj)
	CLOSE WINDOW:C154
	
End if 