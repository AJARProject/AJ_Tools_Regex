# AJ_Tools_Regex

"AJ_Tools_Regex" is a component that will add powerful text functions by using regular expression. "Regex Lab" uses the new command Match Regex provided with 4D V11 SQL.

AJ_Tools_RegexLab is the application for your tests. Test

## Getting Started

The Match, Matches, Substitute, Split and Extract functions are now separated from the test interface to lighten the component. To benefit from these functions, simply includes the 4D regex.4dbase component in your 4D app.

All these functions are thread safe and are not mutating.

### `match (object) -> object_result`

Searches the input string for the first occurrence of the specified regular expression

    C_OBJECT($regex)
     $regex:=New regex
     C_OBJECT($str;$result)
     $str:=New object
     $str.pattern:="[:xdigit:]{8}-[:xdigit:]{4}-[:xdigit:] {4}-[:xdigit:]{4}-[:xdigit:]{12}"
     $str.string:="6C7122D2-8986-41E8-8B3D-D50786486706"
     $result:=$regex.match($str)

##### `$result` is an object with these properties :

- success: (boolean) True if the expression is resolved. else False
- string_extracted: (collection) - (text) Result of the regex extraction(s)
- position: (collection) - (longint) Position of the text(s) extracted
- length: (collection) - (longint) Length of the text(s) extracted
- listbox (collection of objects) for directly use with a 4D Listbox (see regexLab 5)

### `matches (object) -> object_result`

Searches the specified input string for all occurrences of a regular expression.

    C_OBJECT($regex)
    $regex:=New regex
    C_OBJECT($str;$result)
    $str:=New object
    $str.pattern:="ISBN(?:-13)?:?\\ _(97(?:8|9)([ -]?)(?=\\d{1,5}\\2?\\d{1,7}\\2?\\d{1,6}\\2?\\d)(?:\\d\\2_){9}\\d)"
    $str.string:="ISBN 9790765335999\\nISBN-13: 978-0615-856-73-5\\nISBN-13: 978-0615856735"
    $result:=$regex.matches($str)

##### `$result` is an object with these properties :

- success: (boolean) True if the expression is resolved. else False
- string_extracted: (collection) - (text) Result of the regex extraction(s)
- position: (collection) - (longint) Position of the text(s) extracted
- length: (collection) - (longint) Length of the text(s) extracted
- group: (collection) - (longint) Contains the capture group number of the corresponding text_extracted collection element
- listbox (collection of objects) for directly use with a 4D Listbox (see regexLab 5)

### `substitute (object) -> object_result`

In a specified input string, replaces all substrings that match a specified regular expression with a specified replacement string.

    C_OBJECT($regex)
    $regex:=New regex
    C_OBJECT($str;$result)
    $str:=New object
    $str.pattern:="([ab]+)\\1"
    $str.string:="\"abab\" but not \"abaab\""
    $str.string_for_replacement:="\\1"
    $result:=$regex.subsitute(\$str)

##### `$result` is an object with these properties :

- success: (boolean) True if the expression is resolved. else False
- string_resulting: (text) - (text) Result of the regex extraction(s)
- string_match: (collection) - (text) string(s) which match the pattern
- position: (collection) - (longint) Position of the text(s) extracted
- length: (collection) - (longint) Length of the text(s) extracted
- group: (collection) - (longint) Contains the capture group number of the matched strings collection element
- listbox (collection of objects) for directly use with a 4D Listbox (see regexLab 5)

### `split (object) -> object_result`

The Regex.Split methods are similar to the Split string function, except that regex.split splits the string at a delimiter determined by a regular expression instead of a set of characters. The string is split as many times as possible. If no delimiter is found, the return value contains one element whose value is the original input string.

    C_OBJECT($regex)
    $regex:=New regex
    C_OBJECT($str;$result)
    $str:=New object
    $str.pattern:="(\\W)(\\w+)\\1"
    $str.string:="Maurice AND Javascript OR 4D"
    $result:=$regex.split($str)

##### `$result` is an object with these properties :

### `extract(object) -> object_result`

Extracts all matches of a regular expression in a text.

    C_OBJECT($regex)
    $regex:=New regex
    C_OBJECT($str;$result)
    $str:=New object
    $str.pattern:="(?m)(,|\\r?\\n|^)([^\",\\r\\n]+|\"(?:[^\"]|\"\")\*\"|)"
    $str.string:="aaa,b b,\"\"\"c\"\" cc\"\\n1,,\"333\",\"12,45,45\",three,\\nstill more threes"
    $str.group:=New collection
    $str.group:=Split string("2";,;sk ignore empty strings)
    $result:=$regex.extract($str)

##### `$result` is an object with these properties :

- success: (boolean) True if the expression is resolved. else False
- string_extracted: (collection) - (text) string(s) which match the pattern and part of the group(s)
- position: (collection) - (longint) Position of the text(s) extracted
- length: (collection) - (longint) Length of the text(s) extracted
- group: (collection) - (longint) Contains the capture group number of the matched strings collection element
- listbox (collection of objects) for directly use with a 4D Listbox (see regexLab 5)
