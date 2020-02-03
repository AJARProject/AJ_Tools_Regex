//%attributes = {"shared":true}
  // MIT Licence http://en.wikipedia.org/wiki/MIT_License
  //
  //Copyright 2018 Maurice Inzirillo - AJAR SA
  //http://www.ajar.ch
  //
  //Permission is hereby granted, free of charge, to any person obtaining
  //a copy of this software and associated documentation files (the
  //"Software"), to deal in the Software without restriction, including
  //without limitation the rights to use, copy, modify, merge, publish,
  //distribute, sublicense, and/or sell copies of the Software, and to
  //permit persons to whom the Software is furnished to do so, subject to
  //the following conditions:
  //
  //The above copyright notice and this permission notice shall be
  //included in all copies or substantial portions of the Software.
  //
  //THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  //EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  //MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  //NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  //LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  //OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  //WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

C_LONGINT:C283($refWin)
C_TEXT:C284($licence_t)
C_OBJECT:C1216($o)

$licence_t:="<span style=\"text-align:left;font-family:'.SF NS Text';font-size:13pt\">MIT "\
+"Licence http://en.wikipedia.org/wiki/MIT_License<br/><br/>Copyright 2015-2018 "\
+"Maurice Inzirillo - AJAR SA - http://www.ajar.ch<br/><br/>Permission is hereby "\
+"granted, free of charge, to any person obtaining<br/>a copy of this software and "\
+"associated documentation files (the<br/>\"Software\"), to deal in the Software "\
+"without restriction, including<br/>without limitation the rights to use, copy, "\
+"modify, merge, publish,<br/>distribute, sublicense, and/or sell copies of the "\
+"Software, and to<br/>permit persons to whom the Software is furnished to do so, "\
+"subject to<br/>the following conditions:<br/><br/>The above copyright notice and "\
+"this permission notice shall be<br/>included in all copies or substantial "\
+"portions of the Software.<br/><br/><span style=\"font-weight:bold\">THE SOFTWARE "\
+"IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,<br/>EXPRESS OR IMPLIED, "\
+"INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br/>MERCHANTABILITY, FITNESS FOR "\
+"A PARTICULAR PURPOSE AND<br/>NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR "\
+"COPYRIGHT HOLDERS BE<br/>LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, "\
+"WHETHER IN AN ACTION<br/>OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR "\
+"IN CONNECTION<br/>WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE "\
+"SOFTWARE.</span></span>"
$o:=New object:C1471("licence";$licence_t)
$refWin:=Open form window:C675("regex_licence";Movable form dialog box:K39:8;Horizontally centered:K39:1;Vertically centered:K39:4)
DIALOG:C40("regex_licence";$o)