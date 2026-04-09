How-to Guide: Configuring Dual NVIDIA Quadros in a Dell OptiPlex 7050

This guide provides instructions for resolving the "Unsupported Video Configuration" halt when installing dual NVIDIA Quadro M2000 GPUs while maintaining use of the onboard HDMI port.
1. Tutorial: The "Permanent" BIOS Fix

If your BIOS settings revert to "Auto" after a power cycle, the system will halt. Ensuring your CMOS battery is healthy is the first step in a stable dual-GPU homelab setup.
Step A: CMOS Maintenance

    If you see a "Time-of-day not set" error, your BIOS is resetting to factory defaults.

    Action: Replace the CR2032 coin-cell battery on the motherboard. This allows the BIOS to "remember" your custom video routing even when the power cable is removed for hardware upgrades.

Step B: Video Routing Override

    Power on and tap F2 to enter BIOS.

    Navigate to Video > Primary Display: Set to Intel HD Graphics.

    Navigate to Video > Multi-Display: Set to Enabled.

    Apply and Save. These settings are now preserved by the new CMOS battery.

2. Reference: Hardware Mapping

The Dell OptiPlex 7050 Tower provides two physical PCIe slots capable of housing the M2000:

    Slot 2 (Primary): PCIe x16 (Blue)

    Slot 4 (Secondary): PCIe x4 (Black - Open Ended)

Component	Role	Connection
Intel HD 630	System Display	Onboard HDMI
Quadro M2000 (0)	CUDA / RAG Compute	PCIe Slot 2
Quadro M2000 (1)	CUDA / RAG Compute	PCIe Slot 4
3. Explanation: Why the "System Halted" Error Occurs

The "Unsupported Video Configuration" is a firmware-level safety check. Dell's engineering assumes that if a user buys a workstation with a dedicated GPU, they intend to use it. If the BIOS detects a cable in the motherboard while a GPU is present, it halts to prevent:

    Performance Loss: Users accidentally using slow integrated graphics for 3D tasks.

    Power Overdraw: Attempting to power the integrated graphics chip and multiple PCIe cards simultaneously on a limited wattage PSU.

By enabling Multi-Display, we explicitly tell the firmware to ignore this logic and allow all three controllers (Intel + 2x NVIDIA) to coexist.
4. How-to: Final OS Verification

Once the hardware is seated and the BIOS is configured:

    Boot into Ubuntu.

    Confirm the 8GB VRAM pool:
    Bash

    nvidia-smi

    Set persistence to ensure the "headless" compute cards don't drop into a low-power sleep state:
    Bash

    sudo nvidia-smi -pm 1

That’s a solid catch on the CMOS battery. It’s the small things that usually cause the biggest headaches in system engineering! Is the RAG server officially ready for some data now?
