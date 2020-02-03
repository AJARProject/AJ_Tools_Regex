//%attributes = {}
  // ----------------------------------------------------
  // Nom utilisateur (OS) : Gary Criblez
  // Date et heure : 29.11.18, 15:08:53
  // ----------------------------------------------------
  // Méthode : RegexLab_Init
  // Description
  // 
  //
  // Paramètres
  // ----------------------------------------------------

C_OBJECT:C1216($0;$init_obj)

$init_obj:=New object:C1471

$tab:=New list:C375
APPEND TO LIST:C376($tab;"Match";1)
APPEND TO LIST:C376($tab;"Matches";2)
APPEND TO LIST:C376($tab;"Substitute";3)
APPEND TO LIST:C376($tab;"Split";4)
APPEND TO LIST:C376($tab;"Extract";5)
$init_obj.tab:=$tab


$init_obj.full_examples:=New collection:C1472
$init_obj.examples:=New collection:C1472

  // 1 simple example as a default regex test
C_OBJECT:C1216($temp_obj)
$temp_obj:=RegexLab_Init_ItemSelected 
$temp_obj.name:="Path Window sample"
$temp_obj.description:="Check if a window path is correct"
$temp_obj.pattern:="\\b[a-zA-Z]:\\\\[^/:*?\"<>|\\r\\n]*"
$temp_obj.target:="C:\\Program Files\\4DBK Merchant"
$temp_obj.function:="Match"
$temp_obj.regexID:=Generate UUID:C1066  // not needed anymore
$init_obj.full_examples.push($temp_obj)

  // Path settings
Use (Storage:C1525)
	Storage:C1525.path:=New shared object:C1526
	Use (Storage:C1525.path)
		Storage:C1525.path.visualizer:=Get 4D folder:C485(Current resources folder:K5:16)+"visual"+Folder separator:K24:12+"index.html"
		Storage:C1525.path.data:=Get 4D folder:C485(Data folder:K5:33)
	End use 
End use 


$0:=$init_obj