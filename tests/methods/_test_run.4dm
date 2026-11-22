//%attributes = {"invisible":true,"shared":false}
// Behaviour harness: runs every case of tests_cases.json through New regex and writes tests_result.json.
var $cases; $out : Collection
var $case; $req; $res; $r; $info : Object
var $root; $fn : Text
var testErr : Integer
var testMsg : Text
$root:=Get 4D folder(Database folder)
$cases:=JSON Parse(Document to text($root+"tests_cases.json"; "UTF-8"))
$out:=New collection
ON ERR CALL("_test_onerr")
$r:=New regex
For each ($case; $cases)
	testErr:=0
	testMsg:=""
	$res:=Null
	If ($case.req=Null)
		$req:=Null
	Else 
		$req:=OB Copy($case.req)
	End if 
	$fn:=$case.fn
	$res:=$r[$fn]($req)
	$out.push(New object("id"; $case.id; "fn"; $fn; "result"; $res; "reqAfter"; $req; "err"; testErr; "errMsg"; testMsg))
End for each 
ON ERR CALL("")
TEXT TO DOCUMENT($root+"tests_result.json"; JSON Stringify($out; *))
QUIT 4D
