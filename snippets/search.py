from mvlocscript.ftl import parse_ftlxml, xpath
from mvlocscript.fstools import glob_posix
from mvlocscript.xmltools import AttributeProxy
import re
import json5
from pprint import pprint
from sys import argv

def findFilePatterns():
    pathset = set()
    for path in glob_posix('src-ru/data/*'):
        if not 'xml' in path:
            continue
        
        tree = parse_ftlxml(path, True)
        for element in tree.iter():
            if not element.text:
                continue
            
            if bool(re.search('[а-яА-Я]', element.text)):
                pathset.add(path)
    pprint(pathset)

def main(filepath):
    with open('mvloc.config.jsonc', encoding='utf8') as f:
        config = json5.load(f)

    xpathselection = config['stringSelectionXPath']
    elementSet = set()

    path = 'src-ru/' + filepath
    tree = parse_ftlxml(path, True)
    for element in tree.iter():
        if not element.text:
            continue
        
        if bool(re.search('[а-яА-Я]', element.text)):
            elementSet.add(element)

    trueset = set()
    
    for _xpath in xpathselection:
        for element in xpath(tree, _xpath):
            if isinstance(element, AttributeProxy):
                text = element.value
            else:
                text = element.text
            if not text:
                continue
            if bool(re.search('[а-яА-Я]', text)):
                trueset.add(element)
    
    if trueset >= elementSet:
        print('all element included!')
        return
    
    tagset = set()
    xpathset = set()
    diffset = elementSet - trueset
    for element in diffset:
        tagset.add(element.tag)
        xpathset.add(tree.getpath(element))
    pprint(tagset)
    if tagset:
        pprint(xpathset)
if __name__ == '__main__':
    main(argv[1])
