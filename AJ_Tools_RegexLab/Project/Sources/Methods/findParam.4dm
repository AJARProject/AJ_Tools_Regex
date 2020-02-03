//%attributes = {}
  // findFunction ( obj ; attribute ; value ) -> index
  //
  // obj : (Object):
  //   - value : element value to evaluate
  //   - result : true if find a first element
  // attribute : (Text) name attribute for search
  // value : (Text) value to search
  // 
  // index : (Longint) return Index of first value found, or -1 if not found

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 25.10.18, 16:46:57
	  // ----------------------------------------------------
	  // Method: findParam
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1)
C_TEXT:C284($2;$3)
$1.result:=$1.value[$2]=$3