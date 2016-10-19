
.. _functional_requirements:

Functional Requirements
-----------------------

*Process Control*
.................

  **SWC-DCS-0012: DCS control functions**

    The DCS shall implement the following control functions:

      * Control process inputs and outputs
      * Operation state monitoring
      * Operation logic
      * Alarms detection and management
      * Configuration change and management
      * Error and status logging
      * CSS startup and shutdown sequences
      * Telemetry sampling and management
      * Software safety when applicable
      * Image and other data processing
      * Goal elaborations (desired goals for state variables over time)

  **SWC-DCS-0014: Control loop optimization**

    The DCS shall optimize the control loops in order to reduce the frequency of
    activation of the CSS Devices.


*Process Supervision*
.....................

  **SWC-DCS-0015: DCS supervisory functions**

    The DCS shall implement the following supervisory functions:

      * Subsystem integrity (e.g., collision avoidance)

      * Subsystem component configuration (e.g., components are configured in
        the right sequence and with the right configuration properties, LUTs)

      * Subsystem robustness (e.g., behavior in presence of no nominal
        conditions, fault management and tolerance)

      * Subsystem life-cycle (e.g., startup and shutdown)

      * Subsystem embedded diagnosis

      * Subsystem operation modal transition (for subsystems that have different
        modes of operation)

      * Subsystem IO health

    Note: Supervisory functions include also sequencing, archiving, monitoring,
    diagnostics, calibration and visualization.

  **SWC-DCS-0016: Status information**

    The DCS shall provide status information required to operate and debug the
    CSS.

    Note: The status information includes CSS operating states, state machine
    transitions, alarm conditions, log messages and configuration change events.

  **SWC-DCS-0017: Local Storage**

    The DCS shall not store permanently any data.

  **SWC-DCS-0018: Central Operation**

    The DCS shall be able to be operated remotely centrally from the telescope
    control room(s).


*Process Monitoring*
....................

  **SWC-DCS-0019: State variable sampling**

    The DCS shall sample each process state variable with an identifier, a time
    stamp and an error identification in case of error.

    Note: Units, name, Quality of Service parameters and description of the
    state variable are not required in the sampled data as they are defined in
    the DSC SDF. 

  **SWC-DCS-0020: Raw data conversion**

    The DCS should apply the conversion from raw data to engineering data
    (scaling) as near as possible to the source of the data.

  **SWC-DCS-0021: Time stamping latency**

    The DCS shall time stamp state variables as close as possible to the source
    of data.

  **SWC-DCS-0022: Calibration factor**

    The DCS shall provide the capability to configure the calibration factor and
    conversion formula applied to each state variable.

    Note: Identify and capture relevant Device properties/features

  **SWC-DCS-0023: State variable data transmission**

    The DCS shall provide the capability to transmit both raw data and
    engineering data to the GCS Core systems.

  **SWC-DCS-0024: Telemetry data archiving**

    The DCS shall archive telemetry data only in the case that a circular buffer
    is required to manage high throughput telemetry.

    Note: All the GMT telemetry data is stored and archived by the telemetry
    service outside the DCS.

*State Variables (draft)*
.........................

Definition of state variables and relationship with goals and sequencing

.. figure:: _static/state_variable_relationships.png

.. figure:: _static/reactive_close_control_loop.png

   Reactive Close Control Loop

The above diagram represents an overview of the control, supervision and
monitoring functions and their relation with state variables.

