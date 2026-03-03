#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SITE_DIR="$ROOT_DIR/penlab"

cd "$SITE_DIR"

export GEM_HOME="${GEM_HOME:-$HOME/.gems}"
export PATH="$GEM_HOME/bin:$HOME/.local/share/gem/ruby/bin:/usr/local/bin:$PATH"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler no esta instalado o no esta en PATH."
  echo "Instalalo con: gem install bundler"
  exit 1
fi

if [ ! -f Gemfile ]; then
  cat > Gemfile <<'EOF'
source "https://rubygems.org"

gem "jekyll"
gem "jekyll-remote-theme"
gem "jekyll-feed"
gem "jekyll-paginate"
gem "jekyll-seo-tag"
gem "jekyll-sitemap"
EOF
fi

if ! bundle check >/dev/null 2>&1; then
  echo "Instalando dependencias Ruby..."
  bundle install
fi

echo "Sirviendo PENLab en http://127.0.0.1:4000"
bundle exec jekyll serve --baseurl "" --livereload
