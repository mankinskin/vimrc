#!/usr/bin/env bash
# Install vimrc settings for vim and/or neovim, including vim-plug and plugins.
# Only installs for editors that are actually present on the system.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── detect editors ────────────────────────────────────────────────────────────

HAS_NVIM=false
HAS_VIM=false
command -v nvim &>/dev/null && HAS_NVIM=true
command -v vim  &>/dev/null && HAS_VIM=true

if ! $HAS_NVIM && ! $HAS_VIM; then
    echo "SKIP: neither vim nor nvim found in PATH — skipping vimrc installation."
    exit 0
fi

# ── helpers ───────────────────────────────────────────────────────────────────

symlink() {
    local src="$1" dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "SKIP: $dest already linked"
    elif [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "SKIP: $dest exists and is not a symlink — skipping to avoid overwrite"
    else
        ln -sf "$src" "$dest"
        echo "SET:  $dest -> $src"
    fi
}

install_plug() {
    local plug_path="$1"
    if [ -f "$plug_path" ]; then
        echo "SKIP: vim-plug already present at $plug_path"
        return
    fi
    echo "==> Installing vim-plug to $plug_path..."
    mkdir -p "$(dirname "$plug_path")"
    if command -v curl &>/dev/null; then
        curl -fLo "$plug_path" \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    elif command -v wget &>/dev/null; then
        wget -q -O "$plug_path" \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo "ERROR: curl or wget is required to download vim-plug." >&2
        exit 1
    fi
    echo "vim-plug installed."
}

nvim_stdpath() {
    local kind="$1"
    nvim --headless "+lua io.write(vim.fn.stdpath('$kind'))" +qall! 2>/dev/null | tr -d '\r'
}

# ── shared: colors and syntax (both vim and nvim use ~/.vim/) ─────────────────

echo "==> Linking color scheme..."
symlink "$SCRIPT_DIR/colors/miner.vim" "$HOME/.vim/colors/miner.vim"

echo "==> Linking syntax files..."
for f in "$SCRIPT_DIR/syntax/"*.vim; do
    [ -f "$f" ] || continue
    symlink "$f" "$HOME/.vim/syntax/$(basename "$f")"
done

# ── neovim ────────────────────────────────────────────────────────────────────

if $HAS_NVIM; then
    NVIM_CONFIG_DIR="$(nvim_stdpath config)"
    NVIM_DATA_DIR="$(nvim_stdpath data)"

    echo "==> Linking Neovim config..."
    symlink "$SCRIPT_DIR/vimrc" "$NVIM_CONFIG_DIR/init.vim"
    symlink "$SCRIPT_DIR/colors/miner.vim" "$NVIM_CONFIG_DIR/colors/miner.vim"

    echo "==> Linking Neovim syntax files..."
    for f in "$SCRIPT_DIR/syntax/"*.vim; do
        [ -f "$f" ] || continue
        symlink "$f" "$NVIM_CONFIG_DIR/syntax/$(basename "$f")"
    done

    install_plug "$NVIM_DATA_DIR/site/autoload/plug.vim"

    echo "==> Installing Neovim plugins (PlugInstall)..."
    nvim --headless -u "$NVIM_CONFIG_DIR/init.vim" +PlugInstall +qall 2>&1
    echo "Neovim plugins installed."
fi

# ── vim ───────────────────────────────────────────────────────────────────────

if $HAS_VIM; then
    echo "==> Linking Vim config..."
    symlink "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"

    install_plug "$HOME/.vim/autoload/plug.vim"

    echo "==> Installing Vim plugins (PlugInstall)..."
    vim -es -u "$HOME/.vimrc" +PlugInstall +qall 2>&1
    echo "Vim plugins installed."
fi

echo ""
echo "Vimrc setup complete."
