Make a backup of your current Neovim files:

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- clone the repository

```bash
git clone https://github.com/tianpai/nvimConfig ~/.config/nvim
```

- remove .git file

```bash
rm -rf ~/.config/nvim/.git
```

- start nvim and install plugins

```bash
nvim
```
