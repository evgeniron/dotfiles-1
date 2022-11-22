#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Taps
tap 'homebrew/bundle'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'bufbuild/buf'

# Install more recent versions of some macOS tools.
brew install neovim --with-override-system-vi
brew install ripgrep
brew install tmux
brew install fd
brew install fzf
brew install go
brew install kubectl
brew install zoxide

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install lua
brew install p7zip
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install docker
brew install gh
brew install kubectl
brew install protoc-gen-go-grpc
brew install --cask alacritty
brew install --cask google-cloud-sdk
brew install --cask maccy
brew install --cask slack
brew install --cask whatsapp
brew install --cask zoom
brew install --cask beekeeper-studio
brew install --cask obsidian

# Remove outdated versions from the cellar.
brew cleanup
