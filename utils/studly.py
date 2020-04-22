#!/usr/bin/env python3

import random
import sys

inlines = sys.stdin.read().split('\n')[:-1]

outlines = []

for line in inlines:
    outline = []
    for c in line:
        try:
            outline.append({
                'i': 'i',
                'I': 'i',
                'l': 'L',
                'L': 'L'
                }[c])
        except KeyError:
            if random.getrandbits(1):
                outline.append(c.lower())
            else:
                outline.append(c.upper())
    outlines.append(''.join(outline))

print('\n'.join(outlines))
