.. _Isample_example:

ISample Example
===============

ISample DCS is an instrument control system example (ISample). This example provides
a template that instrument developers can use as a model.

Retreive the sample model files from `here <../_static/isample_dcs.tgz>`_ and execute:

.. code-block:: bash

   $ curl -O http://52.52.46.32/_static/isample_dcs.tgz
   $ tar xvfz isample_dcs.tgz
   $ cd isample_dcs
   $ gds codegen -e isample_dcs
   $ gmake -C src/runtime/src/idcs/isample_dcs -j`nproc` install

The executables are located in `src/runtime/src/idcs/isample_dcs/install`.

.. note::

  In this version isample includes the specification of a control package.
  All :ref:`DCS Packages <table-control_packages>` follow the same development principles with the difference
  that the Component base classes add specialized interfaces (e.g. Controller vs Pipeline). The next
  incremental release of the GMT software will include examples of user interface
  and data processing packages.



:ref:`[back to top] <isample_example>`


