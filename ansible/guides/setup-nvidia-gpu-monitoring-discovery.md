[NVIDIA GPU Monitoring and Discovery]

Prerequisites

    NVIDIA drivers (e.g., version 535+) installed on Ubuntu 24.04.

    At least one NVIDIA GPU (e.g., Quadro M2000) physically installed and recognized by the kernel.

    [State of the system before this change]: The system is powered on, and the user has terminal access to the RAG server.

Execution Steps

    Step 1: List all detected GPUs This command provides a clean list of all recognized hardware to ensure the OS sees both cards.
    Bash

    nvidia-smi --list-gpus

    Step 2: Generate full system status Run the standard management interface to see the full table of temperatures, power, and memory.
    Bash

    nvidia-smi

    Step 3: Filter for specific model statistics Use grep to isolate the performance data specifically for the Quadro M2000 cards, excluding the header noise.
    Bash

    nvidia-smi | grep -A 1 "Quadro M2000"

Verification (The "How do I know it worked?" check)

    --list-gpus should return two entries (GPU 0 and GPU 1) once your second card is installed.

    The grep command should return a 2-line block for each card (the name line and the stats line).

    The Memory-Usage section should show 4096MiB as the total capacity for each card.

Rollback Procedure (The "Take-back" plan)

    These are "Read-Only" diagnostic commands; they do not alter system state. No rollback of the commands themselves is necessary.

    If nvidia-smi fails to report the second card after installation, run:
    Bash

    sudo update-initramfs -u
    reboot

Observations/Lessons Learned

    The Grep Gap: The -A 1 flag is vital because NVIDIA’s table puts the "Quadro M2000" name on one line and the VRAM/Utilization data on the line immediately following it. Without -A 1, you only see the name.

    Persistence Mode: If you notice a delay when running these commands, consider enabling Persistence Mode (sudo nvidia-smi -pm 1) to keep the driver loaded and the query response times near-instant.

    VRAM Limits: For RAG tasks, remember that 4096MiB is a hard limit. Loading two different models (one on each card) is often more efficient than trying to "split" a single large model across two older cards like the M2000.
