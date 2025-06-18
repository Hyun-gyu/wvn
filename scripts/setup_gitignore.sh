#!/bin/bash

cd "$(dirname "$0")/.."  # scripts → project root

cat <<EOF > .gitignore
# ROS
build/
devel/
logs/
*.bag

# Python
__pycache__/
*.pyc

# Editor
.vscode/
.idea/

# Data
*.csv
*.pcd
*.ply
*.npy

# Docker
docker/.docker.xauth

# Others
*.log
*.tmp
EOF

echo "✅ .gitignore created at project root."