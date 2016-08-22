.. _installation:

USB Drive Installation
======================

The GMT Software and Controls Release can be installed using a kickstart USB
Drive, following the procedures below, or manually via GitHub.  The USB drive
option performs the following in an automated way:

    * Populates all binary and system files
    * Installs all library dependencies
    * Configures environmental variables
    * Configures and starts services

The commands below are issued assuming that the user is using the Linux shell
environment.

Procedures
----------

1. Retreive the release iso image

  .. code-block:: bash
  
    $ curl -O http://52.52.46.32/srv/gmt/iso/standalone.iso


2. Create a bootable USB drive

  .. note::
    * The drive needs a minimum 3GB capacity.

  .. warning::
    * The iso will wipe the entire content of your USB drive!
    * You must properly identify the drive when you insert it in your machine.

  OS X - with drive on ``disk2``

  .. code-block:: bash

    $ diskutil list

    $ sudo diskutil unmountDisk /dev/disk2

    $ sudo dd bs=4m if=standalone.iso of=/dev/rdisk2

  Linux - with drive on ``sdb``

  .. code-block:: bash

    $ sudo umount /dev/sdb*

    $ sudo dd bs=4M if=standalone.iso of=/dev/sdb


3. Configure the BIOS on the Industrial PC (IPC)

  3.1  Turn on the IPC using the power switch and enter the BIOS settings using the <Del> key.

  3.2  In the Boot pane, set Option #1 to [USB stick].

    .. image:: _static/hdk-bios-usb.png
      :align: center
      :scale: 70 %
      :alt: BIOS boot configuration


  3.3 Insert USB drive into the IPC.

  3.4 Select 'Save & Exit' to exit the BIOS setup which reboots the system.


4. Install the distribution

  .. warning::
    * The installation will wipe the entire content of your CFast card!

  4.1 At the prompt, select the 'install' option.

  4.2 Press the <Tab> key. The following parameters are available:

    * **gmt.tz** sets the system timezone (provided by /usr/share/zoneinfo).

    * **gmt.ecat** sets the interface used by EtherCAT, keep the provided default.


  4.3 Wait until the installation completes.  The system will eventually reboot itself.

  4.4 Remove the USB drive or select the *local* option. The real-time kernel will be preselected by default in the boot manager (GRUB) menu.

  4.5 Boot, the system is ready.


Sanity Check
------------

1.  Log into the system as *root* or *gmto*.

2.  Basic Ethercat check

  .. code-block:: bash

    $ ethercat master
    $ ethercat slaves


3.  Basic mongodb check

  .. code-block:: bash

    $ systemctl status -l mongod


:ref:`[back to top] <installation>`

