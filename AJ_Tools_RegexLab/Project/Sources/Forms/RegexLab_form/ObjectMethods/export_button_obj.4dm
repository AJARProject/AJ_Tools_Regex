C_TEXT:C284($exportFileName_t;$filename_t)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.examples.length#0)
			$exportFileName_t:=String:C10(Current date:C33;ISO date:K1:8;Current time:C178)  //returns 2010-09-13T00:00:00 
			  //$exportFileName_t:=Substring($exportFileName_t;1;Position("T";$exportFileName_t)-1)
			$exportFileName_t:=Replace string:C233($exportFileName_t;":";"-")
			
			$filename_t:=Request:C163("Filename:";"regexLab_"+$exportFileName_t)
			If (Position:C15(".json";$filename_t)<=0)
				$filename_t:=$filename_t+".json"
			End if 
			RegexLab_save_data ($filename_t)
		End if 
End case 