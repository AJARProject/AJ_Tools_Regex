//%attributes = {}
  // ----------------------------------------------------
  // Nom utilisateur (OS) : Maurice Inzirillo
  // Date et heure : 04.10.07, 15:25:49
  // ----------------------------------------------------
  // Méthode : RegexLab_Menu
  // Description
  //
  //
  // Paramètres
  // ----------------------------------------------------
C_TEXT:C284($1)

C_TEXT:C284($vt_Menu;$vt_MenuBar;$vt_Txt_EntryPoint)


$vt_Txt_EntryPoint:=$1

Case of 
		  //_____________________________________________________
	: ($vt_Txt_EntryPoint="New")
		
		  //_____________________________________________________
	: ($vt_Txt_EntryPoint="Actions@")
		
		  //_____________________________________________________
	: ($vt_Txt_EntryPoint="update")
		
		  //_____________________________________________________
	: ($vt_Txt_EntryPoint="execute")
		
		  //_____________________________________________________________________
	: ($vt_Txt_EntryPoint="install")
		  //Create menu bar
		$vt_MenuBar:=Create menu:C408
		  //Create FILE menu
		$vt_Menu:=Create menu:C408
		
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonClose")  //Close
		SET MENU ITEM PARAMETER:C1004($vt_Menu;-1;"main_save_close")
		SET MENU ITEM SHORTCUT:C423($vt_Menu;-1;Character code:C91("W"))
		SET MENU ITEM METHOD:C982($vt_Menu;-1;"RegexLab_Close")
		  //Install FILE menu
		APPEND MENU ITEM:C411($vt_MenuBar;Get localized string:C991("CommonMenuFile");$vt_Menu)  //File
		  //Create EDIT menu
		$vt_Menu:=Create menu:C408
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemUndo")  //Undo
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";17)
		SET MENU ITEM SHORTCUT:C423($vt_Menu;-1;Character code:C91("Z"))
		APPEND MENU ITEM:C411($vt_Menu;"(-")
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemCut")  //Cut
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";18)
		SET MENU ITEM SHORTCUT:C423($vt_Menu;-1;Character code:C91("X"))
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_enable";1)
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemCopy")  //Copy
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";19)
		
		SET MENU ITEM SHORTCUT:C423($vt_Menu;-1;Character code:C91("C"))
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_enable";1)
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemPaste")  //Paste
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";20)
		
		SET MENU ITEM SHORTCUT:C423($vt_Menu;-1;Character code:C91("V"))
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_enable";1)
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemClear")  //Clear
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";21)
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemSelectAll")  //Select All
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";22)
		SET MENU ITEM SHORTCUT:C423($vt_Menu;-1;Character code:C91("A"))
		APPEND MENU ITEM:C411($vt_Menu;"(-")
		APPEND MENU ITEM:C411($vt_Menu;":xliff:CommonMenuItemShowClipboard")  //Show Clipboard
		SET MENU ITEM PROPERTY:C973($vt_Menu;-1;"4D_standard_action";23)
		  //  `Install EDIT menu
		APPEND MENU ITEM:C411($vt_MenuBar;Get localized string:C991("CommonMenuEdit");$vt_Menu)  //Edit
		  //Install Menu bar
		SET MENU BAR:C67($vt_MenuBar)
		  //_____________________________________________________________________
	: ($vt_Txt_EntryPoint="release")
		$vt_MenuBar:=Get menu bar reference:C979(Current process:C322)
		If ($vt_MenuBar#"")
			MNU_RELEASE_MENU ($vt_MenuBar)
		End if 
		  //_____________________________________________________________________
End case 
