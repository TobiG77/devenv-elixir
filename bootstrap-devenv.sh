#!/bin/bash

set -euo pipefail

nix-env -iA nixpkgs.glibcLocales 

grep -qE '^\. \$HOME\/\.bashrc_devenv' ~/.bashrc_custom 2>/dev/null || \
    echo '. $HOME/.bashrc_devenv' >> ~/.bashrc_custom 

test -e ~/.bashrc_devenv || {

cat > ~/.bashrc_devenv <<"EOF"

LANG=en_NZ.UTF-8
LANGUAGE=en_NZ.UTF-8
LC_ALL=en_NZ.UTF-8

export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"
EOF

}
