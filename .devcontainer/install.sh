#!/bin/sh

# ------------------------------------------------------------------------------
# Terraform
# ------------------------------------------------------------------------------
TERRAFORM_VERSION=1.9.8
echo "🌍 Installing Terraform ${TERRAFORM_VERSION}..."
curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip
sudo unzip -o /tmp/terraform.zip -d /usr/local/bin
rm -f /tmp/terraform.zip
terraform -version

# ------------------------------------------------------------------------------
# AWS CLI
# ------------------------------------------------------------------------------
echo "☁️ Installing AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -o /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install --update
rm -rf /tmp/aws /tmp/awscliv2.zip
aws --version

# ------------------------------------------------------------------------------
# Ansible
# ------------------------------------------------------------------------------
echo "⚙️ Installing Ansible..."
sudo apt-get install -y ansible
ansible --version

# ------------------------------------------------------------------------------
# Custom Ansible Collection (SR Linux plugin)
# ------------------------------------------------------------------------------
echo "📚 Installing SR Linux Ansible Collection into project directory..."
mkdir -p /home/vscode/.ansible/collections/ansible_collections/nokia
git clone https://github.com/NetOpsChic/srlinux-ansible-collection.git /home/vscode/.ansible/collections/ansible_collections/nokia/srlinux


# Create ansible.cfg pointing to both local and global collection paths
cat <<EOF > /home/vscode/ansible.cfg
[defaults]
collections_path = .:~/.ansible/collections
host_key_checking = False
retry_files_enabled = False
EOF

# ------------------------------------------------------------------------------
# Python dependencies
# ------------------------------------------------------------------------------
echo "🐍 Installing Python packages..."
pip3 install --upgrade pip --break-system-packages
pip3 install requests netmiko pytest --break-system-packages