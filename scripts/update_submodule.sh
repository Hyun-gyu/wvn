#!/bin/bash

cd "$(dirname "$0")/../code" || exit 1  # scripts → project_root/code

git add .
echo "💬 Enter commit message for code-utils:"
read msg
git commit -m "$msg"
git push origin main

cd ..
git add code
git commit -m "⬆️ Update code-utils: $msg"
git push