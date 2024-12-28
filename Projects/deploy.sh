#!/bin/bash
# Description: Deploy script for https://leanprover.cn
# Usage: ./deploy.sh

# Exit on error
set -e

cd "$(dirname "$0")"

for ver in v4.7.0 v4.10.0 v4.12.0 v4.13.0; do
    echo "Deploying $ver..."
    bash create_project.sh $ver
done