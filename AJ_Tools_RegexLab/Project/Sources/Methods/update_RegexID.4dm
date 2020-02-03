//%attributes = {}
C_OBJECT:C1216($data_obj;$item)
  // MI 13-Nov-2018 09:03:46 (GMT+1)

$data_obj:=RegexLab_load_data 
Form:C1466.full_examples:=$data_obj.full_examples

For each ($item;Form:C1466.full_examples)
	
	$item.regexID:=Generate UUID:C1066
	
End for each 

Form:C1466.examples:=Form:C1466.full_examples.query("function = :1";Form:C1466.testSelected.function)

RegexLab_save_data 