
.. _interface_specification:

Interface Specification (draft)
-------------------------------

This chapter defines the interface between the DCS and the GMT SWC Core Systems
(DCP-GCS interface).

Data interface = connector map.

[Based on components/ports/connectors]

Two type of interfaces: component ports that offer DCS services to the outside
are defined using connection maps. DCS components that are integrated with Core
applications must implement an API which is often defined by inheritance from an
abstract component definition.

DCS – Core system interfaces are specified using Connection maps. Connection map
definitions are build using connectors that connect ports between different
components.

TODO: DCP-GCS interface drawing. / supervisory interface.

Internal interfaces:
  * device map
  * field map

External interfaces:
  * device map
  * supervisory (better name) map [CORE – DCS maps]


Data Interface
..............


Physical Interface
..................

  * Device Control Computer (DCC)

    DCC is considered being a part of the DCS. All DCC are connected to the GMT
    Control Network (GCN), although one and only one DCS Master Supervisor shall
    be deployed. 

    [TODO: Add network drawing]

  * Network Interface

    Network interfaces provide the only physical interconnection between DCS and
    GCS. GMTO manages the GMT networks.

    The GCN comprise the general-purpose service network (GSN), the Low Latency
    Network (LLN), the Data Archiving Network (DAN) and the Time Distribution
    Network (TDN).

  * Network Equipment

    GCS network equipment is installed in the GMT electronics room. GMTO will
    provide the cables from DCS DCCs and PLCs to the GCS network equipment.


  * General Service Network (GSN)

    **SWC-DCS-0129: GSN**

      Each DCS shall have a redundant connection to the GSN.


  * Low Latency Network (LLN)

    The LLN provides transport for real-time WFC control and telemetry. It
    guarantees data exchange with latency less than 10 microsec and jitter less
    than TBD microsec. The communication protocol is RDMA over 40Gbps
    Infiniband. Only DCS participating in fast WFC feedback control shall be
    connected to the LLN. DCSs may have multiple LLN network interfaces.

    **SWC-DCS-0130: LLN NIC**

      The DCS shall use only GMTO approved LLN NIC interfaces to connect to the
      LLN.

    **SWC-DCS-0131: LLN interface procurement**

      Specific hardware and software required by the LLN interface will be
      supplied by GMTO.

    **SWC-DCS-0132: LLN interface location**

      The LLN Interface is located in the GMT Electronic Room hosted by the DCC.


  * Time Distribution Network (TDN)

    The TDN provides project-wide time synchronization. It allows the DCS DCCs
    to be synchronized with an accuracy of 50 us RMS to the GMT Time, which is
    Universal Coordinated Time (UTC). The TCN network is carrying Precision Time
    Protocol (PTP version 2, IEEE-11588-2008). Any DCC requiring high accuracy
    time synchronization and time stamping shall be connected the TCN.

    **SWC-DCS-0133: TDN interface**

      The DCS shall use only GMTO approved TDN interfaces to connect to the TDN.

    **SWC-DCS-0134: TDN interface procurement**

      Specific hardware and software required by the TDN interface will be
      supplied by GMTO.

    **SWC-DCS-0135: TDN interface location**

      The TDN Interface is located in the GMT Electronics Room hosted by the DCC.


  * Data Archiving Network (DAN) (TBC)

    The Data Archiving Network (DAN) allows transferring the scientific data
    into the GMT Scientific Data Archiving System. The DAN is deployed using a
    dedicated high-throughput Ethernet network infrastructure.

    **SWC-DCS-0136: DAN interface**

      The DCS shall use only GMTO certified DAN interfaces to connect to the
      DAN.

    **SWC-DCS-0137: DAN interface procurement**

      Specific hardware and software required by the DAN interface will be
      supplied by GMTO.

    **SWC-DCS-0138: DAN interface location**

      The DAN interface shall be located in the GMT Electronics Room hosted by
      the DCC.



