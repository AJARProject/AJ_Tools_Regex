//%attributes = {}
  // convert_escape_character ( string ) -> result
  // string : (text) test to stringify
  // result : (text) resulting text stringified for 4D Method
  // ----------------------------------------------------
  // Maurice Inzirillo
  // 14.09.07, 15:47:53
  // ----------------------------------------------------
  // Method : convert_escape_character
  // Description
  //
  //
  // Parameters
  // $1 : string
  // $0 : converted string
  // Modified by: Maurice Inzirillo (12.11.18)
  // added \r, and \n
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1;$string_t)



$string_t:=$1
$string_t:=Replace string:C233($string_t;"\\";"\\\\")
$string_t:=Replace string:C233($string_t;Char:C90(34);Char:C90(92)+Char:C90(34))
$string_t:=Replace string:C233($string_t;"\r";"\\\\r")
$string_t:=Replace string:C233($string_t;"\n";"\\\\n")
$0:="\""+$string_t+"\""


  // $test:=JSON Stringify($1) ! missing : \n -> \\n , \r -> \\r
