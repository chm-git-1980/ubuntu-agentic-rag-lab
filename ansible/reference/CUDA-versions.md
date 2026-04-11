As of April 2026, the most up-to-date stable release is CUDA Toolkit 13.2, which was released on March 9, 2026.

Your current setup is running CUDA 12.2 on the 535.288.01 driver. While this was a very stable baseline for RHEL 8/9 and Rocky Linux environments, it is now several generations behind the current "bleeding edge."
Current Version Landscape
Component	Your Version	Latest Version (April 2026)
CUDA Toolkit	12.2	        13.2
NVIDIA Driver	535.288.01	595.x (R595 Branch)
Key Considerations for Your Hardware

Since you are working with an NVIDIA Quadro M2000 (Maxwell architecture) in your Dell OptiPlex 7050 build, there are a few technical "gotchas" to keep in mind regarding these newer versions:

    Maxwell Support: While CUDA 13.x generally maintains support for the Maxwell architecture (sm_52), NVIDIA has begun deprecating older compute capabilities. For example, Kepler support was fully dropped in the CUDA 12.x cycle.

    Driver vs. Runtime Version: Your nvidia-smi output shows CUDA Version: 12.2. This is the maximum CUDA version supported by your current 535.x driver. To use CUDA 13.x features, you would need to upgrade your host driver to at least the R545 or R550 branch (or utilize the CUDA Forward Compatibility packages if you are on a restricted RHEL/Rocky kernel).

    RAG & LLM Performance: If you are using this card for your local RAG server, sticking with a stable 12.x or 13.x release is fine, but ensure your PyTorch or llama-cpp-python builds match the installed toolkit version to avoid libcudart errors.
