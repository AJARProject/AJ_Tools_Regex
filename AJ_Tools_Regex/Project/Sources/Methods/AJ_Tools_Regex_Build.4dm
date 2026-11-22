//%attributes = {"invisible":true}
// AJ_Tools_Regex_Build
// FR : compile le composant (Intel + Apple Silicon) puis le construit avec
//      Settings/buildApp.4DSettings -> Components/AJ_Tools_Regex.4dbase (signé ad hoc).
//      Le résultat est écrit dans build_result.txt (dossier du projet).
// EN: compiles the component (Intel + Apple Silicon) then builds it with
//     Settings/buildApp.4DSettings -> Components/AJ_Tools_Regex.4dbase (ad hoc signed).
//     The result is written to build_result.txt (project folder).
// Sans interface / headless:
//   4D --project <path>/AJ_Tools_Regex.4DProject --headless --dataless --startup-method AJ_Tools_Regex_Build
#DECLARE()

var $root; $log : Text
var $compile : Object

$root:=Get 4D folder(Database folder)
$compile:=Compile project(New object("targets"; New collection("x86_64_generic"; "arm64_macOS_lib")))
If ($compile.success)
	BUILD APPLICATION($root+"Settings"+Folder separator+"buildApp.4DSettings")
	$log:="compile OK - BUILD APPLICATION OK="+String(OK)
Else 
	$log:="compile failed: "+JSON Stringify($compile.errors)
End if 
TEXT TO DOCUMENT($root+"build_result.txt"; $log)

If (Application info.headless)
	QUIT 4D
Else 
	ALERT($log)
End if 
