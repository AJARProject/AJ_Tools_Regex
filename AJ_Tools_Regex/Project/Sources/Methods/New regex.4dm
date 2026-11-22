//%attributes = {"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// User name (OS): Maurice Inzirillo
// Date and time: 19.10.18, 18:15:04
// ----------------------------------------------------
// Method: New regex
// Description
//
// Object builder to call regex methods
// The returned object contains formulas for: match, matches, substitute, split, extract
//
// ----------------------------------------------------
#DECLARE() : Object

var $regex : Object

$regex:=New object
$regex.match:=Formula(Match($1))
$regex.matches:=Formula(Matches($1))
$regex.substitute:=Formula(Substitute($1))
$regex.split:=Formula(Split($1))
$regex.extract:=Formula(Extract($1))

return $regex
