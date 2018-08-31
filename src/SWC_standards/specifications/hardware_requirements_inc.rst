
.. _hardware_requirements:

Hardware Requirements
---------------------

*Device Control Computer*
.........................

  The DCC (Device Control Computer) is a standardized computer specified by GMTO
  to be used in the deployment of the DCS. The DCC is connected to the GMT Control
  Network (GCN).

  Each DCC host the software components that implement the functional and physical
  part of the control and data acquisition functions of the CSS devices, i.e. the
  Controlled Subsystem Plant – CSP in the Figure 3‑1.

  Each DCC includes a processor and an interface to the I/O modules required to
  connect to hardware Devices.

  I/O interfaces are either I/O adapters within the DCC (e.g. detector controller
  interface cards), or use a field bus to connect with remote I/O modules (i.e.
  Motion drives or discrete I/O signal interfaces).

  Two types of DCCs are supported:

    * PC-based DCCs Intel-based Industrial Computers (PCs) running Linux with real
      time extensions (RT_PREEMPT) are used in the following use cases:

      - High bandwidth telemetry is required
      - The DCS has to be integrated with the low latency network.
      - High computing performance is required.
      - Implementing complex operation scenarios is required
      - Control loops or data acquisition rates are faster than 100 Hz.

    * PLC-based DCCs Programmable Logic Controllers (PLCs) are used in the following
      use cases:

      - The bandwidth necessary for telemetry is low.
      - Simple supervision, coordination or operation scenarios.

  When PLC based DCCs are used a Master Supervisor is deployed in a PC-based DCC
  that communicates with the PLC(s) using OPC UA. The procurement of this DCC
  Master Supervisor depends on the procurement agreement and may be provided by
  GMTO if the DCS provider is not familiar with the technologies used for DCS /
  GCS integration. The Figure below shows an example of this arrangement.

  [review drawing to include physical interface]

  .. figure:: _static/tiered_controller_architecture.png

     Single and Two Tier Controller Architecture

  The primary functions of the DCC are:

    * Hosting the supervisory and control DCS software components

    * Hosting the GMT frameworks that enable communication between the DCS and the
      GCS

    * Hosting the fieldbus (EtherCAT) master

    * Hosting the physical interface that connects the DCC with the fieldbus

    * Hosting the physical interface that connects the DCC with the GMT Control
      Network

    * Hosting the physical interface that connects the DCC with the Low Latency
      Network

  **SWC-DCS-0086: DCS master supervisor deployment**

    Each DCS shall have one an only one DCS Master Supervisor deployed in one of
    the DCS DCCs.

  **SWC-DCS-0087: DCC physical interface**

    Each DCC shall provide at least two ports to connect to the GCN.

  **SWC-DCS-0088: DCC – DCS integration**

    Each DCC shall be integrated into the DCS.

  **SWC-DCS-0089: DCC location**

    Each DCC shall be installed in the GMT Electronics room.

  **SWC-DCS-0090: DCC power consumption**

    Each DCC shall not exceed 200W (TBC) of power consumption.

    Note: DCC are installed in the Electronics Room.

  **SWC-DCS-0092: DCC physical envelope**

    Each DCC shall not use more than 4U (TBC) in a 19” rack.

  **SWC-DCS-0093: DCC processor**

    Each DCS DCCs shall use an Intel compatible processor.

    Note: The GMT DCS Product Catalog (GMT-SWC-REF-00000) provides a list of
    standardized

  **SWC-DCS-0092: DCC physical environment**

    Environment requirements (seismic, etc).


