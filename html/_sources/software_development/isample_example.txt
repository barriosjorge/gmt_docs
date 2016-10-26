.. _Isample_example:

ISample Example
===============

Retreive the sample model files from `here <../_static/isample_dcs.tgz>`_ and execute:

.. code-block:: bash

   $ tar xvfz isample_dcs.tgz
   $ cd isample_dcs

   $ export GMT_DEV=$PWD/isample_dcs
   $ gds codegen -e isample_dcs
   $ gmake -C src/runtime/src/idcs/isample_dcs -j8 install

The executables are located in `src/runtime/src/idcs/isample_dcs/install`.


:ref:`[back to top] <isample_example>`
 

