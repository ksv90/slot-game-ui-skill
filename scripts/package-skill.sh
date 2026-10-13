#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

expected_version=${1:-}
version=$(sed -nE 's/^  version: "([0-9]+\.[0-9]+\.[0-9]+)" # x-release-please-version$/\1/p' SKILL.md)
[[ -n "$version" ]] || { echo 'Missing skill version marker' >&2; exit 1; }
[[ $(cat version.txt) == "$version" ]] || { echo 'version.txt differs from SKILL.md' >&2; exit 1; }
[[ -z "$expected_version" || "$expected_version" == "$version" ]] || {
  echo 'Skill version differs from release version' >&2
  exit 1
}
grep -qx 'name: slot-game-ui-skill' SKILL.md

files=(SKILL.md README.md INSTALL.md LICENSE CONTRIBUTING.md CHANGELOG.md)
for file in "${files[@]}"; do
  [[ -f "$file" ]] || { echo "Missing required file: $file" >&2; exit 1; }
done
for directory in agents references assets; do
  [[ -d "$directory" ]] || { echo "Missing required directory: $directory" >&2; exit 1; }
  [[ -z $(find "$directory" -type l -print -quit) ]] || {
    echo "Symlinks are not allowed in $directory" >&2
    exit 1
  }
done

for spec in 'C 36 catalog-core' 'F 40 catalog-features' 'D 19 catalog-dialogs'; do
  read -r prefix total catalog <<< "$spec"
  file="references/$catalog.md"
  [[ -f "$file" ]] || { echo "Missing catalog: $file" >&2; exit 1; }
  count=$(grep -Ec "^\\| ${prefix}[0-9][0-9] \\|" "$file" || true)
  [[ "$count" == "$total" ]] || { echo "Unexpected $prefix catalog count" >&2; exit 1; }
  for ((number = 1; number <= total; number++)); do
    printf -v id '%s%02d' "$prefix" "$number"
    grep -Fq "| $id |" "$file" || { echo "Missing catalog ID: $id" >&2; exit 1; }
  done
done

staging=$(mktemp -d)
trap 'rm -rf "$staging"' EXIT
mkdir -p "$staging/slot-game-ui-skill" dist
cp "${files[@]}" "$staging/slot-game-ui-skill/"
cp -R agents references assets "$staging/slot-game-ui-skill/"
rm -f dist/skill.zip dist/skill.zip.sha256
(cd "$staging" && zip -q -r -X "$repo_root/dist/skill.zip" slot-game-ui-skill)
unzip -tqq dist/skill.zip
(cd dist && shasum -a 256 skill.zip > skill.zip.sha256)
printf 'Built dist/skill.zip for %s\n' "$version"