*PLC-based DCS*
...............

  **SWC-DCS-0103: Physical interface**

    The physical interface between the DCS Master Supervisor DCC and the PLC(s)
    shall be Gigabit Ethernet Internet.

  **SWC-DCS-0107: Data interface**

    The data interface protocol between the DCS Master Supervisor DCC and the
    PLC(s) controllers shall be OPC UA.

    Note: The GMT core_fwk provides an OPC-UA client for Python and node.js
    [client platform].

  **SWC-DCS-0108: PLC**

    PLC-based DCC shall be Beckhoff series TBD or equivalent.

  **SWC-DCS-0109: Standard products**

    PLC-based DCC, I/O Modules and field buses shall be selected from the GMT
    Software and Controls product catalogue (GMT-SWC-REF-00000).


*PC-based DCS*
..............

  **SWC-DCS-0111: PC-based standard products**

    PC-based DCS shall use Device Control Computers (DCC) based on Intel
    industrial computers with PCI Express bus system and adequate interface to
    fieldbus and GCN.

  **SWC-DCS-0112: DCC standard products**

    PC-based DCC, I/O Modules, terminal blocks and field buses shall be selected
    from the GMT Software and Controls product catalogue. (GMT-SWC-REF-00000)


*Computing Resources Sizing*
............................

  **SWC-DCS-0042: Computing resources**

    The DCS computing resources shall be adequate to support the correct
    operation of the DCS.

  **SWC-DCS-0043: Computing resource sizing**

    The DCS computing resources shall provide sufficient margins to allow adding
    additional functions.

  **SWC-DCS-0044: Load factor characterization during acceptance tests**

    The acceptance tests shall provide information about the load factor of the
    DCS computing and network resources.

  **SWC-DCS-0045: IO Module sizing**

    Additional reserve space for IO Modules per DIN rail in the allocated
    Standard Electronic Cabinet (SEC) should be more than 20% (TBC)

  **SWC-DCS-0046: Not equipped I/O channel additional reserve**

    Additional reserve I/O channels (not equipped) per type should be more than
    20% (TBC)

  **SWC-DCS-0047: Equipped I/O channel additional reserve**

    Additional reserve I/O channels (equipped) per type should be more than 5%
    (TBC)


*Field Device Interface*
........................

  **SWC-DCS-0093: DCS field Devices interface**

    The interface between the DCC (both PLC and PC based) and the field Devices
    shall be the EtherCAT fieldbus.

  **SWC-DCS-0094: DCS fieldbus layout**

    The first IO Module of the DCS fieldbus shall be installed in the GMT
    Electronics room. The rest of the fieldbus IO Modules shall be installed in
    the Enclosure building SECs or smaller boxes when the performance
    requirements for the electrical signal path requires it.

  **SWC-DCS-0095: DCS fieldbus cabling**

    The cabling between the first IO Module of the DCS and the rest shall be
    optical fiber. GMTO provides fiber links between the electronics room and
    the enclosure building as part of the GCN. The cabling between the field IO
    Modules shall be Ethernet UTP CAT 6 (TBC).

  **SWC-DCS-0096: DCS cable redundancy**

    The fieldbus layout shall be designed to support cable redundancy as stated
    in EtherCAT protocol.


*Motion Control Deployment*
...........................

  **SWC-DCS-0085: Motion control deployment mode**

    The DCS shall use one of the recommended control deployment modes defined in
    the Table below for each individual degree of freedom.

  .. table:: Motion Control Deployment Mode

     +--------------------------+-----------------------------------------------------------+
     |   Control Deployment     |   Description                                             |
     |   Mode                   |                                                           |
     +==========================+===========================================================+
     |   PVT                    |   Position, Velocity and Torque control loops are         |
     |                          |   implemented on a motion drive. This mode is recommended |
     |                          |   for single degree of freedom controllers with single or |
     |                          |   dual encoder feedback. In this mode encoder feedback is |
     |                          |   connected to the drive.                                 |
     +--------------------------+-----------------------------------------------------------+
     |   P-VT                   |   The Position control loop is implemented in the DCC,    |
     |                          |   while the Velocity and Torque loops are implemented in  |
     |                          |   the drive. This mode is recommended when the position   |
     |                          |   feedback cannot be connected directly to the drive.     |
     +--------------------------+-----------------------------------------------------------+
     |   PV-T                   |   The Position and Velocity control loops are implemented |
     |                          |   in the DCC, while the Torque control loops is           |
     |                          |   implemented in the drive. This mode is necessary when   |
     |                          |   several actuators act on the same axis.                 |
     +--------------------------+-----------------------------------------------------------+

