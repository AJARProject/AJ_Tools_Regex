//%attributes = {}



var $regex_obj; $str_obj : Object
var $itemText_t; $vt_loop; $separator_t : Text
var $vp_button_valid_ptr : Pointer
var $vl_loop; $vl_depart_timer; $vl_indice; $vl_stop_timer; $vl_time_spent; $vr_secondes : Integer
var $temp_col : Collection
$regex_obj:=New regex 
$str_obj:=New object


  //$itemPos_l:=Selected list items(Form.tab)
  //GET LIST ITEM(Form.tab;$itemPos_l;$itemRef_l;$itemText_t;$itemSubList_l;$itemSubExpanded_b)

$itemText_t:=Form.current_function

If ((Form.testSelected.pattern#"") & (Form.testSelected.target#""))
	
	$vp_button_valid_ptr:=OBJECT Get pointer(Object named;"obj_button_valid")
	
	Case of 
		: ($itemText_t="Match")  //Match
			$str_obj.pattern:=Form.testSelected.pattern
			$str_obj.string:=Form.testSelected.target
			
			If (Windows Alt down)  // Speed test with Loop X
				$vt_loop:=Request("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num($vt_loop)
				$vl_depart_timer:=Milliseconds
				For ($vl_indice;1;$vl_loop)
					Form.testSelected.result:=$regex_obj.match($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT("Time spent  : "+String($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form.testSelected.result:=$regex_obj.match($str_obj)
			End if 
			
			OBJECT SET SUBFORM(*;"listbox_subform";"Match_subform")  //update the subform
			
		: ($itemText_t="Matches")  //Matching
			
			$str_obj.pattern:=Form.testSelected.pattern
			$str_obj.string:=Form.testSelected.target
			
			If (Windows Alt down)  // Speed test with Loop X
				$vt_loop:=Request("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num($vt_loop)
				$vl_depart_timer:=Milliseconds
				For ($vl_indice;1;$vl_loop)
					Form.testSelected.result:=$regex_obj.matches($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT("Time spent  : "+String($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form.testSelected.result:=$regex_obj.matches($str_obj)
			End if 
			
			OBJECT SET SUBFORM(*;"listbox_subform";"Matches_subform")  //update the subform
			If (Form.testSelected.captureSplitGroups=Null)
				Form.testSelected.captureSplitGroups:=0
			End if 
			If (Form.testSelected.captureSplitGroups=0)
				$temp_col:=New collection
				  // filtering only gropup Zero
				$temp_col.combine(Form.testSelected.result.listbox.query("group = :1";0))
				Form.testSelected.result.listbox:=$temp_col
			End if 
			
			
		: ($itemText_t="Substitute")  //Substitution
			$str_obj.pattern:=Form.testSelected.pattern
			$str_obj.string:=Form.testSelected.target
			$str_obj.string_for_replacement:=Form.testSelected.replacement
			
			If (Windows Alt down)  // Speed test with Loop X
				$vt_loop:=Request("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num($vt_loop)
				$vl_depart_timer:=Milliseconds
				For ($vl_indice;1;$vl_loop)
					Form.testSelected.result:=$regex_obj.substitute($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT("Time spent  : "+String($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form.testSelected.result:=$regex_obj.substitute($str_obj)
			End if 
			
			OBJECT SET SUBFORM(*;"listbox_subform";"Substitute_subform")  //update the subform
			
		: ($itemText_t="Split")  //Splitting
			$str_obj.pattern:=Form.testSelected.pattern
			$str_obj.string:=Form.testSelected.target
			
			If (Windows Alt down)  // Speed test with Loop X
				$vt_loop:=Request("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num($vt_loop)
				$vl_depart_timer:=Milliseconds
				For ($vl_indice;1;$vl_loop)
					Form.testSelected.result:=$regex_obj.split($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT("Time spent  : "+String($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form.testSelected.result:=$regex_obj.split($str_obj)
			End if 
			
			OBJECT SET SUBFORM(*;"listbox_subform";"Split_subform")  //update the subform
			
		: ($itemText_t="Extract")  //Extracting
			$str_obj.pattern:=Form.testSelected.pattern
			$str_obj.string:=Form.testSelected.target
			$str_obj.group:=New collection
			$separator_t:=","
			$str_obj.group:=Split string(Form.testSelected.groupList;$separator_t;sk ignore empty strings)
			
			If (Windows Alt down)  // Speed test with Loop X
				$vt_loop:=Request("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num($vt_loop)
				$vl_depart_timer:=Milliseconds
				For ($vl_indice;1;$vl_loop)
					Form.testSelected.result:=$regex_obj.extract($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT("Time spent  : "+String($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form.testSelected.result:=$regex_obj.extract($str_obj)
			End if 
			
			OBJECT SET SUBFORM(*;"listbox_subform";"Extract_subform")  //update the subform
	End case 
	
	RegexLab_buttonValid (Form.testSelected.result.success)
	
Else 
	OBJECT SET VISIBLE(*;"obj_button_valid";False)
End if 



If (Form.testSelected.result.success)
	  // Regex OK
Else 
	  //Regex Not OK
End if 


