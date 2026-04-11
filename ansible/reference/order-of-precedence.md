Phase 1: The Hardware Foundation (Critical Path)

Goal: Get the OS talking to your dual Quadro M2000s.

    NVIDIA Driver Installation: (Refer to your setup-nvidia.md)

        This is the most "destructive" step because it involves kernel modules.

        Action: Install the recommended proprietary drivers (likely nvidia-driver-535 or similar).

        Validation: Run nvidia-smi and confirm both M2000 GPUs appear.

    CUDA Toolkit Installation:

        Action: Install the version of CUDA that matches your driver and the requirements of your RAG stack (e.g., Milvus/PyTorch).

        Validation: Run nvcc --version.



Phase 2: System Utilities & Workflow

Goal: Make the system usable and ensure the secondary drive handles the load.

    GPU Monitoring & Aliases: (Refer to your setup-gpu-aliases.sh)

        Action: Source your alias script in .bashrc.

        Validation: Test your custom commands (like gpustat or nvtop) to ensure you can monitor both cards easily.

    Storage Finalization (fstab):

        Action: Ensure /mnt/rag_data is set to auto-mount on boot so your repo is always there after a restart.



Phase 3: The AI Software Stack

Goal: Create an isolated environment for the RAG logic.

    Python Environment (venv/Conda):

        Action: Create a virtual environment inside /mnt/rag_data/repo.

        Why now? Because now the Python libraries can correctly "find" the CUDA paths we set up in Phase 1.

    Dependency Installation:

        Action: Install torch, langchain, llama-index, and your vector DB drivers.

    Data Ingestion & Testing:

        Action: Run your "Hello World" agent or Milvus ingestion script.
