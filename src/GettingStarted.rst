.. _GettingStarted:

Getting Started
===============

Installation
------------
        
1. ...
2. ...
3. ...

.. code-block:: bash

   sudo ...

.. note::
   
   This is a note. Please replace *note* with somethine significant.

 
4. Configure your system `DNS <Services#dns>`_ to access the lab servers.
  
Kickstart Installation
----------------------
        
Clobber, deployed on gpodevsrv01, allows to kickstart your Linux server fully automatically.
Consult the documentation for more information. For a quick start, copy an existing system definition,
update the networking information there. Contact yout SWC administrator to obtain a new DNS name and IP.
The MAC Address *must* be updated appropriately as it defines the configuation used by the PXE boot.
Create a copy of the kickstart file and update as needed, in particular, update the partition
section with the installation disk target in your server.
        

:ref:`[back to top] <GettingStarted>`