* **ops_state State Variable**

  The ops_state state variable represents the operational state of a Component
  [reword].  A set of states addresses the distributed nature of the component
  and its life cycle management.  Figure 5‑1 shows the ops_state state
  machine.  Only the description of each state is shown.  Details about entry
  actions, transitions and activities are omitted in this diagram.

  .. figure:: _static/controller-state-machine.png

     Controller State Machine

  :numref:`Table %s <op_state_specification>` provides the specification of the
  Controller state machine.  The specification defines what actions to implement
  in every state or transition, however in some of the states each Controller
  implements its own specific logic.

  .. _op_state_specification:

  .. table:: Component ops_state Specification

     +-------------------+-------------------------------------------------------------------------+
     | | State           | | State Description                                                     |
     +===================+=========================================================================+
     | | INITIAL         | | Initial pseudo state.  The Controller is not operational because it   |
     | |                 | | has not been created yet.  The Controller cannot inform this state    |
     | |                 | | as it is not running.  In this state the software is not running and  |
     | |                 | | controlled equipment is not available.                                |
     +-------------------+-------------------------------------------------------------------------+
     | | TERMINAL        | | Final pseudo state of any Controller.  It is equivalent to the        |
     | |                 | | initial state.  A final state cannot have any outgoing transitions.   |
     +-------------------+-------------------------------------------------------------------------+
     | | PREVIOUS STATE  | | This pseudo state is a UML formalism that, within a composite         |
     | |                 | | state, memorizes the previous sub-state that was active prior to      |
     | |                 | | leaving the composite state.  This is used when a Controller          |
     | |                 | | enters the FAULT or DISABLED states.                                  |
     +-------------------+-------------------------------------------------------------------------+
     | | OFF             | | The Controller is created, loaded and initialized with the            |
     | |                 | | default properties, but part of the software and hardware is not      |
     | |                 | | initialized and configured yet.  All the external Devices             |
     | |                 | | controlled by the Controller shall be switched-off.  In this          |
     | |                 | | state the Controller is not ready for operation, but it is            |
     | |                 | | possible to perform tests and diagnostics activities, specially       |
     | |                 | | related to the communication capabilities.  The Controller is in      |
     | |                 | | a static state waiting for events.                                    |
     +-------------------+-------------------------------------------------------------------------+
     | | STARTING        | | The Controller is being started.  Any external equipment              |
     | |                 | | controlled by the Controller is being switched on.  In some           |
     | |                 | | cases, the power supply is shared with other Controllers.  It         |
     | |                 | | also performs the starting procedure which can include:               |
     | |                 | |                                                                       |
     | |                 | |     • Obtaining configuration properties from the configuration       |
     | |                 | |       system                                                          |
     | |                 | |                                                                       |
     | |                 | |     • Obtaining references to the required device or bus drivers      |
     | |                 | |                                                                       |
     | |                 | |     • Starting telemetry samplers, alarm rules, etc.                  |
     | |                 | |                                                                       |
     | |                 | |     • Checking communication with the connected Devices (e.g., a      |
     | |                 | |       motion drive)                                                   |
     | |                 | |                                                                       |
     | |                 | | Other activities that depend on the specific Controllers and          |
     | |                 | | Devices connected to it.                                              |
     +-------------------+-------------------------------------------------------------------------+
     | | ON              | | The Controller and the connected Devices are already properly         |
     | |                 | | initialized and configured.  When connected, and depending on         |
     | |                 | | the Controller, external equipment shall be in safe state (e.g.,      |
     | |                 | | brake engaged, motion drives disabled, locking pins inserted).        |
     | |                 | | This state can be the final state after a reset or after a power      |
     | |                 | | failure.                                                              |
     +-------------------+-------------------------------------------------------------------------+
     | | INITIALIZING    | | While the Controller is in this state the necessary procedures        |
     | |                 | | required to make the controller ready to receive operation            |
     | |                 | | requests (e.g., find fiducial marks) are executed.                    |
     +-------------------+-------------------------------------------------------------------------+
     | | RUNNING         | | The Controller is running and can be idle or serving an               |
     | |                 | | operation request.  In this state the Controller can receive new      |
     | |                 | | commands or is accepting data in its data inputs and sending          |
     | |                 | | data through its data outputs.                                        |
     +-------------------+-------------------------------------------------------------------------+
     | | SHUTTING DOWN   | | Back to OFF state (different for each Controller: power off           |
     | |                 | | Devices)                                                              |
     +-------------------+-------------------------------------------------------------------------+
     | | HALTING         | | Back to ON state (different for each Controller: Engage brakes,       |
     | |                 | | disable drives)                                                       |
     +-------------------+-------------------------------------------------------------------------+
     | | FAULT           | | The Controller has detected a severe failure and is waiting for       |
     | |                 | | an event to occur  (e.g., operator input) to correct such             |
     | |                 | | situation.                                                            |
     +-------------------+-------------------------------------------------------------------------+
     | | RESETTING       | | Return to a safe and known state.  For example, when the              |
     | |                 | | Controller has entered into a FAULT state, due to the ISS             |
     | |                 | | triggering an interlock condition (which can disable drives,          |
     | |                 | | remove power, etc.), a reset command must be sent to the              |
     | |                 | | Controller.                                                           |
     +-------------------+-------------------------------------------------------------------------+
     | | DISABLED        | | In this state the Controller rejects attempts to perform any          |
     | |                 | | control action.  This is especially important with Controllers        |
     | |                 | | connected to Devices.  In this state the Controller does not          |
     | |                 | | send demands to the equipment requesting motion or a change (a        |
     | |                 | | message is sent to the client indicating that the Controller is       |
     | |                 | | disabled).  Note that the Controller is ready and it will answer      |
     | |                 | | requests that ask for some status, but it will not execute any        |
     | |                 | | commands that lead to actions on connected Devices.  This state       |
     | |                 | | can be reached from any state, and when enabled, will return to       |
     | |                 | | the previous state.                                                   |
     +-------------------+-------------------------------------------------------------------------+

  **SWC-DCS-0079: DCS State Machines**

    Each DCS component shall implement ops_state state machine.

  **SWC-DCS-0080: State Machine monitoring**

    Each DCS component shall send an status message for each state transition to
    the GCS.

