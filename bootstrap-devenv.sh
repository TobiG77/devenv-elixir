#!/bin/bash

nix-env -iA nixpkgs.glibcLocales 

grep -q "^#DEVENV_ELIXIR" ~/.bashrc_custom

cat >> ~/.bashrc_devenv_elixir <<"EOF"

LANG=en_NZ.UTF-8
LANGUAGE=en_NZ.UTF-8
LC_ALL=en_NZ.UTF-8

export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"

echo '. ~/.bashrc_devenv_elixir' > ~/.bashrc_custom

EOF
