  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 25.03.10, 10:37:31
  // ----------------------------------------------------
  // Method: 
  // Description
  // 
  //
  // Parameters
  // ----------------------------------------------------




// Copies the 4D code for the current example to the clipboard (see dragElement),
// then shows the "clipboard full" thumbnail of presse-papiers.png
// (thumbnails numbered from 0: 0 empty, 1 clicked, 2 full, 3 disabled).
// Removed: pointer to obj_PPReplacement (object no longer in the form, Null pointer error 85)
// and OBJECT SET FORMAT "?2075" (picture library reference from the binary base).
dragElement(Form event code; Form.testSelected.pattern; Form.testSelected.replacement; "Pattern")
If (Get text from pasteboard#"")
	// The form sets "Switch back when released" (flag 32), which brings the button back
	// to thumbnail 0 on release. As the original code did with "?2075;0", drop that flag
	// (keep only 128 = last frame as disabled) so thumbnail 2 stays displayed.
	OBJECT SET FORMAT(*; "obj_PPPattern"; "1;4;#Images/library/presse-papiers.png;128")
	OBJECT SET VALUE("obj_PPPattern"; 2)
End if 
