# Monolog: A Neovim config for smart Unicode text insertion anywhere

This setup adapts the main idea behind [Texpander](https://github.com/leehblue/texpander) for Neovim, allowing the insertion of special characters and use of Vim shortcuts basically anywhere. Once my main configuration, I've adapted this into a starter config to cut out the fuss of keeping sensitive information and system-specific expectations out of the repo.

# Setup

I only use Linux, so if you don't, you're on your own for this part.

Everything goes into `~/.config/nvim/`.

Change `terminator` in `monolog/launch.sh` to your preferred terminal if needed.

Make a keyboard shortcut that points to `launch.sh`. The command should look something like `/home/foo/.config/nvim/monolog/launch.sh`. I use `Ctrl-Space`.

# Usage

When you find yourself wanting to insert something fancy or complicated, just use the keyboard shortcut and Neovim will pop up. Type using keymaps, digraphs, and transformations as needed, then save and exit. The text will be pasted into place.

# Key Mappings

## Normal Mode

- `<Space>` (Leader)
  - `s` : save
  - `i` : SWITCH INPUT
  - `t` : TRANSFORM (current line)
- `\` : TRANSFORM (all and save) (monolog only)

## Visual Mode

- `t` : TRANSFORM (current selection)

## SWITCH INPUT

| Keymap                          | Key |
|---------------------------------|-----|
| normal/default                  | `n` |
| Esperanto                       | `e` |
| International Phonetic Alphabet | `i` |
| Italic                          | `I` |
| Kana (Japanese)                 | `k` |
| Pinyin (Mandarin)               | `y` |
| small caps                      | `s` |
| superscript                     | `p` |

## TRANSFORM

- `a` : sort (simple)
- `A` : sort (smart)
- `=` : monospace
- `I` : italics
- `S` : studly caps
- `r` : rotate upside-down
- `s` : small caps
- `u` : underlined

# Background

Simple and robust keyboard middleware has always been something I've wanted, but all available options I know of fall short in one way or another.

Trying to combine keyboard configurations, input methods, emoji insertion GUIs, text editors, and so on all together as a coherent whole results in tools stepping on each other's toes, brittle functionality, and a user experience with a lot of mental overhead. Not good.

I want easy automatic studly caps, Zalgo text, and upside-down text. I want to insert today's date or a new UUID every now and then. I want to do a substring search on both emoticon and emoji names at the same time. I want to be able to switch between typing pinyin, Japanese kana, and Esperanto diacritics on the same machine without breaking everything. I want to talk about phonetics with my friends without making them all learn X-SAMPA.

Assuming the text will go where I want it to, each of these features is pretty darn easy to implement in Python. The real bottleneck is compatibility between different applications and tools.

After a lot of experimentation, it turns out that simply using the system clipboard works pretty well! You get compatibility with just about any textbox on any web site or app you want to use with some relatively simple bash scripting. All you need is a configurable text editor to point it at.

Neovim is my current choice because it:

- has fast startup times
- can be extended with any programming language via APIs and shell script filters
- focuses on embedding itself in other applications, not reimplementing them internally
- takes advantage of my existing Vim muscle memory

My experience with Emacs and traditional Vim suggests that getting them to compete on all these metrics would be more of a time investment than is needed.

The original idea was a standalone application, not a configuration, but this is the direction I'm going right now. Maybe this will evolve into a plugin or something similar later.

# TODO

- Spin off text transformations into a separate Python library.
- emoticons and emojis
- Zalgo text

