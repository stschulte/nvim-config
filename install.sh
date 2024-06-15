#!/bin/bash
set -e

NVIM="${HOME}/.config/nvim"
NVIMS="${HOME}/.local/share/nvim"
PACKER_DIR="${NVIMS}/site/pack/packer/start/packer.nvim"

echo "Installing into ${NVIM} ..."

install -d -m 0755 "${NVIM}"
install -d -m 0755 "${NVIM}/lua"
install -d -m 0755 "${NVIM}/lua/user"
install -d -m 0755 "${NVIM}/after"
install -d -m 0755 "${NVIM}/after/plugin"

install -d -m 0755 "${NVIMS}"
install -d -m 0755 "${NVIMS}/site"
install -d -m 0755 "${NVIMS}/site/pack"
install -d -m 0755 "${NVIMS}/site/pack/packer"
install -d -m 0755 "${NVIMS}/site/pack/packer/start"

if [ ! -d "$PACKER_DIR" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_DIR"
fi

install -m 0644 init.lua "${NVIM}/init.lua"
install -m 0644 lua/init.lua "${NVIM}/lua/user/init.lua"
install -m 0644 lua/options.lua "${NVIM}/lua/user/options.lua"
install -m 0644 lua/packer.lua "${NVIM}/lua/user/packer.lua"
install -m 0644 lua/remap.lua "${NVIM}/lua/user/remap.lua"
install -m 0644 lua/theme.lua "${NVIM}/lua/user/theme.lua"

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

install -m 0644 after/plugin/catppuccin.lua "${NVIM}/after/plugin/catppuccin.lua"
install -m 0644 after/plugin/fugitive.lua "${NVIM}/after/plugin/fugitive.lua"
install -m 0644 after/plugin/harpoon.lua "${NVIM}/after/plugin/harpoon.lua"
install -m 0644 after/plugin/lsp.lua "${NVIM}/after/plugin/lsp.lua"
install -m 0644 after/plugin/telescope.lua "${NVIM}/after/plugin/telescope.lua"
install -m 0644 after/plugin/treesitter.lua "${NVIM}/after/plugin/treesitter.lua"
install -m 0644 after/plugin/undotree.lua "${NVIM}/after/plugin/undotree.lua"

echo "Installing into ${NVIM} ...DONE"
