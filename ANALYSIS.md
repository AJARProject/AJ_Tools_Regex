# Analyse et migration — AJ_Tools_Regex 5.2.0 (4D 21 R4)

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.
Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.

[Français](#français) · [English](#english)

## Français

### Point de départ

- Branche `master` au commit `c97360a`, code identique au tag `5.1.0` (3 février 2020, 4D v18). Licence MIT (AJAR SA).
- Composant `AJ_Tools_Regex/` : 7 méthodes (`New regex` et `Regex_Licence` partagées ; `Match`, `Matches`, `Substitute`, `Split`, `Extract` privées, « preemptive capable »). Pas de méthode de version.
- Lab `AJ_Tools_RegexLab/` : 26 méthodes, 6 formulaires, une copie compilée du composant dans `Components/`.
- Fichiers générés versionnés : `.4DIndy`, `.Match`, fichiers de symboles, `Logs/`, `Settings/4DPop`, `DerivedData` et `Trash` du Lab, exports de 2018 (dont un `.json` sans nom de 700 Ko), `regex_examplesFix.json` (référencé nulle part).
- Deux copies compilées v18 (`compiled/` et `AJ_Tools_RegexLab/Components/`) : code Intel seulement, non chargé par 4D 21 R4 sur Apple Silicon. Les releases GitHub n'ont pas d'archive jointe.
- Compilation en 4D 21 R4 sans changement : composant 0 erreur / 28 avertissements ; avec `compatibilityVersion` 2140 : 73 erreurs. Lab : 1 erreur (composant non chargé) et 97 avertissements.

### Défauts trouvés (banc de test sur le code 5.1.0)

| Fonction | Défaut 5.1.0 | 5.2.0 |
|---|---|---|
| match | Sans `position_only`, toute la chaîne devait correspondre et `start` était ignoré (`"b+"` dans `"abbbc"` : Faux), alors que le README annonce « la première occurrence » | Recherche de la première occurrence à partir de `start` ; `whole_string: True` garde l'ancien comportement |
| match | Échec : `string_extracted`, `position`, `length` = `{}` | `""`, 0, 0 |
| toutes | La requête était modifiée (`position_only` ajouté ; extract ajoutait `"0"` dans `group`), alors que le README annonce « not mutating » | Requête copiée (`OB Copy`), jamais modifiée |
| extract | Sans `group` : erreur 4D 314, résultat vide | Groupe 0 |
| extract | `group` en nombres (`[0;1]`) : erreur 4D 54, résultat vide | Nombres et textes acceptés |
| substitute | `\0` non géré (laissé tel quel) ; un texte inséré pouvait être substitué une seconde fois | `\0` géré ; résolution en une passe, numéro le plus élevé d'abord |
| split | Clé `text_extracted` (les autres fonctions utilisent `string_extracted`) | `string_extracted` ajouté, `text_extracted` gardé (déprécié) |
| match, split | `group` texte `"0"` dans `listbox` | Nombre 0 |
| Lab | Préférences de zone web sur un objet inexistant (`obj_WA_regexVis`) | `regex_visual_webarea_obj` |
| Lab | Exemples cherchés dans le dossier Data : introuvables en mode projet | Dossier du Lab |
| Lab | `RegexLab_load_data` lisait `$1` avant de compter les paramètres | Paramètre lu seulement s'il est passé |
| Lab | Liens forums.4d.fr et icu-project.org morts | https://discuss.4d.com/ et https://unicode-org.github.io/icu/userguide/strings/regexp.html (vérifiés) |

### Commits (branche `migration/4d-21-r4-5.2.0`)

1. Nettoyage : fichiers générés, copies compilées Intel, `.gitignore` réécrit pour les deux dossiers projet.
2. Composant 4D 21 R4 sans changement de comportement : 2140, `#DECLARE`/`var`, `AJ_Tools_Regex_info`, `buildApp.4DSettings`, `target="all"`. Banc de test identique au code 5.1.0.
3. Corrections de comportement, `tests/`, `CHANGELOG.md`.
4. Lab 4D 21 R4 : 2140, `dependencies.json` + `environment4d.json`, corrections du Lab.
5. README FR/EN, cette analyse, méthode `AJ_Tools_Regex_Build`.

### Vérifications

- Compilation du composant (Intel + Apple Silicon) : 0 erreur, 0 avertissement ; vérification thread-safe du compilateur pour les méthodes « preemptive capable ».
- Banc de test (65 cas, 4D sans interface, interprété, `ON ERR CALL`) : après le commit 2, sortie identique au code 5.1.0 ; après le commit 3, 31 cas identiques, 19 changements de forme documentés (groupe 0 numérique, échec de match `""`/0/0, alias `string_extracted`), 15 changements de comportement, tous liés aux corrections ; 0 requête modifiée (46 en 5.1.0) ; 0 erreur 4D (5 en 5.1.0).
- `BUILD APPLICATION` : OK ; `codesign -v --deep --strict` : OK (signature ad hoc) ; `Libraries/lib4d-arm64.dylib` : arm64 ; code Intel (`IX64`) dans le 4DZ.
- Composant construit chargé depuis le dossier `Components` d'un projet hôte : les 65 cas donnent le même résultat que le code interprété ; une méthode hôte « preemptive capable » qui appelle `New regex` compile sans erreur.
- Lab avec `environment4d.json` (`../AJ_Tools_Regex`) : compilation 0 erreur, 0 avertissement ; test sans interface : AJ_Tools_Regex chargé, 78 exemples chargés depuis `json/`, 76 exécutés sans erreur avec le même `success` que le résultat enregistré.

### Non testé

- Interface du Lab (fenêtres, onglets, glisser-déposer, import/export par dialogue) et affichage Regulex dans la zone web : à vérifier à la main.
- Installation depuis GitHub (`^5.2.0`) : la release 5.2.0 n'existe pas encore ; seul le chemin local (`environment4d.json`, dossier `Components`) a été vérifié.
- Windows.

## English

### Starting point

- `master` branch at commit `c97360a`, code identical to tag `5.1.0` (3 February 2020, 4D v18). MIT licence (AJAR SA).
- Component `AJ_Tools_Regex/`: 7 methods (`New regex` and `Regex_Licence` shared; `Match`, `Matches`, `Substitute`, `Split`, `Extract` private, preemptive capable). No version method.
- Lab `AJ_Tools_RegexLab/`: 26 methods, 6 forms, a compiled copy of the component in `Components/`.
- Generated files under version control: `.4DIndy`, `.Match`, symbol files, `Logs/`, `Settings/4DPop`, Lab `DerivedData` and `Trash`, 2018 exports (including a 700 KB nameless `.json`), `regex_examplesFix.json` (referenced nowhere).
- Two v18 compiled copies (`compiled/` and `AJ_Tools_RegexLab/Components/`): Intel-only code that 4D 21 R4 does not load on Apple Silicon. GitHub releases have no attached archive.
- Compiling with 4D 21 R4 as is: component 0 errors / 28 warnings; with `compatibilityVersion` 2140: 73 errors. Lab: 1 error (component not loaded) and 97 warnings.

### Defects found (harness on the 5.1.0 code)

| Function | 5.1.0 defect | 5.2.0 |
|---|---|---|
| match | Without `position_only`, the whole string had to match and `start` was ignored (`"b+"` in `"abbbc"`: False), while the README says "first occurrence" | Searches the first occurrence from `start`; `whole_string: True` keeps the old behaviour |
| match | Failure: `string_extracted`, `position`, `length` = `{}` | `""`, 0, 0 |
| all | The request was modified (`position_only` added; extract pushed `"0"` into `group`), while the README says "not mutating" | Request copied (`OB Copy`), never modified |
| extract | No `group`: 4D error 314, empty result | Group 0 |
| extract | `group` as numbers (`[0;1]`): 4D error 54, empty result | Numbers and texts accepted |
| substitute | `\0` not supported (left as is); inserted text could be substituted again | `\0` supported; one-pass resolution, highest number first |
| split | `text_extracted` key (the other functions use `string_extracted`) | `string_extracted` added, `text_extracted` kept (deprecated) |
| match, split | `group` as text `"0"` in `listbox` | Number 0 |
| Lab | Web area preferences set on a missing object (`obj_WA_regexVis`) | `regex_visual_webarea_obj` |
| Lab | Examples looked up in the Data folder: not found in project mode | Lab folder |
| Lab | `RegexLab_load_data` read `$1` before counting parameters | Parameter read only when passed |
| Lab | Dead forums.4d.fr and icu-project.org links | https://discuss.4d.com/ and https://unicode-org.github.io/icu/userguide/strings/regexp.html (checked) |

### Commits (branch `migration/4d-21-r4-5.2.0`)

1. Cleanup: generated files, Intel compiled copies, `.gitignore` rewritten for both project folders.
2. Component on 4D 21 R4 with no behaviour change: 2140, `#DECLARE`/`var`, `AJ_Tools_Regex_info`, `buildApp.4DSettings`, `target="all"`. Harness identical to the 5.1.0 code.
3. Behaviour fixes, `tests/`, `CHANGELOG.md`.
4. Lab on 4D 21 R4: 2140, `dependencies.json` + `environment4d.json`, Lab fixes.
5. README FR/EN, this analysis, `AJ_Tools_Regex_Build` method.

### Checks

- Component compile (Intel + Apple Silicon): 0 errors, 0 warnings; compiler thread-safety check for the preemptive capable methods.
- Harness (65 cases, headless 4D, interpreted, `ON ERR CALL`): after commit 2, output identical to the 5.1.0 code; after commit 3, 31 cases identical, 19 documented shape changes (numeric group 0, match failure `""`/0/0, `string_extracted` alias), 15 behaviour changes, all from the fixes; 0 modified requests (46 in 5.1.0); 0 4D errors (5 in 5.1.0).
- `BUILD APPLICATION`: OK; `codesign -v --deep --strict`: OK (ad hoc signature); `Libraries/lib4d-arm64.dylib`: arm64; Intel code (`IX64`) in the 4DZ.
- Built component loaded from a host project's `Components` folder: the 65 cases give the same output as the interpreted code; a preemptive capable host method calling `New regex` compiles without error.
- Lab with `environment4d.json` (`../AJ_Tools_Regex`): compile 0 errors, 0 warnings; headless test: AJ_Tools_Regex loaded, 78 examples loaded from `json/`, 76 run without error with the same `success` as the stored result.

### Not tested

- Lab interface (windows, tabs, drag and drop, import/export dialogs) and the Regulex drawing in the web area: to check by hand.
- Installing from GitHub (`^5.2.0`): release 5.2.0 does not exist yet; only the local path (`environment4d.json`, `Components` folder) was checked.
- Windows.
