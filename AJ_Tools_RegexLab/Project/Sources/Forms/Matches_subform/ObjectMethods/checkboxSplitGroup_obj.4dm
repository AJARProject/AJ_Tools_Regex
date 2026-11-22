

var $evt : Integer
$evt:=Form event code
Case of 
	: ($evt=On Load)
		
	: ($evt=On Clicked)
		CALL SUBFORM CONTAINER(-10200)
		
End case 

