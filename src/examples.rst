----------------------
Running Examples (TBR)
----------------------

Run Example Components
------------------------------------------------------------

This example will start a set of c++ components from:

  *src/runtime/src/obs_fwk/core_fwk/c++/examples/example_components*

The components will send some messages to the log service and they can be received by a log client.
Each component performs a simple operation on input and sends the result to outputs.
The components can be connected with each other if they receive a setup of ports. For example we can connect them this way:

::

                        a1                  b1
        a2            +---+               +---+
      +---+           |   |<--------------|   |
      |   |<----------| + |               +---+
   <--| + |           |   |<-------+
      |   |<-----+    +---+        |        b2
      +---+      |                 |      +---+
                 |                 +------|   |
                 |                        +---+
                 |
                 |                          b3
                 |                        +---+
                 +------------------------|   |
                                          +---+


Setup Component Ports
---------------------

At the beginning the ports of each component are not setup. Any component can receive their port setup as follows:

  *Usage:*  ``setup_component  subsystem_name  component_name``

This will look into:

  `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/<subsystem_name>/<component_name>.cson`

for the port setup.

For example, *component_A1* has the following configuration in:

  `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/examples/component_A1.cson`

::

  component_setup:
        name     : 'examples/component_A1'
        port     : 8004
        host     : '127.0.0.1'
        rate     : '1000000'
        inputs   : [ [ "x2", "pull", "tcp://127.0.0.1:9001", "async", 1]
                     [ "x3", "pull", "tcp://127.0.0.1:9002", "async", 1] ]
        outputs  : [ [ "x1", "push", "tcp://127.0.0.1:9004", "async", 1] ]


To connect the example components as described in the previous section the following commands can be used:

.. code-block:: bash

  $ setup_component examples component_B1
  $ setup_component examples component_B2
  $ setup_component examples component_B3
  $ setup_component examples component_A1
  $ setup_component examples component_A2

Run Example Controller
----------------------

A basic controller with a temperature state variable is provided at:

  `src/runtime/src/obs_fwk/ctrl_fwk/c++/examples/basic_controller`

The configuration for this controller is:

  `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/examples/basic_controller.cson`

::

    component_setup:
        name     : 'examples/basic_controller'
        port     : 8001
        host     : '127.0.0.1'
        rate     : '1000000'
        inputs   : [ [ 'temperature_setpoint', 'pull', 'tcp://127.0.0.1:9001', 'async', 1] ]
        outputs  : [ [ 'temperature_monitor',  'push', 'tcp://127.0.0.1:9011', 'async', 1000] ]
    state_vars:
        temperature: { type: 'float', init: 23.4, min: 2.0, max: 26.1, url: 'tcp://127.0.0.1:9011' }



.. code-block:: bash

  $ run_basic_controller &
  $ setup_component examples basic_controller


Check Monitored Values
----------------------

Telemetry is a distributed service than can be started independently on each component as:

  *Usage:*  ``monitor_component  subsystem_name  component_name``


This command will start the telemetry adapters for this component and they will send monitored values to the server.
The telemetry service will:

- store data points in the database
- send the values to subscribers
- accept queries from clients

Note that monitors are the values of the state variables defined in the controller (state_var section).

For example, the following command will start sending 'temperature' data points to the telemetry service.

.. code-block:: bash

  $ monitor_component examples basic_controller

To check the monitored values a telemetry_client can be started in another unix terminal:

  *Usage:*  ``telemetry_client [topic]``

A query can also be sent to the telemetry service like this:


  *Usage:*  ``telemetry_query  monitor_name  num``


For example, the following will list the last 12 temperature values (from newest to oldest) from this controller:

.. code-block:: bash

  $ telemetry_query examples.basic_controller.temperature 12

All telemetry queries have to be done on specific monitors.

Send a Command to Controller
----------------------------

Some numeric values can be sent directly to ports of any controller like this:

  *Usage:*  ``send_value subsystem  controller  port_name value { int | float }``


For example:

.. code-block:: bash

  $ send_value examples basic_controller temperature_setpoint 23.3 float


This will send a temperature setpoint of 23.3 to the controller which should react to this change.
State var values shall change on the telemetry client.
When the temperature values are out the the defined range the log client should show the corresponding warning messages.

Ethercat Example
----------------

Keep the log_client and the telemetry_client open in different terminals.

This will start and setup the example ethercat adapter:

.. code-block:: bash

  $ run_ethercat_example &
  $ setup_component examples ethercat_example

To send the ethercat configuration to and EtherCAT Hw Adapter use the following command:

  *Usage:*  ``ethercat_config  subsystem_name  ethercat_adapter  configuration``

For example, the following command: 

.. code-block:: bash

  $ ethercat_config examples ethercat_example ethercat_config

will send the bus configuration defined in:

   `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/examples/ethercat_config.cson` bus config

to the 'ecat_config' port of the adapter.


.. note::
  - All EtherCAT adapters need an 'ecat_config' port in the their setup
  - Default EtherCAT objects defined at:

     `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/ethercat/ethercat_example.cson`

  - Ethercat config is still not included and generated from the model

HDK Controller With Ethercat Adapter
------------------------------------

.. code-block:: bash

  $ run_hdk_controller &
  $ setup_component hdk_cs hw_adapter
  $ ethercat_config hdk_cs hw_adapter
  $ setup_component hdk_cs controller
