
var $exportFileName_t; $filename_t : Text
Case of 
	: (Form event code=On Load)
		
	: (Form event code=On Clicked)
		If (Form.examples.length#0)
			$exportFileName_t:=String(Current date;ISO date;Current time)  //returns 2010-09-13T00:00:00 
			  //$exportFileName_t:=Substring($exportFileName_t;1;Position("T";$exportFileName_t)-1)
			$exportFileName_t:=Replace string($exportFileName_t;":";"-")
			
			$filename_t:=Request("Filename:";"regexLab_"+$exportFileName_t)
			If (Position(".json";$filename_t)<=0)
				$filename_t:=$filename_t+".json"
			End if 
			RegexLab_save_data ($filename_t)
		End if 
End case 