* **sim_mode State Variable**

  Controllers that interface with hardware support specialized operation modes,
  on-line and simulated:

    * In real mode, controllers try to detect and setup the hardware elements
      connected to them during startup.  If some of the required hardware
      devices are not available the controller will transition to fault mode.
      This is the default mode when the system is deployed for operation at the
      observatory.

    * In simulation mode, controllers will setup the I/O framework in simulation
      mode.  Communication messages with the hardware will be logged, but will
      not be sent to the hardware devices.  Hardware devices will not be powered
      up during the startup sequence.  This mode is intended to be use during
      development when the hardware is not yet available or is available
      partially.  It also enables controller debugging once the hardware is
      integrated.

  **SWC-DCS-0081: on-line operation mode**

    DCS shall support the on-line operation mode

  **SWC-DCS-0082: simulation operation mode**

    DCS shall support the simulation operation mode


* **control_mode State Variable**

  GMT distributed components shall support two operation modes, standalone and
  integrated:

    In *integrated mode*, components will try to connect with the observatory
    services.  If the services are not available the component will stop its
    startup sequence.  This is the default operation mode when components are
    integrated and deployed in the observatory or integration simulator.

    In *standalone mode*, components do not try to connect to the observatory
    services (e.g., log and alarms send their messages to the console or a
    file).  This operation mode is intended to be used during initial component
    development or when network services are not available. 

  **SWC-DCS-0083: Normal operation**

    The DCS shall always be in integrated mode during normal operation

  **SWC-DCS-0084: Standalone mode**

    Use of local standalone mode should be minimized as much as possible.

*Operation Support*
...................

* **Visualization**

  **SWC-DCS-0025: DCS specific user interface elements.**

    The DCS shall provide specialized user interface elements when the basic set
    is not adequate for an efficient operation of the system under control
    (reword).

    Note: The GMT “User Interface Framework” (ui_fwk) provides visualization
    components that target general use cases. They may be appropriate for
    general engineering and basic operation. However with the DCS is controlling
    a complex subsystem specialized user interface components may need to be
    deployed.

    TBA: [specific engineering interfaces, specific operation interfaces]

* **Data Processing (draft)**

  **SWC-DCS-0026: Data processing function**

    The DCS shall implement the data processing functions required to operate
    the system under control.
  
* **High-Level Operations (draft)**

  **SWC-DCS-0027: Sequencing**

    The DCS shall implement sequencing functions to allow to operate the from
    the sequencing tools.

    Note: the contents of the sequencer commands per DCS shall be defined.

  **SWC-DCS-0028: Operation workflows**

    The DCS shall implement diagnosis functions to characterize non-nominal
    behavior of the system under control or other DCS components.

  **SWC-DCS-0029: Operation commands**

    The DCS shall implement commands that implement the required state changes.

* **Diagnosis (draft)**

  **SWC-DCS-0030: Diagnosis function**

    The DCS shall implement diagnosis functions to characterize non-nominal
    behavior of the system under control or other DCS components.

    Note: Diagnosis functions are necessary with the operational complexity of
    the system makes hard to understand the behavior of the system under nominal
    and non-nominal operations.

* **Calibration**

  **SWC-DCS-0031: Calibration function**

    The DCS shall provide calibration functions when the operation of the system
    under control requires parameters that have to be obtained after the
    execution of measurements.

* **Integrity (draft)**

  **SWC-DCS-0032: Active alarm status**

    The DCS shall identify and monitor the CSS alarm conditions and generate an
    alarm event when these conditions take place.

* **Life-cycle** (draft)

  **SWC-DCS-0033: life-cycle requirement**

    The DCS master supervisor shall coordinate the life-cycle of the DCS
    components.

* **Quality Assessment** (draft)

  **SWC-DCS-0034: Quality assessment requirement**

    TBD

