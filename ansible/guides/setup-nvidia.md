#### Technical instructions for configuring GPU acceleration. 
#### It details installing the NVIDIA drivers, Container Toolkit, and ensuring 
#### the CUDA environment is visible to the RAG application.

[Nvidia Driver Configuration: Quadro M2000]
Prerequisites

    Ubuntu 24.04.4 LTS fresh install.

    Hardware: Dell OptiPlex 7050 with Nvidia Quadro M2000 (Maxwell architecture).

    User has sudo privileges.

    Secure Boot is disabled in the Dell BIOS (recommended to avoid module signing issues).

State of the system before this change

    The system is currently using the open-source nouveau driver.

    Running nvidia-smi results in a "command not found" error.

    Monitor is connected via the onboard HDMI interface (Intel HD Graphics).

Execution Steps

Step 1: Clean the environment and update PCI IDs
Bash

sudo apt autoremove --purge '^nvidia-.*' -y
sudo update-pciids

Step 2: Install the 535-branch driver and DKMS
Bash

sudo apt update
sudo apt install nvidia-driver-535 dkms linux-headers-$(uname -r) -y

Step 3: Reboot the system
Bash

sudo reboot

Verification

Run the Nvidia System Management Interface:
Bash

nvidia-smi

    Check: You should see a table displaying "Quadro M2000" and "4096MiB" (VRAM).

    Check: The "Processes" section at the bottom should show no errors.

Rollback Procedure

If the driver causes a "black screen," boot into Recovery Mode from the GRUB menu and run:

Step 1: Purge the Nvidia drivers
Bash

sudo apt autoremove --purge '^nvidia-.*' -y

Step 2: Re-enable the default kernel drivers
Bash

sudo apt install --reinstall xserver-xorg-video-nouveau
sudo dpkg-reconfigure xserver-xorg

Observations/Lessons Learned

    Maxwell Support: The Quadro M2000 is a Maxwell card; newer 560+ drivers may cause instability or lack of support. Stick to the 535 LTS branch for this lab.

    BIOS Conflict: If nvidia-smi says "could not communicate with the Nvidia driver," ensure Secure Boot is OFF in the OptiPlex BIOS settings.
