
.. _non-functional_requirements:

Non-Functional Requirements
---------------------------

*Security*
..........

  **SWC-DCS-0040: DCS access control**

    DCS shall restrict access to authorized systems/people.

    [add something about cyber security]


*Performance*
.............

  **SWC-DCS-0041: Availability**

    The availability of the DCS shall be compliant with the RAMS requirements of
    the CSS and GMT.

  **SWC-DCS-0048: Sensor data transport QoS**

    The duration for update of information from sensors to the GCN shall meet
    the Quality of Service requirements as defined in each corresponding SDF.

  **SWC-DCS-0049: Command transport QoS**

    Duration for commands from GCN to actuators shall meet the QoS requirements
    as defined in each corresponding SDF.

  **SWC-DCS-0050: Wavefront control transport QoS**

    DCS participating in the GMT wavefront control system shall meet the QoS
    requirements as defined in each corresponding SDF.

  **SWC-DCS-0051: Time Synchronization**

    The DCS shall be synchronized with the GMT central time reference.


*Availability*
..............

  **SWC-DCS-0052: Hot swapping**

    The DCS shall use hot swapping whenever it is required by the RAMS analysis
    of the CSS.

  **SWC-DCS-0053: Redundancy**

    The DCS shall use redundancy whenever it is required by the RAMS analysis of
    the CSS.


*Diagnosis*
...........

  **SWC-DCS-0054: DCC and PLC Diagnosis**

    The DCS computers, PC and PLC based DCCs, and equipment shall have
    provisions for self-diagnosis.

    Note: DCCs and equipment should repeat self-checks at scheduled times.


*Safety(draft)*
...............

  **SWC-DCS-0055: Safe operation**

    The DCS shall be able to autonomously maintain safe operation of the CSS
    Devices in case of loss of communication with GCS systems.

    [Add reference to ISS]

    [Add some guideline for safety, address black-channel (TwinSafe) design]

  **SWC-DCS-0056: Software Safety** 

    The DCS shall not be the ultimate responsible of the safety of the CSS, the
    system under control or persons.

  **SWC-DCS-0057: Limit Protection**

    The DCS shall have built-in absolute-limit protection to prevent errors.

  **SWC-DCS-0058: Limit Protection**

    The DCS shall have time-outs to ensure correct operation in case of GCS
    failure.

  **SWC-DCS-0059: Non-assumption strategy**

    The DCS components shall avoid any assumption about the status of the CSS
    equipment or the plant during the start-up process or normal operation.

    Note: Although the DCS records the status of the equipment when it was
    powered off, human intervention may have change the configuration of the CSS
    equipment.


*Naming Convention*
...................

  **SWC-DCS-0011: Unique naming**

    Each DCS, DCS package and DCS component shall have a unique name.
  
    Note: The appendix DCS Reference Architecture Rules defines the naming
    rules.



*Software Infrastructure*
.........................

A set of software packages, named GMT Software Development Kit (devkit), is
distributed by GMTO for the development, test and operation of the DCS. This
package includes the required Common Frameworks and Observatory Services
distribution.

  **SWC-DCS-0060: GCS Simulator / early CORE / eCORE**

    The DCS shall use the GCS Simulator as a tool for DCS software development,
    support, integration, factory acceptance test and site acceptance test.

  **SWC-DCS-0061: GDK version**

    The DCS shall use the latest GDK system version.

  **SWC-DCS-0062: DCS communication with GCS core systems**

    The DCS shall use the GMT Core Framework for the communication to/from DCS
    Controllers and Supervisors.

* **Operating Systems**

  **SWC-DCS-0063: DCC operating system**

    The Operating System for the DCC is Linux, Fedora 21 or later (TBC).

    Note: Current prototypes are running in this platform.


