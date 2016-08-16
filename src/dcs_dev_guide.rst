--------------------------------------
TO BE REVIEWED - Creating a Device Control System (DCS)
--------------------------------------

Edit the System Master File
---------------------------

In order to add a Device Control System (DCS) first it's necessary to add it to the master file:

                            src/model/db/swc_sys.coffee

In the example provided we create hdk_cs (hardware developer kit control system) with the control package (hdk_ctrl_pkg) and two components inside: one controller and one adapter.

::

       hdk_cs:
           wbs: "1.3.3.2"
           pbs: "3.1.2"
           elements:
               hdk_ctrl_pkg:
                   elements:
                       hdk_controller: { instances: 1, c_factor: 1, r_factor: 1, procurement: "swc", phase: "design", resource: "labor", assignee: "person1", fte_perc: "100", status: "NON_STARTED",   activity_type: "activity", release: [1], stage: "1" }
                       hdk_hw_adapter:  { instances: 1, c_factor: 1, r_factor: 1, procurement: "swc", phase: "design", resource: "labor", assignee: "person1", fte_perc: "100", status: "NON_STARTED", activity_type: "activity", release: [1], stage: "1" }


Define the Components in the Model
----------------------------------

In this case we'll create the HDK_CS as an Instrument DCS:

::

                src/model/db/idcs/hdk_cs/hdk_cs.coffee
                src/model/db/idcs/hdk_cs/hdk_cs.rst
                src/model/db/idcs/hdk_cs/loader.coffee

NOTE: The src/model/db/idcs/loader.coffee shall include the hdk_cs/loader file.

Compile the Model
-----------------

From the ${GMT_ROOT} folder run

.. code-block:: bash

    > make

This will compile the model files an check for some errors.

Load the Model
--------------

Run the following command to start the command line

.. code-block:: bash

    ${GMT_ROOT}/bin/gmt

The model is loaded into memory and the gmt model prompt is shown

.. code-block:: bash

     gmt(1.0): Loading models...
     gmt>

Generate C++ Code
-----------------

We can generate the C++ skeletons from the model as follows:

.. code-block:: bash

            gmt> gmt.model.<subsystem>.gen_code()

or:

.. code-block:: bash

            gmt> gmt.model.<package>.gen_code()

For example, as we only have one package defined in the hdk_cs we can use:

.. code-block:: bash

            gmt> gmt.model.hdk_ctrL_pkg.gen_code()

These files are generated into src/runtime/src/idcs/hdk_cs/hdk_ctrl_pkg as defined in the model files.
If a file already exist a warning is shown. In this case the existing file shall be renamed or removed.
After the files are generated we still need to do a couple of things manually:

The same controller can have many instances with different names and configurations.
Copy the configuration file as instance configuration file into the config directory and use the same instance name than in the model files.

.. code-block:: bash

        > cp hdk_controller_config.cson ${GMT_ROOT}/src/runtime/db/config/hdk_cs/controller.cson
        > cp hdk_hw_adapter_config.cson ${GMT_ROOT}/src/runtime/db/config/hdk_cs/hw_adapter.cson

Note: configuration files shall be manually edited.

Make and Run the Generated Component
------------------------------------

The binaries are in the build/ folder using make

.. code-block:: bash

       > make

and can be executed from there or installed in the bin directory.

.. code-block:: bash

        > ./build/run_hdk_controller

This shall start the controller, sending some logs and wait for the setup.

In C++ if the GMT_DEBUG is defined at compile time log messages and compiler debug info is included.
If not defined DEBUG messages and debug info is not included in the executables.

Modify the Generated Controller
-------------------------------

Follow the provided examples to modify and run your own controllers.
