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


# Load

## Mappings

mappings = {}

for tsv in (config_dir / 'mappings').iterdir():
    with tsv.open() as f:
        pairs = [row.split('\t')[:2] for row in f.read().split('\n') if row]
        mappings[tsv.stem] = sorted(pairs)

## Keymaps

keymaps = json.load((config_dir / 'keymaps.json').open())

## Command Tree

cmd_tree = json.load((config_dir / 'cmdtree.json').open())

# Build

## Keymap Files

for name, props in keymaps.items():
    builder = []
    if 'scriptencoding' in props:
        builder.append(f'scriptencoding {props["scriptencoding"]}\n')
    builder.append(f'let b:keymap_name = "{props["short name"]}"\n\nloadkeymap\n')
    builder.extend(['\t'.join(pair) for pair in mappings[name]])
    keymap_txt = '\n'.join(builder)

    with (keymap_dir / (name + '.vim')).open(mode='w') as f:
        f.write(keymap_txt)

## Command Tree

keymap_snippets = []
transform_snippets = []

def mk_vim_keymap(prefix, map_name, keymap_val=None, mode='n'):
    if keymap_val is None:
        keymap_val = map_name
    keymap_snippets.append(f'''
" {map_name}
{mode}noremap {prefix} :set keymap={keymap_val}<CR>
''')

def mk_vim_transform(prefix, script_name, transformation_name=None, mode='n'):
    if transformation_name is None:
        transformation_name = ''.join(script_name.split('.')[:-1])
    transform_snippets.append(f'\n" {transformation_name}\n')
    if mode == 'n':
        transform_snippets.append(
            f'nnoremap {prefix} !!~/.config/nvim/utils/{script_name}<CR>\n'
            )
    elif mode == 'v':
        transform_snippets.append(
            f'vnoremap {prefix} !~/.config/nvim/utils/{script_name}<CR>\n'
            )

def add_node(chain, node, mode):
    for link, child in node.items():
        if type(child) is dict: # no command yet, go deeper
            add_node([*chain, link], child, mode)
        else: # reached command
            prefix = ''.join(chain) + link
            cmd_type, *args = child
            if cmd_type == 'keymap':
                mk_vim_keymap(prefix, *args, mode=mode)
            if cmd_type == 'transform':
                mk_vim_transform(prefix, *args, mode=mode)

add_node([], cmd_tree['normal'], mode='n')
add_node([], cmd_tree['visual'], mode='v')

keymap_vim = ''.join(keymap_snippets)
transform_vim = ''.join(transform_snippets)

def mk_vim_sections(pairs):
    builder = ['"" ' + ('-' * 77)]
    for pair in pairs:
        name, content = pair
        builder.extend([
            f'"" {" " * (36 - (len(name) // 2))} {name}',
            content,
            f'"" {" " * (36 - (len(name) // 2))} {name}',
            '"" ' + ('-' * 77)
            ])
    return '\n'.join(builder)


cmd_tree_vim = mk_vim_sections([
        ['Keymaps', keymap_vim],
        ['Transformations', transform_vim],
        ['Misc Commands', '\n" nothing yet\n']
        ])

with (project_dir / 'cmdtree.vim').open(mode='w') as f:
    f.write(cmd_tree_vim)
