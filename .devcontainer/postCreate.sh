#!/bin/bash
docker import cEOS64-lab-4.34.2.1F.tar.xz ceos:4.34.2.1F
docker tag ceos:4.34.2.1F ceos:latest
docker pull ghcr.io/nokia/srlinux
docker load -i cJunosEvolved-25.2R1.8-EVO.tar.gz

# ------------------------------------------------------------------------------
# ✅ Final verification
# ------------------------------------------------------------------------------
echo "🔍 Verifying installs..."
terraform -version
aws --version
docker --version
docker compose version
sudo ansible --version
echo "✅ devcontainer setup complete and verified!"