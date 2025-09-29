#!/bin/bash
docker import cEOS64-lab-4.34.2.1F.tar.xz ceos:4.34.2.1F
docker tag ceos:4.34.2.1F ceos:latest

# ------------------------------------------------------------------------------
# ✅ Final verification
# ------------------------------------------------------------------------------
echo "🔍 Verifying installs..."
terraform -version
aws --version
docker --version
docker compose version
ansible --version
echo "✅ devcontainer setup complete and verified!"