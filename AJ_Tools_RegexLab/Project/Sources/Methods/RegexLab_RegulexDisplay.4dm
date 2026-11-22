//%attributes = {}
  // ----------------------------------------------------
  // Nom utilisateur (OS) : Maurice Inzirillo
  // Date et heure : 15.12.14, 11:30:14
  // ----------------------------------------------------
  // Méthode : RegexLab_RegulexDisplay
  // Description
  // Display the Regex rule in the web area using 
  //
  // Paramètres
  // ----------------------------------------------------
  // 
var $regexVisualizer_t : Text
$regexVisualizer_t:=Storage.path.visualizer
WA SET PREFERENCE(*;"regex_visual_webarea_obj";WA enable Web inspector;True)
WA SET PREFERENCE(*;"regex_visual_webarea_obj";WA enable contextual menu;True)
WA OPEN URL(*;"regex_visual_webarea_obj";$regexVisualizer_t)
