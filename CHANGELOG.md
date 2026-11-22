# Changelog — AJ_Tools_Regex

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.
Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.

## 5.2.0 — 4D 21 R4

### Français

**Migration**
- Projet en 4D 21 R4 (`compatibilityVersion` 2140, `tokenizedText` false), `#DECLARE` et `var` partout ; méthodes toujours « preemptive capable ».
- Nouvelle méthode partagée `AJ_Tools_Regex_info` : retourne `AJ_Tools_Regex (v21 R4) : 5.2.0`.
- Nouvelle méthode `AJ_Tools_Regex_Build` (invisible, non partagée) : compile et construit le composant.
- Composant construit avec `BUILD APPLICATION` (`AJ_Tools_Regex/Settings/buildApp.4DSettings`), code compilé Intel + Apple Silicon, signé ad hoc. Installation par le gestionnaire de dépendances (`dependencies.json`).
- Copies compilées v18 (Intel seulement) retirées du dépôt.

**Corrections de comportement**
- **match** cherche maintenant la première occurrence à partir de `start` (1 par défaut). En 5.1.0, sans `position_only`, toute la chaîne devait correspondre et `start` était ignoré : `"b+"` dans `"abbbc"` donnait `success` False. L'ancien comportement reste disponible avec `whole_string: True`. `position_only: True` garde son sens (l'occurrence doit commencer à `start`).
- **match** : en cas d'échec, `string_extracted` vaut `""`, `position` et `length` valent 0 (avant : objets vides `{}`).
- **Requête non modifiée** : aucune fonction ne modifie plus l'objet passé (avant : ajout de `position_only` et, pour extract, ajout de `"0"` dans `group`).
- **extract** sans `group` (ou `group` vide) extrait le groupe 0, comme l'indique le README (avant : erreur 4D 314 et résultat vide).
- **extract** accepte des numéros de groupe en nombres (`[0;1]`) ou en textes (`["2"]`) (avant : erreur 4D 54 avec des nombres).
- **substitute** gère `\0` (occurrence entière). Les références sont résolues en une passe, le numéro de groupe le plus élevé d'abord (`\12` = groupe 12 s'il existe) ; un texte inséré n'est plus substitué une seconde fois ; un groupe absent de l'occurrence donne `""` ; une référence à un groupe inexistant reste telle quelle.
- **split** retourne `string_extracted`, comme les autres fonctions ; `text_extracted` reste présent (même contenu) mais est déprécié.
- **group** est numérique partout, y compris dans `listbox` de match et split (avant : texte `"0"`).

Tests : `tests/` (65 cas, résultats 5.1.0 et 5.2.0, comparaison).

### English

**Migration**
- Project on 4D 21 R4 (`compatibilityVersion` 2140, `tokenizedText` false), `#DECLARE` and `var` everywhere; methods still preemptive capable.
- New shared method `AJ_Tools_Regex_info`: returns `AJ_Tools_Regex (v21 R4) : 5.2.0`.
- New method `AJ_Tools_Regex_Build` (invisible, not shared): compiles and builds the component.
- Component built with `BUILD APPLICATION` (`AJ_Tools_Regex/Settings/buildApp.4DSettings`), Intel + Apple Silicon compiled code, ad hoc signed. Installed with the dependency manager (`dependencies.json`).
- v18 compiled copies (Intel only) removed from the repository.

**Behaviour fixes**
- **match** now searches the first occurrence from `start` (default 1). In 5.1.0, without `position_only`, the whole string had to match and `start` was ignored: `"b+"` in `"abbbc"` returned `success` False. The old behaviour is available with `whole_string: True`. `position_only: True` keeps its meaning (the occurrence must start at `start`).
- **match**: on failure, `string_extracted` is `""`, `position` and `length` are 0 (before: empty objects `{}`).
- **Request left unchanged**: no function modifies the object it receives any more (before: `position_only` was added and extract pushed `"0"` into `group`).
- **extract** without `group` (or with an empty `group`) extracts group 0, as the README says (before: 4D error 314 and an empty result).
- **extract** accepts group numbers as numbers (`[0;1]`) or texts (`["2"]`) (before: 4D error 54 with numbers).
- **substitute** supports `\0` (whole occurrence). References are resolved in one pass, highest group number first (`\12` is group 12 when it exists); inserted text is never substituted again; a group that does not take part in the occurrence gives `""`; a reference to a group that does not exist is kept as is.
- **split** returns `string_extracted`, like the other functions; `text_extracted` is still there (same content) but deprecated.
- **group** is numeric everywhere, including the `listbox` of match and split (before: text `"0"`).

Tests: `tests/` (65 cases, 5.1.0 and 5.2.0 results, comparison).

## 5.1.0 — 2020-02-03

Version for 4D v18 (tag `5.1.0`).
