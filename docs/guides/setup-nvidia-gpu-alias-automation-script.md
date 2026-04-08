[NVIDIA GPU Alias Automation Script]

Prerequisites

    Git installed on your Ubuntu 24.04.4 LTS server.

    A GitHub account and repository (optional but recommended for remote storage).

    [State of the system before this change]: User manually types long nvidia-smi strings or grep commands.

Execution Steps

    Step 1: Create the setup script
    On your local machine (or directly on the server), create a file named setup_gpu_aliases.sh:
    Bash

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

    Step 2: Make it executable and push to GitHub
    Bash

    chmod +x setup_gpu_aliases.sh
    git add setup_gpu_aliases.sh
    git commit -m "Add GPU monitoring aliases script"
    git push origin main

    Step 3: Download and run on the server
    On your RAG server (or when the second card arrives), run:
    Bash

    curl -O https://raw.githubusercontent.com/[YOUR_USERNAME]/[REPO_NAME]/main/setup_gpu_aliases.sh
    bash setup_gpu_aliases.sh
    source ~/.bashrc

Verification

    Type gpu-list to see your current Quadro.

    Type gpu-monitor to see the filtered grep output.

    Run alias to see the full list of active shortcuts.

Rollback Procedure

    If you want to remove the aliases, run:
    Bash

    sed -i '/gpu-list\|gpu-stat\|gpu-monitor\|gpu-util/d' ~/.bashrc
    unalias gpu-list gpu-stat gpu-monitor gpu-util

Observations/Lessons Learned

    The Escaping Gotcha: When writing the script, notice the \" inside the gpu-monitor alias. Because we are wrapping the alias in quotes inside a cat command, we must escape the inner quotes so they are written correctly to .bashrc.

    Source vs. Bash: Running a script with bash script.sh creates a sub-shell. To ensure the aliases work in your current terminal session immediately, you must run source ~/.bashrc after the script finishes.

    GitHub Privacy: If your repository is private, you will need to use a Personal Access Token (PAT) or SSH keys to curl the file.

Pro Tip for Two Cards

Once your second M2000 is installed in two days, the gpu-util alias will be your most helpful tool. It provides a clean, CSV-style readout that is much easier to read than the standard table when you have multiple GPUs.
