//%attributes = {"invisible":true,"shared":false}
var $e : Collection
testErr:=Error
testMsg:=""
$e:=Last errors
If ($e#Null)
	If ($e.length>0)
		testMsg:=String($e[0].errCode)+" "+String($e[0].message)
	End if 
End if 
