#!/usr/bin/env python3
# compare_fixes.py <baseline.json> <after.json> <cases.json>
# Applies the documented 5.2.0 shape changes to the baseline (listbox group "0" -> 0,
# match failure {} -> ""/0/0, split string_extracted alias), then lists what still differs.
import json, sys, copy
ld = lambda p: json.load(open(p, encoding='utf-8-sig'))
a = {r['id']: r for r in ld(sys.argv[1])}; b = {r['id']: r for r in ld(sys.argv[2])}
cases = {c['id']: c for c in ld(sys.argv[3])}
def norm(r, fn):
    r = copy.deepcopy(r)
    if not isinstance(r, dict): return r
    for e in r.get('listbox') or []:
        if e.get('group') == '0': e['group'] = 0
    if fn == 'match' and r.get('string_extracted') == {}:
        r.update(string_extracted='', position=0, length=0)
    if fn == 'split' and 'text_extracted' in r:
        r = {('string_extracted' if k == 'text_extracted' else k): v for k, v in r.items()}
        r = dict(list(r.items())); r['text_extracted'] = r['string_extracted']
        r = {k: r[k] for k in ['success', 'string_extracted', 'text_extracted'] + [k for k in r if k not in ('success', 'string_extracted', 'text_extracted')]}
    return r
shape = []; real = []
for i in a:
    if a[i]['result'] == b[i]['result'] and a[i]['err'] == b[i]['err']: continue
    if norm(a[i]['result'], a[i]['fn']) == b[i]['result'] and a[i]['err'] == b[i]['err']: shape.append(i)
    else: real.append(i)
mut_a = [i for i in a if a[i]['reqAfter'] != cases[i]['req']]
mut_b = [i for i in b if b[i]['reqAfter'] != cases[i]['req']]
print(f"{len(a)} cases: {len(a)-len(shape)-len(real)} identical, {len(shape)} shape-only (group 0 numeric, match failure \"\"/0/0, split string_extracted), {len(real)} behaviour changes")
print("shape-only:", ' '.join(shape))
print("behaviour changes:", ' '.join(real))
print(f"request modified: before {len(mut_a)} ({' '.join(mut_a)}), after {len(mut_b)} ({' '.join(mut_b) or 'none'})")
print("4D errors before:", ' '.join(f"{i}:{a[i]['err']}" for i in a if a[i]['err']) or 'none', "| after:", ' '.join(f"{i}:{b[i]['err']}" for i in b if b[i]['err']) or 'none')
def brief(i, r):
    if not isinstance(r, dict): return json.dumps(r)
    keys = {'match': ['success', 'string_extracted', 'position', 'length'], 'substitute': ['success', 'string_resulting'],
            'extract': ['success', 'string_extracted', 'group'], 'split': ['success', 'string_extracted'], 'matches': ['success', 'string_extracted', 'group']}[a[i]['fn']]
    return json.dumps({k: r.get(k) for k in keys if k in r}, ensure_ascii=False)
for i in real:
    print(f"  {i} {a[i]['fn']} {json.dumps(cases[i]['req'], ensure_ascii=False)[:120]}")
    print(f"     before: {brief(i, a[i]['result'])}{'  err '+str(a[i]['err']) if a[i]['err'] else ''}")
    print(f"     after:  {brief(i, b[i]['result'])}{'  err '+str(b[i]['err']) if b[i]['err'] else ''}")
