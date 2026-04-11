If you need to see "under the hood" metrics like streaming multiprocessor (SM) usage versus encoder/decoder usage (if you're processing video data for RAG), use the "device monitor" mode:
Bash

nvidia-smi dmon -s u

This outputs a scrolling list where:

    sm: Standard CUDA core utilization.

    mem: Memory bandwidth utilization.

    enc/dec: Video encoding/decoding (usually 0 for text-based RAG).
