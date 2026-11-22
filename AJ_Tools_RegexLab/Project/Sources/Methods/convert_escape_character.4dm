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



#DECLARE($param1 : Text) -> $result : Text

var $string_t : Text
$string_t:=$param1
$string_t:=Replace string($string_t;"\\";"\\\\")
$string_t:=Replace string($string_t;Char(34);Char(92)+Char(34))
$string_t:=Replace string($string_t;"\r";"\\r")  // CR -> \r in the generated literal
$string_t:=Replace string($string_t;"\n";"\\n")  // LF -> \n
$string_t:=Replace string($string_t;"\t";"\\t")  // tab -> \t
$result:="\""+$string_t+"\""


  // $test:=JSON Stringify($1) ! missing : \n -> \\n , \r -> \\r
