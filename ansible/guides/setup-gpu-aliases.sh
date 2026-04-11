cat << 'EOF' > setup_gpu_aliases.sh
#!/bin/bash

# Define the aliases
ALIAS_LIST="
alias gpu-list='nvidia-smi --list-gpus'
alias gpu-stat='nvidia-smi'
alias gpu-monitor='nvidia-smi | grep -A 1 \"Quadro M2000\"'
alias gpu-util='nvidia-smi --query-gpu=index,name,memory.used,utilization.gpu --format=csv'
"

# Append to .bashrc if not already present
if ! grep -q "gpu-monitor" ~/.bashrc; then
    echo "$ALIAS_LIST" >> ~/.bashrc
    echo "Aliases added to ~/.bashrc"
else
    echo "Aliases already exist in ~/.bashrc"
fi

# Reload bashrc to apply changes immediately
source ~/.bashrc
echo "Environment reloaded. You can now use: gpu-list, gpu-stat, gpu-monitor, and gpu-util."
EOF
