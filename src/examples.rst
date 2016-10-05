----------------------
Running Examples
----------------------

GMT Components
---------------

Components are the simple building blocks in the GMT software architecture and they will be used extensively at all levels.
A software component is a unit of composition with contractually specified interfaces and explicit context dependencies only.
Ports are interaction points for components. They can be the data inputs (required interface) or the data outputs (provided interface) of our components.
By using a port, our component is able to de-couple the internals of the component from external entities. The component does not assume anything about external entities.
Any data type can be used in ports: C++ templates, dynamic types, etc.

A GMT Component is able to perform a periodic task and/or is able to interact with other similar components. Components are reactive to their interfaces from the very beginning.
Instead of being called by an external entity they have an internal loop (step) which reacts continuously to inputs and drives the corresponding outputs.
Commands in the sense of “remote calls” from other components do not exist. Only reaction to inputs.

Example: instead of having a moveTo(position) and getPosition() commands we can have:

    - An input port with the demanded_position
    - An output with the current_position
    - The step() reacts to the demanded position and updates the current

The most simple possible component that can be created is like this:

.. code-block:: cpp

    struct SimpleComponent : public Component<Component_Conf>  // most simple possible component
    {
        SimpleComponent(std::string uri): Component(uri) {}
        inline void step()  { log_info("hello, component world"); } // prints a log message every second (default)
    };

This component does not have any input or output ports but has a *step()* function that runs at the default rate of 1 second.
This step only creates a log message at every step but could be used for any other purpose.

Let's see an example with input and output ports. The following diagram show a component called Sum with two inputs ports and one output port.
The output port is the sum of the inputs ports:

.. code-block:: bash

                    Sum
                 ---------
                 |        |
              <--|x1    x2|<--        x1 = x2+x3
                 |        |
                 |      x3|<--
                 |        |
                 ----------


The class definition for this component is:

.. code-block:: cpp

    class Sum : public Component<Component_Conf>
    {
        public:
            inline Sum(std::string uri): Component(uri), x1(0), x2(1), x3(2) {}

            inline void setup() {
                new_output_port(x1,"x1");
                new_input_port(x2,"x2");
                new_input_port(x3,"x3");
            }

            inline void step() {
                x1 = x2 + x3;
                log_info("sum = " + std::to_string(x1));
            }

        private:
            int x1, x2, x3;
    };

This example only includes integer ports but any type can be used.  The input and output ports default value can be set during a the constructor.
The step() computes the sum and the setup() function is responsible for associating the internal component variables with the corresponding ports.
Once this association is made the ports automatically update (send or receive) the inputs and output values at each step.
The component does not need to do update the ports because, for any component, the framework performs the following generic step:

.. code-block:: cpp

    void Component::generic_step() {
        read_setup();
        read_inputs();
        step();
        write_outputs();
    }

Connecting Components
---------------------

The great thing about components is that they can be easily connected with other components to perform a much more complex function.
A connector is a link that enables communication between components. A connector simply means that runtime component instances can communicate using their ports.

Let's create a component type called Inc with just one output port. This component has an initial value that is incremented at every step.
If the internal counter is reset every 1000 steps.

.. code-block:: bash

               Inc
           ----------
           |        |
        <--|x1      |      x1 = x1+1
           |        |
           |        |
           |        |
           ----------


This is the equivalent c++ class:

.. code-block:: cpp

    class Inc : public Component<Component_Conf>
    {
        public:
            inline Inc(std::string uri): Component(uri), x1(0) {}

            inline void setup() {
                new_output_port(x1,"x1");
            }

            inline void step() {
                x1++;
                if (x1>1000) x1=0;
                log_info("x1 = " + std::to_string(x1));
            }

        private:
            int x1;
    };

Now we can create several instances of the Inc and Sum component classes and, connecting inputs and outputs, we could create a component network like this:

.. code-block:: bash

                       sum1                inc1
      sum2            +---+               +---+
      +---+           |   |<--------------|   |
      |   |<----------| + |               +---+
   <--| + |           |   |<-------+
      |   |<-----+    +---+        |       inc2
      +---+      |                 |      +---+
                 |                 +------|   |
                 |                        +---+
                 |
                 |                         inc3
                 |                        +---+
                 +------------------------|   |
                                          +---+

