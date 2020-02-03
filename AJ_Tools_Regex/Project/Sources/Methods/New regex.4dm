//%attributes = {"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 19.10.18, 18:15:04
  // ----------------------------------------------------
  // Method: New Regex
  // Description
  // 
  // Object builder to call regex methods
  // 
  // ----------------------------------------------------
C_OBJECT:C1216($0;$regex)
  // regex object include formula for : match, substitute, split, extract
$regex:=New object:C1471
$regex.match:=Formula:C1597(Match ($1))
$regex.matches:=Formula:C1597(Matches ($1))
$regex.substitute:=Formula:C1597(Substitute ($1))
$regex.split:=Formula:C1597(Split ($1))
$regex.extract:=Formula:C1597(Extract ($1))

$0:=$regex