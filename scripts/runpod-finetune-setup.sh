#!/bin/bash

# This script should be run at container startup
# It will check if setup has already been completed in /workspace
# If not, it will perform the initial setup

apt-get update && apt-get install -y vim rsync htop screen sudo curl git

# install asdf and asdf poetry globally
# Install asdf under /opt/asdf for system-wide access
ASDF_DIR=/opt/asdf

cd /workspace/
git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch v0.15.0

# Add asdf.sh to system-wide profile
echo ". ${ASDF_DIR}/asdf.sh" > /etc/profile.d/asdf.sh
# Make asdf accessible to all users
chmod -R 755 ${ASDF_DIR}
# Set PATH to include asdf
export PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:$PATH"

asdf plugin-add python
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
asdf install python 3.11.3
asdf global python 3.11.3

SETUP_MARKER="/workspace/.setup_complete"
USER_HOME_BASE="/workspace"

# List of users to create
USERS=("ronak" "alex" "soufiane" "louis" "jason")

# Function to perform initial setup
setup_workspace_environment() {
    echo "Performing /workspace setup..."

    # Create home directories and set up users
    for username in "${USERS[@]}"; do
        echo "Setting up user: $username"

        USER_HOME="$USER_HOME_BASE/$username"

        # Create user if it doesn't exist
        if ! id "$username" &>/dev/null; then
            useradd -d "$USER_HOME" -m "$username" -s /bin/bash -G sudo
            echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
        fi

        # Create user home directory
        chown -R "$username:$username" "$USER_HOME"
        mkdir -p "$USER_HOME/.ssh"
        chmod 700 "$USER_HOME/.ssh"
        touch "$USER_HOME/.ssh/authorized_keys"
        chmod 600 "$USER_HOME/.ssh/authorized_keys"
    done

    # Add public ssh keys for each user separately
    echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOF/mg3Qx/oJu4W9iDA/NzlhD3QRvTfGejbePlDin9lr ronakrm@gmail.com" > /workspace/home/ronak/.ssh/authorized_keys


    # Create marker file to indicate setup is complete
    touch "$SETUP_MARKER"
    echo "Workspace setup completed successfully"
}

# Main script logic
if [ -f "$SETUP_MARKER" ]; then
    echo "Workspace setup already completed, skipping initialization"
else
    setup_workspace_environment
fi