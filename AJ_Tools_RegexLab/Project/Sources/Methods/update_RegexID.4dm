//%attributes = {}
  // MI 13-Nov-2018 09:03:46 (GMT+1)

var $data_obj; $item : Object
$data_obj:=RegexLab_load_data 
Form.full_examples:=$data_obj.full_examples

For each ($item;Form.full_examples)
	
	$item.regexID:=Generate UUID
	
End for each 

Form.examples:=Form.full_examples.query("function = :1";Form.testSelected.function)

RegexLab_save_data 