#!/bin/zsh
# tests/run.sh <label> [component folder] : runs every case of tests/cases.json through
# New regex in a headless, interpreted 4D on a temporary copy of the component, and
# writes tests/results/<label>.json. The component folder (default ../AJ_Tools_Regex)
# is only read.  FOURD can point to another 4D executable.
set -e
HERE="${0:A:h}"; LBL="${1:?label}"; SRC="${2:-$HERE/../AJ_Tools_Regex}"
FOURD="${FOURD:-/Applications/4D 21 R4/4D.app/Contents/MacOS/4D}"
W=$(mktemp -d -t ajregex-tests)
(cd "$SRC" && COPYFILE_DISABLE=1 tar cf - Project) | tar xf - -C "$W"
rm -rf "$W/Project/DerivedData"
cp "$HERE/methods/"*.4dm "$W/Project/Sources/Methods/"
cp "$HERE/cases.json" "$W/tests_cases.json"
"$FOURD" --project "$W/Project/"*.4DProject(N[1]) --headless --dataless --skip-onstartup \
  --startup-method _test_run > "$W/4d.log" 2>&1 &
PID=$!; i=0
while [ ! -f "$W/tests_result.json" ] && kill -0 $PID 2>/dev/null && [ $i -lt 180 ]; do sleep 1; i=$((i+1)); done
sleep 2; kill $PID 2>/dev/null || true
mkdir -p "$HERE/results"
cp "$W/tests_result.json" "$HERE/results/$LBL.json"
echo "results/$LBL.json written ($W)"
