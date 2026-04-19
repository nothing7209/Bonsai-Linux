# Bonsai Linux

Bonsai Linux is a streamlined, high-performance Linux distribution based on the stable Fedora framework. The project is inspired by the art of Bonsai, focusing on the deliberate pruning of the standard workstation environment to create a refined, efficient, and balanced operating system. By removing unnecessary background services and pre-installed software, Bonsai Linux provides a clean and responsive foundation for users who value architectural simplicity and system speed.

## Core Philosophy
The distribution is designed to be a **pruned** version of its upstream base. It eliminates the overhead often found in general-purpose operating systems, delivering a minimalist desktop experience without sacrificing the stability or security of the underlying RPM-based ecosystem. Every component is selected to ensure that the system remains lightweight yet fully capable of modern computing tasks.

## Technical Specifications
* **Base System:** Stable Fedora Linux
* **Architecture:** x86_64
* **Build Architecture:** Custom Kickstart-driven image generation
* **Compression:** High-ratio XZ-compressed Squashfs for an optimized ISO footprint
* **Package Management:** DNF/RPM for reliable software deployment and updates

## Key Features
* **Optimized Performance:** Reduced background processes to maximize CPU and RAM availability.
* **Minimalist Environment:** A clean slate for users to build their own custom workflow.
* **Modern Hardware Support:** Includes the latest stable Linux kernel and drivers.
* **Professional Foundation:** Built using professional-grade deployment tools for maximum system integrity.

---

## Installation Guide

### 1. Prepare the Installation Media
Download the latest ISO image and flash it to your USB drive. You can use standard tools such as **Fedora Image Writer**, **GNOME Disks**, or the dd command-line utility.

### 2. Boot the Live Environment
Insert the USB drive into your computer and restart. Enter your system's boot menu (usually via **F12**, **F11**, or **Esc**) and select the USB drive as the primary boot device.

### 3. Permanent Installation
Once the Bonsai Linux live desktop has loaded, you can explore the system. To install it permanently to your hard drive:
* Launch the **Install to Hard Drive** application.
* Follow the on-screen instructions for language selection, disk partitioning, and user account creation.

### 4. Finalize
After the installation process is complete, restart your computer and remove the USB drive. Your new Bonsai Linux system is now ready for use.

---

## Contributing
As an open-source project, contributions to the Kickstart configurations and build scripts are welcome. Please submit pull requests or report issues via the project repository.
