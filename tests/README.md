# Tests — AJ_Tools_Regex

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.
Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.

## Français

Banc de test du comportement des fonctions de `New regex` (match, matches, substitute, split, extract).

- `cases.json` : 65 cas (`m` match, `x` matches, `s` substitute, `p` split, `e` extract, `f` cas ajoutés pour les corrections 5.2.0).
- `methods/_test_run.4dm`, `methods/_test_onerr.4dm` : méthodes copiées dans une copie temporaire du composant ; `_test_run` appelle `New regex` pour chaque cas (copie de la requête, `ON ERR CALL`) et écrit `tests_result.json`.
- `run.sh <libellé> [dossier du composant]` : lance 4D 21 R4 sans interface (`--headless --dataless`, mode interprété) sur une copie temporaire et écrit `results/<libellé>.json`. Le dossier du composant n'est que lu. La variable `FOURD` permet d'indiquer un autre exécutable 4D.
- `compare.py <avant.json> <après.json> cases.json` : compare deux résultats, en tenant compte des changements de forme documentés (groupe 0 numérique, échec de match `""`/0/0, alias `string_extracted` de split), et liste les changements de comportement, les requêtes modifiées et les erreurs 4D.
- `results/5.1.0.json` : résultat du code 5.1.0 ; `results/5.2.0.json` : résultat de cette version.

Exemple : `tests/run.sh essai && python3 tests/compare.py tests/results/5.1.0.json tests/results/essai.json tests/cases.json`

## English

Behaviour harness for the `New regex` functions (match, matches, substitute, split, extract).

- `cases.json`: 65 cases (`m` match, `x` matches, `s` substitute, `p` split, `e` extract, `f` cases added for the 5.2.0 fixes).
- `methods/_test_run.4dm`, `methods/_test_onerr.4dm`: methods copied into a temporary copy of the component; `_test_run` calls `New regex` for each case (copy of the request, `ON ERR CALL`) and writes `tests_result.json`.
- `run.sh <label> [component folder]`: starts 4D 21 R4 without interface (`--headless --dataless`, interpreted mode) on a temporary copy and writes `results/<label>.json`. The component folder is only read. The `FOURD` variable can point to another 4D executable.
- `compare.py <before.json> <after.json> cases.json`: compares two results, allowing for the documented shape changes (numeric group 0, match failure `""`/0/0, split `string_extracted` alias), and lists the behaviour changes, modified requests and 4D errors.
- `results/5.1.0.json`: output of the 5.1.0 code; `results/5.2.0.json`: output of this version.

Example: `tests/run.sh try && python3 tests/compare.py tests/results/5.1.0.json tests/results/try.json tests/cases.json`
