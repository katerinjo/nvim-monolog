# Neovim config for fancy text insertion anywhere

This setup adapts the main idea behind [Texpander](https://github.com/leehblue/texpander) to Neovim, allowing the insertion of special characters and use of Vim shortcuts basically anywhere. Feel free to copy ideas and code for your own configuration.

# Setup

I only use Linux, so if you don't, you're on your own for this part.

Everything goes into `~/.config/nvim/`.

Change `terminator` in `monolog/launch.sh` to your preferred terminal if needed.

Make a keyboard shortcut that points to `launch.sh`. The command should look something like `/home/foo/.config/nvim/monolog/launch.sh`. I use `Ctrl-Space`.

# Usage

When you find yourself wanting to insert something fancy or complicated, just use the keyboard shortcut and Neovim will pop up. Type using keymaps and digraphs as needed, then save and exit. The text will be pasted into place.

# Key Mappings

NORMAL MODE

- `<Space>` (Leader)
  - `s` : save
  - `i` : switch input
    - `n` : normal
    - `e` : Esperanto
    - `i` : International Phonetic Alphabet
    - `k` : Japanese Kana
    - `p` : (pseudo-) superscript
    - `s` : (pseudo-) small caps
    - `y` : Pinyin
  - `t` : transform line
    - `r` : rotate upside-down
- `\` (Local Leader)
  - `t` : transform all and save (monologing mode only)
    - (same as transform line)

VISUAL MODE

- `t` : transform selection
  - (same as transform line)

INSERT MODE

- `<Ctrl>i` : quick switch input
  - (same as switch input)

# Background

Simple and robust keyboard middleware has always been something I've wanted, but all available options I know of fail to work in one way or another.

Trying to combine keyboard configurations, input methods, emoji insertion GUIs, text editors, and so on all together as a coherent whole results in tools stepping on each other's toes, brittle functionality, and a user experience with a lot of mental overhead. Not good.

I want easy automatic Spongebob case, void text, and upside-down text. I want to insert today's date or a new UUID every now and then. I want to do a substring search on both emoticon and emoji names at the same time. I want to be able to switch between typing pinyin, Japanese kana, and Esperanto diacritics on the same machine without breaking everything. I want to talk about phonetics with my friends without making them all learn X-SAMPA.

Assuming the text will go where I want it to, each of these is pretty darn easy to implement with Python. The real bottleneck is compatibility between different applications and tools.

But you can just use the system clipboard! You get compatibility with just about any textbox on any web site or app you want to use with a simple bash script. All you need is a configurable text editor to point it at.

Neovim is my current choice because it:

- has fast startup times
- can be extended with any major programming language via APIs and shell script filters
- focuses on embedding itself in other applications, not reimplementing them internally
- takes advantage of my existing Vim muscle memory

My experience with Emacs and traditional Vim suggests that getting them to compete on all these metrics would be more of a time investment than is needed.

The original idea was a standalone application called "monolog", not a configuration, but this is the direction I'm going right now. Maybe this will evolve into a plugin or something similar later.