* **Programming Languages and Tools**

  **SWC-DCS-0064: Software version control tool**

    The software version control tool shall be git and github shall be used for
    collaboration.

  **SWC-DCS-0065: PLC-based DCC programming language**

    The PLCs shall be programmed using IEC 61131-3.

  **SWC-DCS-0066: PLC-based DCC motion control**

    The PLCs motion functions shall be implemented using the PLCOpen Motion Control standard.

  **SWC-DCS-0067: PLC-based DCC communications**

    The PLCs shall implement and OPC UA server to enable communication from/to
    the DCC Master Supervisor.

  **SWC-DCS-0068: PLC-based DCC software**

    The PLCs shall be programmed with the engineering software TwinCAT v3.0.

  **SWC-DCS-0069: PC-based DCC software**

    The DCS shall use the GDK software and environment to develop and test the
    PC based DCC software.

  **SWC-DCS-0070: PC-based DCC fieldbus master**

    The DCS shall use the igH etherCAT master in order to acquire the process
    image of the field devices connected to the fieldbus.

    Note: The I/O Framework provided by GMTO provides a simplified way of
    accessing the fieldbus process image.

  **SWC-DCS-0071: GCS SDK version**

    Fast controllers shall be programmed using the latest version of GCS SDK
    distribution.

  **SWC-DCS-0072: Middleware agnostic**

    DCS components shall be independent of the communication middleware used.

  **SWC-DCS-0073: Distributed middleware transport**

    Nanomsg (TBC) shall be used for the communication between distributed
    components.

    Note: The GMT Core Framework provides independence of the middleware and is
    the recommended way of implementing distributed communications.

  **SWC-DCS-0074: Distributed middleware serialization**

    The serialization/deserialization of transmitted packages shall be done
    using MessagePack (TBC).

    Note: The GMT Core Framework provides independence of the serialization
    format and is the recommended way of implementing distributed
    communications.

  **SWC-DCS-0075: Programming languages**

    The programming languages that can be used in the DCS software development are:

      * ANSI C++ cxx11 (TBC) for performance sensitive application programming in the DCC
      * ANSI C c99 (TBC) for driver programing in the DCC
      * Python 2.7/3.x (TBD) for general programming
      * Javascript /Coffeescript for graphical programming and modeling
      * IEC 61131-3 for PLC programming

    Note: More specific rules should be provided. Check current code generators
    and provide recommended implementation based on type of component.

  **SWC-DCS-0076: User interface components**

    User interfaces components shall be developed according to the W3C Web
    Component standard.

    Note: Google Polymer provides a compliant Web Component implementation. The
    GMT UI Framework (ui_fwk) provides reusable components to implement user
    interfaces


* **Modeling Requirements**

  System Definition Files (SDF) are used to capture the formal specification of
  the DCS. Section nnn provides additional requirements on SDF. As SDF play a key
  role in the specification, testing and validation of the DCS architecture. SDF
  related life-cycle requirements are defined below.

  SDFs are written in a Domain Specific Language (DSL). A DSL is a computer
  programming language of limited expressiveness focused on a particular domain. A
  DSL facilitates productivity and communication with domain experts and DSL
  stakeholders. SDFs are ASCII files that are parsed and stored in the semantic
  model database and processed for consistency and completeness. They are hosted
  in the GMTO central software private repository in Github, for access by DCS
  developers and revision control.

  The concrete syntax of the SDFs is provided by the DSL, while the semantics are
  given by a set of models (metamodels) following the Object Management Group Meta
  Object Facility architecture.

  [add graphic to explain this]

  The GDK provides tools for:

    * DCS component skeletons and scaffolding generation
    * Subsystem build dependencies specification
    * Test procedures and test data generation
    * Stage-gate document generation
    * Project progress reporting
    * Subsystem deployment
    * Interface document generation

  The SDFs are one of the deliverables of the DCS development phases. More
  information on the SDF lifecycle and contents is available in DCS Specification
  Workflows document (GMT-SWC-REF-0000).

  **SWC-DCS-0077: SDF definition**

    The SDF of DCS component shall include the following information:

      * DCS unique identification

      * Commands list

      * Alarm list

      * Property list

      * Control Data Inputs and Outputs

      * Configuration property lists

      * DCS constant values

      * Default values (“factory settings”) for run-time configuration used for

      * DCS start-up

      * Physical (raw) signals list (I/O) [equivalent to data_inputs]

      * Processed/converted signals list [equivalent to data_outputs]

      * Telemetry monitor list

      * Logging messages list

      * Definition of the DCS state variables and corresponding state machines
        when applicable.

      * Definition of the DCS user interface components

      * Description of every component feature. [???]

    Note: The formal specification of the SDF DSL is defined by the GMF metamodel.

    [TBD] Add example?

    [Add requirements about SDF validation, test generation and test execution?]


  **SWC-DCS-0077: Graphical modeling**

    SysML shall be used in the graphical description of the DCS designs.

    Note: Although SDF provide a formal definition of the DCS that can be
    validated and it is used to drive the development of the system, graphic
    representations are useful to present high level views of the system
    structure and behavior (state diagrams, activity diagrams, internal block
    diagrams).
