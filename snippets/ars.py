from mvlocscript.ftl import parse_ftlxml, ftl_xpath_matchers
from mvlocscript.fstools import glob_posix
from mvlocscript.xmltools import UniqueXPathGenerator
import re
import json
from pathlib import Path
from collections import defaultdict

BASEPATH = ''

SOURCES = [
    # argo's translaton. The duplicated texts will be overwriten by Blizz's one.
    ('Arsenal+ v1.28/Arsenal+ Base/data/*', 'ARS_CUSTOM_HYPERSPACE_DLC1_1.28.X_2024/2 - ARS_BASE_DATA_1.28.X_2024_Bugfix/data/*'),
    ('Arsenal+ v1.28/Arsenal+ Hyperspace v1.1/data/*', 'ARS_CUSTOM_HYPERSPACE_DLC1_1.28.X_2024/3 - ARS_HYPERSPACE_1.0.4_2024/data/*'),
    
    # Blizz's translation.
    ('Arsenal+ v1.28/Arsenal+ Base/data/*', 'arsenal-plus-english-master/ARS - Base/ARS - Base Data/data/*'),
    ('Arsenal+ v1.28/Arsenal+ Hyperspace v1.1/data/*', 'arsenal-plus-english-master/ARS - Hyperspace/data/*'),
    ('Arsenal+ v1.28/Arsenal+ DLC_SHIPS-1 v1.18/data/*', 'arsenal-plus-english-master/ARS - Ship Packs/ARS - Ship Pack 1/data/*'),
    ('Arsenal+ v1.28/Arsenal+ DLC_SHIPS-2 v1.9/data/*', 'arsenal-plus-english-master/ARS - Ship Packs/ARS - Ship Pack 2/data/*'),
    ('Arsenal+ v1.28/Arsenal+ DLC_SHIPS-3 v1.9/data/*', 'arsenal-plus-english-master/ARS - Ship Packs/ARS - Ship Pack 3/data/*'),
    ('Arsenal+ v1.28/Arsenal+ A- v1.11/data/*', 'arsenal-plus-english-master/ARS - Misc Addons/ARS - A- Difficulty/data/*'),
    ('Arsenal+ v1.28/Arsenal+ A+ v1.10/data/*', 'arsenal-plus-english-master/ARS - Misc Addons/ARS - A+ Difficulty/data/*'),
    ('Arsenal+ v1.28/Arsenal+ Infinity v1.22/data/*', 'arsenal-plus-english-master/ARS - Misc Addons/ARS - Infinite/data/*')
]

def getPathKey(fileName, xpath):
    xpath = xpath.replace('/dummyroot', '').replace('dummyroot', '')
    return f'{fileName}${xpath}'

def makeTranslationMap(srcRU, srcEn):
    textMap = defaultdict(dict)
    enPathSet = {Path(path).name for path in glob_posix(srcEn)}
    ruPathSet = {Path(path).name.replace('.rawclobber', '') for path in glob_posix(srcRU)}
    
    for path in glob_posix(srcRU):
        if not 'xml' in path:
            continue
        
        fileName = Path(path).name.replace('.rawclobber', '')
        if fileName not in enPathSet:
            continue
        
        print(path)
        tree = parse_ftlxml(path, True)
        uniqueXPathGenerator = UniqueXPathGenerator(tree, ftl_xpath_matchers())
        for element in tree.iter():
            if not element.text:
                continue
            
            if bool(re.search('[а-яА-Я]', element.text)):
                textMap[getPathKey(fileName, uniqueXPathGenerator.getpath(element))]['ru'] = element.text

    for path in glob_posix(srcEn):
        if not 'xml' in path:
            continue
        
        fileName = Path(path).name
        if fileName not in ruPathSet:
            continue
        
        print(path)
        tree = parse_ftlxml(path, True)
        uniqueXPathGenerator = UniqueXPathGenerator(tree, ftl_xpath_matchers())
        for element in tree.iter():
            if not element.text:
                continue
            
            p = getPathKey(fileName, uniqueXPathGenerator.getpath(element))
            if textMap.get(p) is not None:
                textMap[p]['en'] = element.text
    
    ret = {}
    for value in textMap.values():
        if value.get('en') is not None:
            ret[value['ru']] = value['en']
    return ret

translationMap = {}
for ru, en in SOURCES:
    translationMap.update(makeTranslationMap(BASEPATH + ru, BASEPATH + en))

with open('Ars+1.28TranslationMap.json', 'wt', encoding='utf8') as f:
    json.dump(translationMap, f, ensure_ascii=False, indent=2)