Note that this diagram includes five **connectors** between components. These connectors allow to move data between components.
At each step, if the connector is setup, the output of each component instance is sent to the next component in the connector.
It's important to know that **each component does not know if connectors exist**: they do not have references to other components.
Each component reads its inputs and proceeds according these values to run the step and write the corresponding outputs.
Components will run even when their ports are not connected to other components.

The code of this example can be seen at:

            *src/runtime/src/obs_fwk/core_fwk/c++/examples/example_components*

Running the example components
------------------------------

In one terminal open a log_client so

.. code-block:: bash

    $ log_client
    log client subscribed at port tcp://127.0.0.1:9995

In a second terminal run the example components

.. code-block:: bash

    $ run_example_components

After this command the example components will start to send log messages to the log service so we should see something like:

.. code-block:: bash

    [gmto@gpodevsrv02 core]$ log_client
    log client subscribed at port tcp://127.0.0.1:9995
    [INF] 2016-09-06T16:24:38.730Z [gmt://examples/my_app:7000] starting
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/my_app:7000] init
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/simple_component:8000] starting
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/component_inc1:8001] starting
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/component_inc2:8002] starting
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/component_inc3:8003] starting
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/component_sum1:8004] starting
    [INF] 2016-09-06T16:24:38.731Z [gmt://examples/component_sum2:8005] starting
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/component_inc2:8002] x1 = 1
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/component_inc3:8003] x1 = 1
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/component_inc1:8001] x1 = 1
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/my_app:7000] app step num = 0
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-06T16:24:38.732Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T16:24:39.732Z [gmt://examples/component_inc2:8002] x1 = 2
    [INF] 2016-09-06T16:24:39.732Z [gmt://examples/simple_component:8000] hello, component world

At the startup the components are not setup and ports can't be connected so each component is running alone.
For example, let's see what the component sum2 is doing:

.. code-block:: bash

    $ log_client sum2
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: sum2
    [INF] 2016-09-06T16:34:57.300Z [gmt://examples/component_sum2:8005] starting
    [INF] 2016-09-06T16:34:57.301Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T16:34:58.301Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T16:34:59.301Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T16:35:00.301Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T16:35:01.301Z [gmt://examples/component_sum2:8005] sum = 3

In this case the component sum2 is still not receiving values from other components so it's only processing the default inputs.
As the ports x2 and x3 are always:

::
                        sum2.x2 = 1   (see default constructor for Sum class components)
                        sum2.x3 = 2
then
::
                        sum2.x1 = 3

In order to receive data from other components all components ports shall be setup.

Setup Components and Ports
--------------------------

When a components starts it will automatically run its step() loop at the required rate.
On each step() it checks its inputs, process the inputs and sets the outputs. At the init phase only the setup port is ready.
It can receive the following component setup:

    - tcpip_port num
    - Rate (can be dinamically changed)
    - Inputs: list of ports
    - Outputs: list of ports
    - Per each port: name, protocol (push/pull …), url, mode, step_rate

Any component can receive its setup using:

    *Usage:*  ``setup_component  subsystem_name  component_name``

This command will look the component configuration at:

    `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/<subsystem_name>/<component_name>.cson`

For example, *component_sum1* has the following configuration in:

    `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/examples/component_sum1.cson`

::

    component_setup:
        name        : 'examples/component_sum1'
        port        : 8004
        host        : '127.0.0.1'
        rate        : '1000000'
        input_ports : [ [ "x2", "pull", "tcp://127.0.0.1:9001", "async", 1]
                        [ "x3", "pull", "tcp://127.0.0.1:9002", "async", 1] ]
        output_ports : [ [ "x1", "push", "tcp://127.0.0.1:9004", "async", 1] ]


To connect all the example components as described in the previous section the following commands can be used:

.. code-block:: bash

    $ setup_component examples component_inc1
    setup file: /home/user/work/gmt_model/install/var/lib/gmt/cson/runtime/db/config/examples/component_inc1.cson
    setup url: tcp://127.0.0.1:8001
    $ setup_component examples component_inc2
    setup file: /home/user/work/gmt_model/install/var/lib/gmt/cson/runtime/db/config/examples/component_inc2.cson
    setup url: tcp://127.0.0.1:8002
    $ setup_component examples component_inc3
    setup file: /home/user/work/gmt_model/install/var/lib/gmt/cson/runtime/db/config/examples/component_inc3.cson
    setup url: tcp://127.0.0.1:8003
    $ setup_component examples component_sum1
    install/var/lib/gmt/cson/runtime/db/config/examples/component_sum1.cson
    setup url: tcp://127.0.0.1:8004
    $ setup_component examples component_sum2
    setup file: /home/user/work/gmt_model/install/var/lib/gmt/cson/runtime/db/config/examples/component_sum2.cson
    setup url: tcp://127.0.0.1:8005

and in terminal two we can see that the the component A2 is num processing the other component inputs.

.. code-block:: bash

    $ log_client sum2
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: sum2
    [INF] 2016-09-06T17:21:57.385Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T17:21:58.385Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T17:21:59.385Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T17:22:00.386Z [gmt://examples/component_sum2:8005] new setup received
    [INF] 2016-09-06T17:22:00.386Z [gmt://examples/component_sum2:8005] new port [x1 -> tcp://127.0.0.1:9005/push~async@1]
    [INF] 2016-09-06T17:22:00.386Z [gmt://examples/component_sum2:8005] new port [x2 -> tcp://127.0.0.1:9004/pull~async@1]
    [INF] 2016-09-06T17:22:00.386Z [gmt://examples/component_sum2:8005] new port [x3 -> tcp://127.0.0.1:9003/pull~async@1]
    [INF] 2016-09-06T17:22:00.386Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-06T17:22:01.386Z [gmt://examples/component_sum2:8005] sum = 22
    [INF] 2016-09-06T17:22:02.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:03.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:04.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:05.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:06.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:07.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:08.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:09.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:10.386Z [gmt://examples/component_sum2:8005] sum = 63
    [INF] 2016-09-06T17:22:11.386Z [gmt://examples/component_sum2:8005] sum = 73
    [INF] 2016-09-06T17:22:12.386Z [gmt://examples/component_sum2:8005] sum = 93
    [INF] 2016-09-06T17:22:13.386Z [gmt://examples/component_sum2:8005] sum = 93

All components, except the application, run at the 1s rate. The application has a 3s step rate.
The application will run for 1000 steps and then will automatically finish (see application source code).

Hardware Adapters: Ethercat Example
-----------------------------------

The GMT control system has to interface with many kinds of sensors and actuators which are connected to the optomechanical devices.
EtherCAT will be used as the interface with most systems but other kind of interfaces and protocols such as serial port, usb or cameralink will be required.
The I/O Framework (io_fwk) provides the infrastructure to interface with this hardware in a standard way for GMT purposes.
The interface between the control system and the hardware of the system under control is done by means of Hardware Adapters (HwAdapter class).
Hardware Adapters encapsulate the system device drivers, in most cases provided by external libraries, required to access the hardware and they adapt the driver interface to the GMT standard interface.

Device drivers are in general externally developed and have a custom interface. Some work is required to integrate them with the rest of the control system software.
Using HwAdapters as regular GMT Components simplifies operations and interfaces at low level and allows a better integration with the rest of the control system for things like:

    - Telemetry: monitor some device driver input/output
    - Create user interface panels
    - Sequencing for engineering or testing
    - Integrate simulators with the same interface than the real system
    - Anything that is developed for the general components can be used with no change with the HwAdapters

The EtherCAT Hardware Adapter (EthercatAdapter class) is responsible to integrate EtherCAT fieldbuses with other components.
When one subsystem needs to use EtherCAT it can inherit from the EthercatAdapter class in order to connect with the hardware that needs in a convenient way.
Let's see an example using this adapter.

This example provides an specific hardware adapter (that inherits from EtherCAT) and using in/out ports it connects to the external actuators and sensors.
This specific example can be connected to the GMT Hardware Development Kit (HDK).

Please, see this example source code at

    `${GMT_ROOT}/src/runtime/src/obs_fwk/io_fwk/c++/examples/ethercat_example'

In order to run this example keep the log_client open in a different terminal. Then we can start the example as:

.. code-block:: bash

    $ run_ethercat_example &

In the log_client terminal the following message should shown:

    [INF] 2016-09-07 16:56:47.220166219 UTC [gmt://examples/ethercat_example:8001] starting

At this point the adapter is waiting to receive the port setup so we can do:

.. code-block:: bash

    $ setup_component examples ethercat_example

And the following messages shall be shown:

.. code-block:: bash

    [INF] 2016-09-07 16:56:52.196852312 UTC [gmt://examples/ethercat_example:8001] new setup received
    [INF] 2016-09-07 16:56:52.196938558 UTC [gmt://examples/ethercat_example:8001] new port [ecat_config -> tcp://172.16.10.13:9001/pull~async@1]
    [INF] 2016-09-07 16:56:52.196983446 UTC [gmt://examples/ethercat_example:8001] new port [dig_out -> tcp://172.16.10.13:9002/pull~async@1]
    [INF] 2016-09-07 16:56:52.197019790 UTC [gmt://examples/ethercat_example:8001] new port [motor_ctrl -> tcp://172.16.10.13:9003/pull~async@1]
    [INF] 2016-09-07 16:56:52.197073296 UTC [gmt://examples/ethercat_example:8001] new port [dig_in -> tcp://172.16.10.13:9100/push~async@1]
    [INF] 2016-09-07 16:56:52.197136764 UTC [gmt://examples/ethercat_example:8001] new port [temperatures -> tcp://172.16.10.13:9101/push~async@1]
    [INF] 2016-09-07 16:56:52.197192761 UTC [gmt://examples/ethercat_example:8001] new port [motor_state -> tcp://172.16.10.13:9102/push~async@1]

Apart of the standard component setup, the EthercatAdapter needs the Ethercat bus configuration which includes:

    - Masters: id and rate
    - Slaves: name, type, position, master
    - Domains: id, master, rate
    - PDO and SDO: name, std_name, slave, domain, index, subindex, bit

We can send the ethercat configuration through the *ecat_config* port using the following command:

  *Usage:*  ``ethercat_config  subsystem_name  ethercat_adapter  configuration``

This port is already defined in the base class. Specific adapters only define the required ports.

For example, the following command:

.. code-block:: bash

  $ ethercat_config examples ethercat_example ethercat_config

will send the bus configuration defined in:

   `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/examples/ethercat_config.cson` bus config

to the *ecat_config* port of the adapter.

.. note::

  - Default EtherCAT objects defined at:

     `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/ethercat/ethercat_example.cson`

When the configuration is receive the adapter will start to connecting to slaves and loading the required PDOS/SDOs:

.. code-block:: bash

    [INF] 2016-09-07 16:57:01.910184951 UTC [gmt://examples/ethercat_example:8001] ethercat config received: 7 slaves 6 inputs 11 outputs
    [INF] 2016-09-07 16:57:01.910198652 UTC [gmt://examples/ethercat_example:8001] loading master: 0 with 1000 µs step rate (1000.000000 Hz)
    [INF] 2016-09-07 16:57:01.910206325 UTC [gmt://examples/ethercat_example:8001] loading domain: 0 with 10000 µs step rate (100.000000 Hz)
    [INF] 2016-09-07 16:57:01.910209518 UTC [gmt://examples/ethercat_example:8001] loading domain: 1 with 1000000 µs step rate (1.000000 Hz)
    [INF] 2016-09-07 16:57:01.910212901 UTC [gmt://examples/ethercat_example:8001] loading slave: coupler (EK1100-11)
    [INF] 2016-09-07 16:57:01.910216096 UTC [gmt://examples/ethercat_example:8001] loading slave: dig_inp (EL1809-10)
    [INF] 2016-09-07 16:57:01.910218277 UTC [gmt://examples/ethercat_example:8001] loading slave: dig_out (EL2809-10)
    [INF] 2016-09-07 16:57:01.910221097 UTC [gmt://examples/ethercat_example:8001] loading slave: ana_inp (EL3002-14)
    [INF] 2016-09-07 16:57:01.910222788 UTC [gmt://examples/ethercat_example:8001] loading slave: pt100 (EL3202-14)
    [INF] 2016-09-07 16:57:01.910225430 UTC [gmt://examples/ethercat_example:8001] loading slave: ana_out (EL4032-13)
    [INF] 2016-09-07 16:57:01.910227145 UTC [gmt://examples/ethercat_example:8001] loading slave: motor (EL7041-17)
    [INF] 2016-09-07 16:57:01.910237600 UTC [gmt://examples/ethercat_example:8001] loading data object => EL1809-10:RED Push Button (24576 1 0)
    [INF] 2016-09-07 16:57:01.910245250 UTC [gmt://examples/ethercat_example:8001] loading data object => EL1809-10:GREEN Push Button (24592 1 0)
    [INF] 2016-09-07 16:57:01.910250492 UTC [gmt://examples/ethercat_example:8001] loading data object => EL1809-10:Emergency Button (24608 1 0)
    [INF] 2016-09-07 16:57:01.910262722 UTC [gmt://examples/ethercat_example:8001] loading data object => EL3202-14:Temperature #1 (24576 17 0)
    [INF] 2016-09-07 16:57:01.910272763 UTC [gmt://examples/ethercat_example:8001] loading data object => EL3202-14:Temperature #2 (24592 17 0)
    [INF] 2016-09-07 16:57:01.910286502 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Ready (24592 1 0)
    [INF] 2016-09-07 16:57:01.910299426 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Enabled (24592 2 0)
    [INF] 2016-09-07 16:57:01.910311614 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Warning (24592 3 0)
    [INF] 2016-09-07 16:57:01.910323962 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Error (24592 4 0)
    [INF] 2016-09-07 16:57:01.910337250 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Moving + (24592 5 0)
    [INF] 2016-09-07 16:57:01.910349939 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Moving - (24592 6 0)
    [INF] 2016-09-07 16:57:01.910357182 UTC [gmt://examples/ethercat_example:8001] loading data object => EL2809-10:Pilot Light (28672 1 0)
    [INF] 2016-09-07 16:57:01.910362927 UTC [gmt://examples/ethercat_example:8001] loading data object => EL2809-10:Emergency Light (28688 1 0)
    [INF] 2016-09-07 16:57:01.910369179 UTC [gmt://examples/ethercat_example:8001] loading data object => EL2809-10:Heartbeat (28736 1 0)
    [INF] 2016-09-07 16:57:01.910382354 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Enable (28688 1 0)
    [INF] 2016-09-07 16:57:01.910395462 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Axis Reset (28688 2 0)
    [INF] 2016-09-07 16:57:01.910412059 UTC [gmt://examples/ethercat_example:8001] loading data object => EL7041-17:Velocity (28688 33 0)
    [INF] 2016-09-07 16:57:01.910421164 UTC [gmt://examples/ethercat_example:8001] loading data object => EL3202-14:Sensor type #1 (32768 26 0)
    [INF] 2016-09-07 16:57:01.910429687 UTC [gmt://examples/ethercat_example:8001] loading data object => EL3202-14:Sensor type #2 (32784 26 0)
    [INF] 2016-09-07 16:57:01.910430900 UTC [gmt://examples/ethercat_example:8001] starting ethercat master
    [INF] 2016-09-07 16:57:01.910490351 UTC [gmt://examples/ethercat_example:8001] [0] 0x02 0x044C2C52 0x00110000 EK1100 EtherCAT-Koppler (2A E-Bus)
    [INF] 2016-09-07 16:57:01.910497596 UTC [gmt://examples/ethercat_example:8001] [1] 0x02 0x03F03052 0x00110000 EL1008 8K. Dig. Eingang 24V, 3ms
    [INF] 2016-09-07 16:57:01.910503865 UTC [gmt://examples/ethercat_example:8001] [2] 0x02 0x07D83052 0x00110000 EL2008 8K. Dig. Ausgang 24V, 0.5A
    [INF] 2016-09-07 16:57:01.910526114 UTC [gmt://examples/ethercat_example:8001] [3] 0x02 0x0BBA3052 0x00140000 EL3002 2K.Ana. Eingang  +/-10V
    [INF] 2016-09-07 16:57:01.910534140 UTC [gmt://examples/ethercat_example:8001] [4] 0x02 0x0C823052 0x00130000 EL3202 2K.Ana. Eingang PT100 (RTD)
    [INF] 2016-09-07 16:57:01.910541438 UTC [gmt://examples/ethercat_example:8001] [5] 0x02 0x0FC03052 0x00110000 EL4032 2K. Ana. Ausgang +/-10V, 12bit
    [INF] 2016-09-07 16:57:01.910550378 UTC [gmt://examples/ethercat_example:8001] [6] 0x02 0x1B813052 0x00170000 EL7041 1K. Schrittmotor-Endstufe (50V, 5A)
    Sensor type #1 = 1
    Sensor type #2 = 3
    [INF] 2016-09-07 16:57:01.937446234 UTC [gmt://examples/ethercat_example:8001] ethercat master started
    [INF] 2016-09-07 16:57:01.937483034 UTC [gmt://examples/ethercat_example:8001] slaves detected: 7
    [INF] 2016-09-07 16:57:01.937484279 UTC [gmt://examples/ethercat_example:8001] AL states: PREOP
    [INF] 2016-09-07 16:57:01.937484902 UTC [gmt://examples/ethercat_example:8001] Link is UP
    [INF] 2016-09-07 16:57:01.937487120 UTC [gmt://examples/ethercat_example:8001] EK1100-11 state PREOP
    [INF] 2016-09-07 16:57:01.937487809 UTC [gmt://examples/ethercat_example:8001] EK1100-11 is ONLINE
    [INF] 2016-09-07 16:57:01.937488936 UTC [gmt://examples/ethercat_example:8001] EL1809-10 state PREOP
    [INF] 2016-09-07 16:57:01.937489548 UTC [gmt://examples/ethercat_example:8001] EL1809-10 is ONLINE
    [INF] 2016-09-07 16:57:01.937490546 UTC [gmt://examples/ethercat_example:8001] EL2809-10 state PREOP
    [INF] 2016-09-07 16:57:01.937491195 UTC [gmt://examples/ethercat_example:8001] EL2809-10 is ONLINE
    [INF] 2016-09-07 16:57:01.937492115 UTC [gmt://examples/ethercat_example:8001] EL3002-14 state PREOP
    [INF] 2016-09-07 16:57:01.937492746 UTC [gmt://examples/ethercat_example:8001] EL3002-14 is ONLINE
    [INF] 2016-09-07 16:57:01.937493666 UTC [gmt://examples/ethercat_example:8001] EL3202-14 state PREOP
    [INF] 2016-09-07 16:57:01.937494263 UTC [gmt://examples/ethercat_example:8001] EL3202-14 is ONLINE
    [INF] 2016-09-07 16:57:01.937495591 UTC [gmt://examples/ethercat_example:8001] EL4032-13 state PREOP
    [INF] 2016-09-07 16:57:01.937496300 UTC [gmt://examples/ethercat_example:8001] EL4032-13 is ONLINE
    [INF] 2016-09-07 16:57:01.937497248 UTC [gmt://examples/ethercat_example:8001] EL7041-17 state PREOP
    [INF] 2016-09-07 16:57:01.937497882 UTC [gmt://examples/ethercat_example:8001] EL7041-17 is ONLINE
    [INF] 2016-09-07 16:57:01.976536682 UTC [gmt://examples/ethercat_example:8001] EK1100-11 state INIT
    [INF] 2016-09-07 16:57:01.987029821 UTC [gmt://examples/ethercat_example:8001] EK1100-11 state PREOP
    [INF] 2016-09-07 16:57:01.993356922 UTC [gmt://examples/ethercat_example:8001] EK1100-11 state SAFEOP
    [INF] 2016-09-07 16:57:01.997538470 UTC [gmt://examples/ethercat_example:8001] EK1100-11 state OP
    [INF] 2016-09-07 16:57:01.997540427 UTC [gmt://examples/ethercat_example:8001] EK1100-11 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.003864692 UTC [gmt://examples/ethercat_example:8001] EL1809-10 state INIT
    [INF] 2016-09-07 16:57:02.014412242 UTC [gmt://examples/ethercat_example:8001] EL1809-10 state PREOP
    [INF] 2016-09-07 16:57:02.022810420 UTC [gmt://examples/ethercat_example:8001] EL1809-10 state SAFEOP
    [INF] 2016-09-07 16:57:02.027030270 UTC [gmt://examples/ethercat_example:8001] EL1809-10 state OP
    [INF] 2016-09-07 16:57:02.027032124 UTC [gmt://examples/ethercat_example:8001] EL1809-10 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.031257847 UTC [gmt://examples/ethercat_example:8001] domain wc 1
    [INF] 2016-09-07 16:57:02.031259776 UTC [gmt://examples/ethercat_example:8001] domain wc state INCOMPLETE
    [INF] 2016-09-07 16:57:02.033360873 UTC [gmt://examples/ethercat_example:8001] EL2809-10 state INIT
    [INF] 2016-09-07 16:57:02.043864805 UTC [gmt://examples/ethercat_example:8001] EL2809-10 state PREOP
    [INF] 2016-09-07 16:57:02.052304692 UTC [gmt://examples/ethercat_example:8001] EL2809-10 state SAFEOP
    [INF] 2016-09-07 16:57:02.056534717 UTC [gmt://examples/ethercat_example:8001] EL2809-10 state OP
    [INF] 2016-09-07 16:57:02.056536564 UTC [gmt://examples/ethercat_example:8001] EL2809-10 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.062811721 UTC [gmt://examples/ethercat_example:8001] EL3002-14 state INIT
    [INF] 2016-09-07 16:57:02.062817303 UTC [gmt://examples/ethercat_example:8001] domain wc 3
    [INF] 2016-09-07 16:57:02.075468024 UTC [gmt://examples/ethercat_example:8001] EL3002-14 state PREOP
    [INF] 2016-09-07 16:57:02.115467588 UTC [gmt://examples/ethercat_example:8001] EL3002-14 state SAFEOP
    [INF] 2016-09-07 16:57:02.119646879 UTC [gmt://examples/ethercat_example:8001] EL3002-14 state OP
    [INF] 2016-09-07 16:57:02.119648863 UTC [gmt://examples/ethercat_example:8001] EL3002-14 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.125977275 UTC [gmt://examples/ethercat_example:8001] EL3202-14 state INIT
    [INF] 2016-09-07 16:57:02.138593852 UTC [gmt://examples/ethercat_example:8001] EL3202-14 state PREOP
    [INF] 2016-09-07 16:57:02.147033499 UTC [gmt://examples/ethercat_example:8001] EL3202-14 state SAFEOP
    [INF] 2016-09-07 16:57:02.151252770 UTC [gmt://examples/ethercat_example:8001] EL3202-14 state OP
    [INF] 2016-09-07 16:57:02.151254884 UTC [gmt://examples/ethercat_example:8001] EL3202-14 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.157582289 UTC [gmt://examples/ethercat_example:8001] EL4032-13 state INIT
    [INF] 2016-09-07 16:57:02.157587009 UTC [gmt://examples/ethercat_example:8001] domain wc 4
    [INF] 2016-09-07 16:57:02.170240134 UTC [gmt://examples/ethercat_example:8001] EL4032-13 state PREOP
    [INF] 2016-09-07 16:57:02.178647074 UTC [gmt://examples/ethercat_example:8001] EL4032-13 state SAFEOP
    [INF] 2016-09-07 16:57:02.182865269 UTC [gmt://examples/ethercat_example:8001] EL4032-13 state OP
    [INF] 2016-09-07 16:57:02.182867251 UTC [gmt://examples/ethercat_example:8001] EL4032-13 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.189194108 UTC [gmt://examples/ethercat_example:8001] EL7041-17 state INIT
    [INF] 2016-09-07 16:57:02.201811217 UTC [gmt://examples/ethercat_example:8001] EL7041-17 state PREOP
    [INF] 2016-09-07 16:57:02.271303805 UTC [gmt://examples/ethercat_example:8001] EL7041-17 state SAFEOP
    [INF] 2016-09-07 16:57:02.283923018 UTC [gmt://examples/ethercat_example:8001] domain wc 7
    [INF] 2016-09-07 16:57:02.283925065 UTC [gmt://examples/ethercat_example:8001] domain wc state COMPLETE
    [INF] 2016-09-07 16:57:02.582866053 UTC [gmt://examples/ethercat_example:8001] EL7041-17 state OP
    [INF] 2016-09-07 16:57:02.582868440 UTC [gmt://examples/ethercat_example:8001] EL7041-17 is OPERATIONAL
    [INF] 2016-09-07 16:57:02.584972497 UTC [gmt://examples/ethercat_example:8001] AL states: OP
    [INF] 2016-09-07 16:57:04.042207131 UTC [gmt://examples/ethercat_example:8001] domain wc 1
    [INF] 2016-09-07 16:57:04.042209707 UTC [gmt://examples/ethercat_example:8001] domain wc state COMPLETE

At this point we can use the defined input and output ports to connect from and to the hardware.
We'll see later how to use these ports in real applications but let's see how easy is to use them quickly.
Create a simple coffeescript file like the following and call it hdk_lights_control.coffee.

.. code-block:: coffeescript

    nanomsg = require("nanomsg")
    msgpack = require("msgpack-lite")
    socket  = nanomsg.socket("push")
    port_address = "tcp://127.0.0.1:9002"
    pilot_light     = true
    emergency_light = true
    heartbeat_led   = true
    lights = [  pilot_light, emergency_light, heartbeat_led ]
    socket.connect port_address
    socket.send msgpack.encode(lights)
    console.log "lights switched ON"

.. code-block:: bash

    $ coffee hdk_lights_control.coffee

Running this command will switch on the pilot, the emergency light and a led in the digital out module used as heartbeat.
Other ports could be used in the same way for simple purposes but note that **this script does not use any other component**.
As we'll see in next section using the GMT Controllers and the rest of frameworks will make this process simpler and more useful.

.. note::

    In order to finish the example the run_ethercat_example process must be killed.

Controllers Example
-------------------

Controllers are the components responsible to control the different telescope or instruments devices.
Usually controllers are connected to the external sensors and actuators using the Hardware Adapters that we have seen before.
Many different kinds of controllers will be created for the telescope depending on the type of equipment to be controlled.
In order to know or maintain the state of the system under control the controllers will use State Variables.

A simple controller with a temperature state variable (simulated, with no real hardware) is provided at:

  `${GMT_ROOT}/src/runtime/src/obs_fwk/ctrl_fwk/c++/examples/simple_controller`

Note that the controller implementation c++ code is split in three different files: general, setup and step.
This is for code generation purposes and because it's easy to focus development only on the step() loop.

The configuration for this controller is:

  `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/examples/simple_controller.cson`

.. code-block:: bash

    component_setup:
        name         : 'examples/simple_controller'
        port         : 8001
        host         : '127.0.0.1'
        rate         : '1000000'
        input_ports  : [ [ 'temperature_setpoint', 'pull', 'tcp://127.0.0.1:9001', 'async', 1] ]
        output_ports : [ [ 'temperature_monitor',  'push', 'tcp://127.0.0.1:9011', 'async', 1000] ]
    state_vars:
        temperature: { type: 'float', init: 23.4, min: 2.0, max: 26.1, url: 'tcp://127.0.0.1:9011' }

In order to run this controller open a log_client in different terminal and in other terminal use:

.. code-block:: bash

  $ run_simple_controller &

then send the setup using:

  $ setup_component examples simple_controller

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

  $ monitor_component examples simple_controller

To check the monitored values a telemetry_client can be started in another unix terminal:

  *Usage:*  ``telemetry_client [topic]``

In the case will have:

    $ telemetry_client

And the monitored values shall be received on this terminal.

A query can also be sent to the telemetry service like this:

  *Usage:*  ``telemetry_query  monitor_name  num``

For example, the following will list the last 12 temperature values (from newest to oldest) from this controller:

.. code-block:: bash

  $ telemetry_query examples.simple_controller.temperature 12

All telemetry queries have to be done on specific monitors.

Send a Command to a Controller
------------------------------

Some numeric values can be sent directly to ports of any controller like this:

  *Usage:*  ``send_value subsystem  controller  port_name value { int | float }``


For example:

.. code-block:: bash

  $ send_value examples simple_controller temperature_setpoint 23.3 float

This will send a temperature setpoint of 23.3 to the controller which should react to this change.
State var values shall change on the telemetry client.
When the temperature values are out the the defined range the log client should show the corresponding warning messages.

.. note::

    In order to finish the example the run_simple_controller process shall be killed.

HDK Controller With Ethercat Adapter
------------------------------------

The HDK example contains and example with an EthercatAdapter and a simple Controller for the HDK.

    `${GMT_ROOT}/src/runtime/src/obs_fwk/ctrl_fwk/c++/examples/hdk_controller'

Use the following commands to start and setup these components:

.. code-block:: bash

  $ run_hdk_controller &
  $ setup_component hdk_cs hw_adapter
  $ ethercat_config hdk_cs hw_adapter
  $ setup_component hdk_cs controller
