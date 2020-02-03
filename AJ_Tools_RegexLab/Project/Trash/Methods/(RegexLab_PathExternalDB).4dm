//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Maurice Inzirillo
  // Date and time: 08.02.11, 17:10:25
  // ----------------------------------------------------
  // Method: RegexLab_PathExternalDB
  // Description
  // This External DB is located, according to the Active 4D Folder  
  // On Windows Vista/Windows 7: {Disk}:\Users\Current user\AppData\Roaming\4D
  // On Windows XP:{Disk}: \Documents and Settings\Current user\Application Data\4D
  // On Mac OS:{Disk}:Users:Current user:Library:Application Support:4D
  // see : http://doc.4d.com/4Dv14.1/help/Command/en/page485.html
  //
  // Parameters
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1;$4DFile_name_t)
C_TEXT:C284($2;$4DVersion_t)
C_TEXT:C284($path_t)

$4DFile_name_t:=$1
$4DVersion_t:=$2

$path_t:=Get 4D folder:C485(Active 4D Folder:K5:10)+"RegexLab"+String:C10(Num:C11($4DVersion_t)-10)+Folder separator:K24:12  //Get the RegexLabX path

If (Test path name:C476($path_t)#Is a folder:K24:2)
	
	CREATE FOLDER:C475($path_t)
	
	  // now we try to get the previous external DB - This external DB was introduced with RegexLab 2 with 4D v12
	$release_l:=Num:C11($4DVersion_t)-10
	
	For ($indice_l;$release_l;2;-1)
		
		$pathold_4DD_t:=Get 4D folder:C485(Active 4D Folder:K5:10)+"RegexLab"+String:C10($indice_l)+Folder separator:K24:12+$4DFile_name_t+".4DD"
		$pathold_4DB_t:=Get 4D folder:C485(Active 4D Folder:K5:10)+"RegexLab"+String:C10($indice_l)+Folder separator:K24:12+$4DFile_name_t+".4DB"
		$pathold_Match_t:=Get 4D folder:C485(Active 4D Folder:K5:10)+"RegexLab"+String:C10($indice_l)+Folder separator:K24:12+$4DFile_name_t+".Match"
		
		If (Test path name:C476($pathold_4DD_t)=Is a document:K24:1)
			  // If there is an old RegexDB available then I copy it in the current RegexLabX Directory
			COPY DOCUMENT:C541($pathold_4DD_t;$path_t)
			COPY DOCUMENT:C541($pathold_4DB_t;$path_t)
			COPY DOCUMENT:C541($pathold_Match_t;$path_t)
			
			$indice_l:=2  // break
			
		End if 
		
	End for 
	
	
End if 


$0:=$path_t+$4DFile_name_t