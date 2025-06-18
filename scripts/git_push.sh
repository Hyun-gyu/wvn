#!/bin/bash

cd "$(dirname "$0")/.."   # scripts → project root

git add .
echo "💬 Commit message:"
read msg
git commit -m "$msg"
git push