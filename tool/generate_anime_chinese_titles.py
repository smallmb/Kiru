from pathlib import Path
import os,tarfile,json,collections,hashlib
p=Path(os.environ['TEMP'])/'bangumi-data-0.3.237.tgz'
with tarfile.open(p) as t:
 d=json.load(t.extractfile('package/dist/data.json'))
 pkg=json.load(t.extractfile('package/package.json'))
assert pkg['version']=='0.3.237' and pkg['license']=='CC-BY-4.0'
maps={k:collections.defaultdict(set) for k in ('aniList','mal')}
for x in d['items']:
 names=x.get('titleTranslate',{}).get('zh-Hans',[])
 if not names or not isinstance(names[0],str) or not names[0].strip():continue
 for s in x.get('sites',[]):
  if s.get('site') in maps and str(s.get('id','')).isdigit():
   maps[s['site']][str(s['id'])].add(names[0].strip())
bgm={k:collections.defaultdict(set) for k in ('aniList','mal')}
for x in d['items']:
 ids={s.get('site'):str(s.get('id','')) for s in x.get('sites',[])}
 if not ids.get('bangumi','').isdigit():continue
 for k in bgm:
  if ids.get(k,'').isdigit():bgm[k][ids[k]].add(ids['bangumi'])
out={'bgm_anilist':{k:next(iter(v)) for k,v in bgm['aniList'].items() if len(v)==1},'bgm_mal':{k:next(iter(v)) for k,v in bgm['mal'].items() if len(v)==1},'source':'https://github.com/bangumi-data/bangumi-data','version':pkg['version'],'license':'CC-BY-4.0','anilist':{k:next(iter(v)) for k,v in maps['aniList'].items() if len(v)==1},'mal':{k:next(iter(v)) for k,v in maps['mal'].items() if len(v)==1}}
folder=Path('assets/metadata');folder.mkdir(exist_ok=True)
dest=folder/'anime_titles_zh.json';dest.write_text(json.dumps(out,ensure_ascii=False,separators=(',',':')),encoding='utf-8')
(folder/'BANGUMI_DATA_NOTICE.txt').write_text('Chinese anime title mappings adapted from bangumi-data contributors, bangumi-data v0.3.237. Source: https://github.com/bangumi-data/bangumi-data . CC BY 4.0: https://creativecommons.org/licenses/by/4.0/ . Changes: extracted first zh-Hans title and AniList/MAL/Bangumi identifiers, omitted conflicting identifiers and other data. npm tarball SHA-256: '+hashlib.sha256(p.read_bytes()).hexdigest()+'\n',encoding='utf-8')
print('DATA',len(out['anilist']),len(out['mal']),dest.stat().st_size,'conflicts',sum(len(v)>1 for m in maps.values() for v in m.values()))
print('SAMPLE',out['anilist'].get('154587'),out['anilist'].get('182255'))
