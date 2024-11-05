from json import load
from snippets.mass_edits_ru import mass_translate

with open(f'snippets/vanilla-texts/text-ru.json', encoding='utf8') as f:
    text_map = load(f)
mass_translate(f'locale/**/en.po', {v: k for k, v in text_map.items()}, overwrite=False)