Note: Motion drives are assumed to comply the IEC 61800-7-201 and IEC61800-7-301
mapping to EtherCAT.

  **SWC-DCS-0097: Motion Control**

    Motion control functions shall be implemented using motion drives that
    implement the CiA 402 profiles as defined in IEC 61800-7-201 / 301 (RD-5,
    RD-6).

    Note: This is especially recommended in the case of single axis with single
    or dual feedback and single actuator.

  **SWC-DCS-0098: Motion Control Signals**

    Motion control related signals shall be connected to the drive auxiliary
    inputs/outputs.

    Note: Example of motion signals are encoder feedback or home switches.

  **SWC-DCS-0099: Motion Control Loops**

    Depending on the Motion Deployment mode [swc-dcs-0085], motion control loops
    shall be closed in the drives using one of the standard profiles defined in
    IEC 61800-7-201/301 (RD-5, RD-6).


*DCS Software Platform*
.......................

  **SWC-DCS-0100: DCS software platform**

    Each DCC shall be configured by the DCS developer using the GDK provided by
    GMTO.

  **SWC-DCS-0101: DCS hardware configuration**

    Each DCC shall be compatible with the GMT DCS Product Catalog
    (GMT-SWC-REF-00000).


*Technical Camera Interface*
............................

  **SWC-DCS-0113: Technical camera data interface**

    The interface between the DCC and a technical CCD camera shall be GigE Vision.

    Note: Goal GigE [ref] cameras with Genicam [ref] profile.


*Science CCDs Interface*
........................

  **SWC-DCS-0113: Technical CCD camera data interface**

    The interface between the DCC and a science CCD camera shall be TBD.



*Control Cabinets*
..................

  [TBA] Add drawing. Include fiber transceivers

  **SWC-DCS-0113: Standard Electronic Cabinets**

    DCS field hardware shall be installed in the assigned standard electronic
    cabinets (SEC) as defined in the GMT Electronic Standards (AD-n).

  **SWC-DCS-0114: DCC and PLC location**

    PC-based and PLC-based DCCs shall be installed in the electronics room
    electronic racks (ref).

  **SWC-DCS-0115: DCC and I/O Module interface**

    DCCs and field I/O Modules are connected using the GCN fiber trunk lines.

    Note: The GMT control network is a combination of fiber distribution units,
    fiber transceivers and CAT5 electrical cable to field elements.


*Control Signal Cabling Rules*
..............................

  **SWC-DCS-0116: Cabling rules**

    DCS cabling shall be compliant with the GMT Electronic Standards
    (GMT-SE-REF-00191) for signal cabling and routing.

  **SWC-DCS-0117: SCP single connection point**

    A particular Subsystem Controlled Plant (SCP) / (Device Port) signal shall
    not be connected to different DCSs.

    Note: In the case in which more than one DCS required access to a signal,
    the corresponding data shall be transmitted through the GCN.

  **SWC-DCS-0119: Long distance signal connection**

    If the SCP equipment and the DCS I/O Modules connected to it are far away
    from each other, then an optical fiber connection shall be used.

  **SWC-DCS-0120: Types of cables**

    The cables used to connect the DCS with the SCP shall be compliant with the
    GMT Electronic Standards (GMT-SE-REF-00191).

  **SWC-DCS-0121: Analogue signal cabling**

    Analogue signal cabling shall be compliant with the GMT Electronic Standards
    (GMT-SE-REF-00191).

  **SWC-DCS-0121: Signal standards**

    Signals ranges and types shall be compliant with the GMT Electronic
    Standards (GMT-SE-REF-00191).
