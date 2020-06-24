#!/usr/bin/env python3

swap = dict([pair.split('  ') for pair in '''a  ᴀ
b  ʙ
c  ᴄ
d  ᴅ
e  ᴇ
f  ғ
g  ɢ
h  ʜ
i  ɪ
j  ᴊ
k  ᴋ
l  ʟ
m  ᴍ
n  ɴ
o  ᴏ
p  ᴘ
q  ǫ
r  ʀ
s  s
t  ᴛ
u  ᴜ
v  ᴠ
w  ᴡ
y  ʏ
z  ᴢ'''.split('\n')])

def transform(line):
    outlist = []
    for letter in line:
        try:
            outlist.append(swap[letter])
        except KeyError:
            outlist.append(letter)
    return ''.join(outlist)


if __name__ == '__main__':
    import sys

    inlines = sys.stdin.read().split('\n')[:-1]

    outlines = [transform(line) for line in inlines]

    print('\n'.join(outlines))
