#!/usr/bin/env bash
# Copy Hugo's default RSS output (index.xml) to the legacy WordPress
# /feed/index.xml paths so old feed URLs keep working.
set -euo pipefail

dir="${1:-public}"

mapfile -t files < <(find "$dir" -name index.xml -type f)
for f in "${files[@]}"; do
  parent="$(dirname "$f")"
  # Skip anything already inside a feed/ directory (static legacy feeds).
  if [ "$(basename "$parent")" = "feed" ]; then
    continue
  fi
  mkdir -p "$parent/feed"
  cp "$f" "$parent/feed/index.xml"
done
