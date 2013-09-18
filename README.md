# Local dotfiles

I've pushed out my dotfiles so I can share them across machines.

## TODO
 - clean out the structure, load the files automatically
 - bring `.bashrc` and `.profile` stuff into dotfiles

Current `.profile`:

```bash
PS1="⚡ \[\033[1;34m\]\h:\[\033[0m\] \W \$ "

# Aliases
alias lls='ls -alh'


# BASH
# Source all files ending on .sh
for file in ~/.dotfiles/*.sh; do
   source $file
done

# ENV
# Source all files ending on .env
for file in ~/.dotfiles/*.env; do
   source $file
done
```