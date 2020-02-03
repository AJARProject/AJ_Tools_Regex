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
C_TEXT:C284($regexVisualizer_t)
$regexVisualizer_t:=Storage:C1525.path.visualizer
WA SET PREFERENCE:C1041(*;"obj_WA_regexVis";WA enable Web inspector:K62:7;True:C214)
WA SET PREFERENCE:C1041(*;"obj_WA_regexVis";WA enable JavaScript:K62:4;True:C214)
WA SET PREFERENCE:C1041(*;"obj_WA_regexVis";WA enable contextual menu:K62:6;True:C214)
WA OPEN URL:C1020(*;"regex_visual_webarea_obj";$regexVisualizer_t)