* **DCS Operation Parameters Definition (e.g. OT)**

  **SWC-DCS-0035: Operation tool plugins (draft)**

    TBD

  **SWC-DCS-0036: Operation tool input parameters** (draft)

    Operation definition plugin parameters. Operation Description Files (ODFs).

    Subsystem specific parameter dictionary.

* **DCS Data Products** (draft)

  **SWC-DCS-0037: Subsystem specific data products**

    Keyword dictionary / product dictionary / pipelines / recipes. Data provenance.

* **DCS Controlled Devices**

  **SWC-DCS-0038: DCS controlled devices**

    The DCS shall provide descriptions of the devices under its control. These
    descriptions should capture the information relevant to perform the control
    functions and to operate the Devices. The metamodel specifies the features
    (e.g. vendor, model, location) necessary to model a Device. 

  **SWC-DCS-0039: Device calibration data provenance**

    The description of the devices shall include information about the serial
    number and location of Devices that can be exchanged so the provenance for
    the calibration data can be ensured.

* **Alarms**

  The purpose of the alarm system is to provide information to the operators for
  fault diagnosis and correction. The GCS Alarm Service implements an
  observatory wide fault management strategy to assess and manage the overall
  health of the system.

  **SWC-DCS-0040: Active alarm status**

    The DCS shall identify and monitor the CSS alarm conditions and generate an
    alarm event when these conditions take place.

  **SWC-DCS-0026: Active alarm status**

    The DCS shall transmit any changes in the status of alarm conditions.

  **SWC-DCS-0027: Alarms and operating state consistency**

    The DCS shall take into account the operating states of the CSS when
    monitoring alarm conditions.

    Note: This is needed to avoid sending alarms when they are not significant
    for a given operation state.

  **SWC-DCS-0028: Alarm event information**

    An alarm shall contain:
      * A timestamp
      * A severity
      * A value
      * An alarm description
      * Alarm state

* **Error and Status Logging**

  The logging function enables to record the history of events, whether normal
  or abnormal, surrounding the GMT operations. Log events are intended for view
  and access on an operation console, and stored in a persistent database. 

  **SWC-DCS-0029: Log event information**

    A log message shall include:

      * A time stamp
      * A process identifier according to the naming scheme
      * A text explaining the event
      * A message level (debug, info, warning, error).

  **SWC-DCS-0030: Log events**

    The DCS shall record and transmit the following messages to the logging
    system:

    * Each timing, DCC, PLC or embedded system events or state changes.

    * Each change of configuration properties

    * Each transitions in operating states

    * Each command sent by GCS to the DCS

    * Each state variable validity change

    * Each actions done locally by operators

    * Any error shall be detected and an error message shall be generated and
      communicated to the GCS core systems.

* **Configuration**

  **SWC-DCS-0031: Configurable properties**

    The DCS shall be designed to be configurable by means of a set of
    properties.

    Note: The specification of the configurable properties of a DCS is captured
    in the DCS System Definition Files (SDF).

  SWC-DCS-0032: Configuration parameters

    The DCS shall provide the capability to modify any configuration property
    with minimum disturbance to the correct operation of the CSS 

  **SWC-DCS-0033: Properties Configuration**

    The settings which are expected to be changed, however rarely, in course of
    the CSS lifetime, should be made configurable without additional program
    recompilation and, preferably, without program restart.

* **Computing Resources Management**

  **SWC-DCS-0034: Remote control functions**

    The DCS shall provide remote control functions (e.g. reboot, configure,
    start, stop, switch to standalone/integrated control mode). 

    Note: Remote control functions shall comply with the safety rules of the GMT
    site.

  **SWC-DCS-0035: Monitoring function**

    The DCS shall provide the capability to monitor DCC functions and equipment.

  **SWC-DCS-0036: Equipment to be monitored**

    The DCS shall monitor at least:

      * DCS hardware (DCC, PLC) and software
      * Device Controllers
      * Fieldbus networks
      * Interface with GCS

  **SWC-DCS-0037: Monitored equipment status**

    The DCS shall provide the operational status (operational, partially
    operational or not operational) of any monitored equipment

  **SWC-DCS-0038: Equipment performance monitoring**

    The DCS shall provide the capability to monitor the performance of the DCS
    equipment.

    Note: Performance information such as field bus status, CPU load and memory
    usage or network bandwidth utilization shall be recorded.

  **SWC-DCS-0039: Monitoring function health**

    The monitoring function shall include self-tests and live tests.


