#!/usr/bin/env python3.7

import json
import os
from pathlib import Path
from pprint import pprint

this_file = Path(os.path.realpath(__file__))
admin_dir = this_file.parent
project_dir = admin_dir.parent
config_dir = admin_dir / 'config'
keymap_dir = project_dir / 'keymap'

# Keymaps

## Load Mappings

mappings = {}

for tsv in (config_dir / 'mappings').iterdir():
    with tsv.open() as f:
        pairs = [row.split('\t')[:2] for row in f.read().split('\n') if row]
        mappings[tsv.stem] = sorted(pairs)

### Build Keymap Files

keymaps = json.load((config_dir / 'keymaps.json').open())

for name, props in keymaps.items():
    builder = []
    if 'scriptencoding' in props:
        builder.append(f'scriptencoding {props["scriptencoding"]}\n')
    builder.append(f'let b:keymap_name = "{props["short name"]}"\n\nloadkeymap\n')
    builder.extend(['\t'.join(pair) for pair in mappings[name]])
    keymap_txt = '\n'.join(builder)

    with (keymap_dir / (name + '.vim')).open(mode='w') as f:
        f.write(keymap_txt)

# Command Tree
