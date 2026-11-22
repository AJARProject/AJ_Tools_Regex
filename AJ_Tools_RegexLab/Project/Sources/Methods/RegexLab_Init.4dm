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


#DECLARE() -> $result : Object

var $init_obj; $temp_obj : Object
var $tab : Integer
$init_obj:=New object

$tab:=New list
APPEND TO LIST($tab;"Match";1)
APPEND TO LIST($tab;"Matches";2)
APPEND TO LIST($tab;"Substitute";3)
APPEND TO LIST($tab;"Split";4)
APPEND TO LIST($tab;"Extract";5)
$init_obj.tab:=$tab


$init_obj.full_examples:=New collection
$init_obj.examples:=New collection

  // 1 simple example as a default regex test
$temp_obj:=RegexLab_Init_ItemSelected 
$temp_obj.name:="Path Window sample"
$temp_obj.description:="Check if a window path is correct"
$temp_obj.pattern:="\\b[a-zA-Z]:\\\\[^/:*?\"<>|\\r\\n]*"
$temp_obj.target:="C:\\Program Files\\4DBK Merchant"
$temp_obj.function:="Match"
$temp_obj.regexID:=Generate UUID  // not needed anymore
$init_obj.full_examples.push($temp_obj)

  // Path settings
Use (Storage)
	Storage.path:=New shared object
	Use (Storage.path)
		Storage.path.visualizer:=Get 4D folder(Current resources folder)+"visual"+Folder separator+"index.html"
		Storage.path.data:=Get 4D folder(Database folder)  // json/ and export/ are in the Lab folder (next to Project), not in the Data folder
	End use 
End use 


$result:=$init_obj