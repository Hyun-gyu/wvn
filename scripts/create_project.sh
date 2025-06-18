#!/bin/bash

# -------------------------------
#  Docker Project Generator
# -------------------------------

TEMPLATE_DIR=~/data/Research/project_template
DEST_DIR=$1

if [ -z "$DEST_DIR" ]; then
  echo "❗ Usage: ./create_project.sh <new_project_path>"
  exit 1
fi

PROJECT_NAME=$(basename "$DEST_DIR")
DEST_DIR=$(realpath "$DEST_DIR")

# 1. Create directory
mkdir -p "$DEST_DIR"
echo "📁 Created: $DEST_DIR"

# 2. Copy template content
cp -r "$TEMPLATE_DIR"/docker "$DEST_DIR/"
cp -r "$TEMPLATE_DIR"/scripts "$DEST_DIR/"
cp "$TEMPLATE_DIR/.gitignore" "$DEST_DIR/.gitignore"
cp "$TEMPLATE_DIR/.env" "$DEST_DIR/.env" 2>/dev/null || true
cp "$TEMPLATE_DIR/README.md" "$DEST_DIR/README.md"

# 3. Create empty workspace
mkdir -p "$DEST_DIR/workspace/src"
touch "$DEST_DIR/workspace/src/.keep"

# 4. Replace placeholder with project name
sed -i "s/project_name_placeholder/$PROJECT_NAME/g" "$DEST_DIR/docker/docker-compose.yml"
sed -i "s/project_name_placeholder/$PROJECT_NAME/g" "$DEST_DIR/docker/start.sh"

# 5. Git init
cd "$DEST_DIR"
git init
echo "🎉 Project '$PROJECT_NAME' is ready at: $DEST_DIR"
echo "➡️  Next: cd $DEST_DIR/docker && ./start.sh"