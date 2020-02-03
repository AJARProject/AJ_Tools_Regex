//%attributes = {}
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 25.11.08, 16:23:46
  // ----------------------------------------------------
  // Method: RegexLab_Splitter_position
  // Description
  //
  //
  // Parameters
  // ----------------------------------------------------
C_LONGINT:C283($averageH_l;$averageV_l;$bottom_l;$indice_l;$left_l;$right_l;$top_l)


  //Splitters bullets

For ($indice_l;1;5)
	OBJECT GET COORDINATES:C663(*;"hSplitter_"+String:C10($indice_l);$left_l;$top_l;$right_l;$bottom_l)
	$averageH_l:=($left_l+$right_l)/2
	$averageV_l:=($top_l+$bottom_l)/2
	OBJECT MOVE:C664(*;"hBUllet_"+String:C10($indice_l);$averageH_l-4;$averageV_l-4;$averageH_l+4;$averageV_l+4;*)
End for 


OBJECT GET COORDINATES:C663(*;"vSplitter_1";$left_l;$top_l;$right_l;$bottom_l)
$averageH_l:=($left_l+$right_l)/2
$averageV_l:=($top_l+$bottom_l)/2
OBJECT MOVE:C664(*;"vBUllet_1";$averageH_l-4;$averageV_l-4;$averageH_l+4;$averageV_l+4;*)

OBJECT GET COORDINATES:C663(*;"listbox_Subform";$left_lb_l;$top_lb_l;$right_lb_l;$bottom_lb_l)
OBJECT SET COORDINATES:C1248(*;"listbox_Subform";$left_lb_l;$top_lb_l;<>right_lb_l;$bottom_lb_l)