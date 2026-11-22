// Class: Regex  —  cs.AJRegex.Regex (host) / cs.Regex (component)
//
// FR : interface objet du composant. Les fonctions match, matches, substitute, split
//      et extract reçoivent le même objet requête et retournent le même résultat que
//      les fonctions de New regex (elles appellent les mêmes méthodes Match, Matches,
//      Substitute, Split et Extract). Le constructeur accepte un pattern par défaut,
//      utilisé quand la requête n'a pas d'attribut "pattern". L'objet requête n'est
//      jamais modifié. Utilisable dans un process préemptif.
// EN: object interface of the component. The match, matches, substitute, split and
//     extract functions take the same request object and return the same result as
//     the New regex functions (they call the same Match, Matches, Substitute, Split
//     and Extract methods). The constructor accepts a default pattern, used when the
//     request has no "pattern" attribute. The request object is never modified.
//     Usable in a preemptive process.
//
//   var $regex:=cs.AJRegex.Regex.new()
//   $result:=$regex.match({pattern: "\\d+"; string: "ab12"})
//   $result:=cs.AJRegex.Regex.new("\\d+").matches({string: "a1 b22"})
//
// https://developer.4d.com/docs/Concepts/classes

// FR : pattern par défaut ("" = aucun) / EN: default pattern ("" = none)
property pattern : Text

Class constructor($pattern : Text)
	
	This.pattern:=$pattern
	
Function match($request : Object) : Object
	// FR : première occurrence (voir la méthode Match) / EN: first occurrence (see the Match method)
	
	return Match(This._request($request))
	
Function matches($request : Object) : Object
	// FR : toutes les occurrences (voir Matches) / EN: all occurrences (see Matches)
	
	return Matches(This._request($request))
	
Function substitute($request : Object) : Object
	// FR : remplacement (voir Substitute) / EN: replacement (see Substitute)
	
	return Substitute(This._request($request))
	
Function split($request : Object) : Object
	// FR : découpage (voir Split) / EN: splitting (see Split)
	
	return Split(This._request($request))
	
Function extract($request : Object) : Object
	// FR : extraction de groupes (voir Extract) / EN: group extraction (see Extract)
	
	return Extract(This._request($request))
	
Function _request($request : Object) : Object
	// FR : requête à transmettre : une copie avec le pattern par défaut si la requête
	//      n'a pas de "pattern", sinon la requête elle-même (les méthodes ne la modifient pas).
	// EN: request to pass on: a copy with the default pattern when the request has no
	//     "pattern", else the request itself (the methods do not modify it).
	
	var $copy : Object
	
	If (($request=Null) || (This.pattern="") || ($request.pattern#Null))
		return $request
	End if 
	
	$copy:=OB Copy($request)
	$copy.pattern:=This.pattern
	return $copy
