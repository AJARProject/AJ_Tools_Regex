//%attributes = {}


C_OBJECT:C1216($regex_obj;$str_obj)
C_TEXT:C284($itemText_t)

$regex_obj:=New regex 
$str_obj:=New object:C1471


  //$itemPos_l:=Selected list items(Form.tab)
  //GET LIST ITEM(Form.tab;$itemPos_l;$itemRef_l;$itemText_t;$itemSubList_l;$itemSubExpanded_b)

$itemText_t:=Form:C1466.current_function

If ((Form:C1466.testSelected.pattern#"") & (Form:C1466.testSelected.target#""))
	
	C_POINTER:C301($vp_button_valid_ptr)
	$vp_button_valid_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"obj_button_valid")
	
	Case of 
		: ($itemText_t="Match")  //Match
			$str_obj.pattern:=Form:C1466.testSelected.pattern
			$str_obj.string:=Form:C1466.testSelected.target
			
			If (Windows Alt down:C563)  // Speed test with Loop X
				$vt_loop:=Request:C163("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num:C11($vt_loop)
				$vl_depart_timer:=Milliseconds:C459
				For ($vl_indice;1;$vl_loop)
					Form:C1466.testSelected.result:=$regex_obj.match($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds:C459
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT:C41("Time spent  : "+String:C10($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form:C1466.testSelected.result:=$regex_obj.match($str_obj)
			End if 
			
			OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Match_subform")  //update the subform
			
		: ($itemText_t="Matches")  //Matching
			
			$str_obj.pattern:=Form:C1466.testSelected.pattern
			$str_obj.string:=Form:C1466.testSelected.target
			
			If (Windows Alt down:C563)  // Speed test with Loop X
				$vt_loop:=Request:C163("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num:C11($vt_loop)
				$vl_depart_timer:=Milliseconds:C459
				For ($vl_indice;1;$vl_loop)
					Form:C1466.testSelected.result:=$regex_obj.matches($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds:C459
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT:C41("Time spent  : "+String:C10($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form:C1466.testSelected.result:=$regex_obj.matches($str_obj)
			End if 
			
			OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Matches_subform")  //update the subform
			If (Form:C1466.testSelected.captureSplitGroups=Null:C1517)
				Form:C1466.testSelected.captureSplitGroups:=0
			End if 
			If (Form:C1466.testSelected.captureSplitGroups=0)
				$temp_col:=New collection:C1472
				  // filtering only gropup Zero
				$temp_col.combine(Form:C1466.testSelected.result.listbox.query("group = :1";0))
				Form:C1466.testSelected.result.listbox:=$temp_col
			End if 
			
			
		: ($itemText_t="Substitute")  //Substitution
			$str_obj.pattern:=Form:C1466.testSelected.pattern
			$str_obj.string:=Form:C1466.testSelected.target
			$str_obj.string_for_replacement:=Form:C1466.testSelected.replacement
			
			If (Windows Alt down:C563)  // Speed test with Loop X
				$vt_loop:=Request:C163("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num:C11($vt_loop)
				$vl_depart_timer:=Milliseconds:C459
				For ($vl_indice;1;$vl_loop)
					Form:C1466.testSelected.result:=$regex_obj.substitute($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds:C459
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT:C41("Time spent  : "+String:C10($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form:C1466.testSelected.result:=$regex_obj.substitute($str_obj)
			End if 
			
			OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Substitute_subform")  //update the subform
			
		: ($itemText_t="Split")  //Splitting
			$str_obj.pattern:=Form:C1466.testSelected.pattern
			$str_obj.string:=Form:C1466.testSelected.target
			
			If (Windows Alt down:C563)  // Speed test with Loop X
				$vt_loop:=Request:C163("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num:C11($vt_loop)
				$vl_depart_timer:=Milliseconds:C459
				For ($vl_indice;1;$vl_loop)
					Form:C1466.testSelected.result:=$regex_obj.split($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds:C459
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT:C41("Time spent  : "+String:C10($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form:C1466.testSelected.result:=$regex_obj.split($str_obj)
			End if 
			
			OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Split_subform")  //update the subform
			
		: ($itemText_t="Extract")  //Extracting
			$str_obj.pattern:=Form:C1466.testSelected.pattern
			$str_obj.string:=Form:C1466.testSelected.target
			$str_obj.group:=New collection:C1472
			$separator_t:=","
			$str_obj.group:=Split string:C1554(Form:C1466.testSelected.groupList;$separator_t;sk ignore empty strings:K86:1)
			
			If (Windows Alt down:C563)  // Speed test with Loop X
				$vt_loop:=Request:C163("How many loop ?";"1";"Start !";"Cancel")
				$vl_loop:=Num:C11($vt_loop)
				$vl_depart_timer:=Milliseconds:C459
				For ($vl_indice;1;$vl_loop)
					Form:C1466.testSelected.result:=$regex_obj.extract($str_obj)
				End for 
				$vl_stop_timer:=Milliseconds:C459
				$vl_time_spent:=$vl_stop_timer-$vl_depart_timer
				$vr_secondes:=$vl_time_spent/1000
				ALERT:C41("Time spent  : "+String:C10($vr_secondes;"###'###'##0.000")+" sec")
			Else 
				Form:C1466.testSelected.result:=$regex_obj.extract($str_obj)
			End if 
			
			OBJECT SET SUBFORM:C1138(*;"listbox_subform";"Extract_subform")  //update the subform
	End case 
	
	RegexLab_buttonValid (Form:C1466.testSelected.result.success)
	
Else 
	OBJECT SET VISIBLE:C603(*;"obj_button_valid";False:C215)
End if 



If (Form:C1466.testSelected.result.success)
	  // Regex OK
Else 
	  //Regex Not OK
End if 


