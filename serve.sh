#!/bin/bash
# PENLab - Local Development Server
# Usage: ./serve.sh

export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:/usr/local/bin:$PATH"

echo "Starting PENLab local server..."
echo "Open http://127.0.0.1:4000/ in your browser"
echo "Press Ctrl+C to stop"
echo ""

bundle exec jekyll serve
