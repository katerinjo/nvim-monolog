#!/usr/bin/env python3

VALID = set(
        '0123456789ABCDEFGHIJKLMNOPRSTUVWXYZabcdefhiklmnorstuvwxz'
        + 'ĉĈĥĤŭŬêÊĴĜ().?!:-\'"+=*&^%$#@`~'
        )
LINE = chr(818)

def transform(line):
    outline = []
    for character in range(len(line)):
        outline.append(line[character])
        if line[character] in VALID:
            outline.append(LINE)
    return ''.join(outline)

if __name__ == '__main__':
    import sys

    inlines = sys.stdin.read().split('\n')[:-1]

    outlines = [transform(line) for line in inlines]

    print('\n'.join(outlines))
