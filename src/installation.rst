.. _installation:

Installation
============

1. Retreive the release iso image

.. code-block:: bash

   > curl -O http://52.52.46.32/srv/gmt/iso/standalone.iso

2. Create a bootable USB drive

.. note::
   * The drive needs a minimum 3GB capacity.
.. warning::
   * The iso will wipe the entire content of your USB drive!
   * You must properly identify the drive when you insert it in your machine.

OS X - with drive on ``disk2``

.. code-block:: bash
   
   > diskutil list

   > sudo diskutil unmountDisk /dev/disk2

   > sudo dd bs=4m if=standalone.iso of=/dev/rdisk2

Linux - with drive on ``sdb``
   
 
.. code-block:: bash
   
   > sudo umount /dev/sdb*
   
   > sudo dd bs=4M if=standalone.iso of=/dev/sdb

3. Configure the BIOS on the Industrial PC (IPC)

  3.1 Reboot the IPC

  3.2 Enter the BIOS settings using the <Del> key

  3.3 In the Boot menu, set Option #1 to USB stick

  .. image:: _static/hdk-bios-usb.png
     :align: center
     :scale: 70 %
     :alt: BIOS boot configuration
  
 

4. Install the distribution

.. warning::
   * The installation will wipe the entire content of your CFast card!

..

  4.1 Insert USB drive in the IPC

  4.2 Power on the IPC

  4.3 At the prompt, select the 'install' option

  4.4 Press the <Tab> key. In the append entries, set the following:
  
  * **gmt.tz** sets the system timezone (provided by /usr/share/zoneinfo)

  * **gmt.ecat** sets the interface used by EtherCAT, keep the provided default.

  4.5 Wait until the installation completes

The system will eventually reboot itself.
Remove the USB drive or select the 'local' option.
The real-time kernel will be preselected by default in the 'GRUB' menu.
Boot, the system is ready.

5. Sanity check

Log into the system as root or gmto.

Basic Ethercat check:

.. code-block:: bash
   
   > ethercat master
   > ethercat slaves

Basic mongodb check:

.. code-block:: bash
   
   > systemctl status -l mongod

       

:ref:`[back to top] <installation>`



