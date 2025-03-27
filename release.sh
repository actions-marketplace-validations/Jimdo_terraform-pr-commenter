#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ];then
  echo "Usage: $0 <new_version>"
fi

NEW_TAG="$1"

echo "New tag: $NEW_TAG"
git tag -a -m "Version $NEW_TAG" $NEW_TAG
git push origin $NEW_TAG

major_tag=$(echo $NEW_TAG | sed -r 's/^(v[0-9]+).*$/\1/')
git tag -f -a -m "Major Version $major_tag" $major_tag $NEW_TAG
git push -f origin $major_tag

gh repo set-default Jimdo/terraform-pr-commenter
gh release create $NEW_TAG --generate-notes
