# Move-Char-Left-Right.vim
This Vim plugin provides actions for moving the character under the cursor left or right.

# Why?
This can be done in vanilla Vim using `xp` and `xhP`, but that is annoyingly 
asymmetric, does not accept counts, and is not dot-repeatable. This plugin fixes
all 3 points.

# Mappings
No mappings are created automatically, add your own. I use:
```vim
nmap [ä <Plug>(move-char-left)
nmap ]ä <Plug>(move-char-right)
```
or with `init.lua`:
```lua
vim.keymap.set('n', '[ä', '<Plug>(move-char-left)')
vim.keymap.set('n', ']ä', '<Plug>(move-char-right)')
```
because of its reminiscence of the `[e ]e` mappings from [vim-unimpaired](https://github.com/tpope/vim-unimpaired).

# Usage
In normal mode, use `[count][ä` to move the character under the cursor `[count]`
positions to the left. Want to move it again? Use `.` or `[count].`! Analogously
for `]ä`.

Want to move a character to the start or end of line? Use a large
`[count]`, i.e. `500[ä` or `500]ä`.

# Requirements
Developed and tested on Neovim `0.9.1`. It's 100% Vimscript and nothing fancy, so
it should work on Vim 8+, too.
Does *not* require [vim-repeat](https://github.com/tpope/vim-repeat) for the dot
repeat.
