This is the native utility provided with your NVIDIA drivers. It gives you a snapshot of current GPU health and load.

    Quick Check: Run nvidia-smi.

    Live Monitoring: To see updates every second (useful while running a RAG query), use:
    Bash

    watch -n 1 nvidia-smi

    What to look for: The Volatile GPU-Util percentage represents the percent of time your CUDA cores were active over the last sample period.
