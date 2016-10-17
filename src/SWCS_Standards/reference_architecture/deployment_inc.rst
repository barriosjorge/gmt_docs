
.. _dcs-deployment:

DCS Deployment
--------------

The DCS reference architecture defines a generic design that shall be refined
and adapted to the specific CSS. The Figure below gives three examples of
possible DCS physical architectures.

.. figure:: _static/dcp_reference_architecture.png

  DCP Reference Architecture

A DCS consists on a set of Device Control Packages (DCP) and a set of Operation
Support Packages (OSP).

A DCP consists of one and only one Master Supervisor component for each CSS and
one or more Device Control Computers (DCC) hosting Device Controller components
interfacing to actuators and sensors via IO Modules. DCP Components communicate
with the GCS over the GMT Control Network (GCN). DCP Controllers may be
organized in a functional hierarchical manner and can be deployed in several
DCCs.

GMTO provides a set of software packages called GMT Software and Controls
Development Kit. The GDK includes a set of frameworks and development tools
(e.g. code, test and document generation) to be used by DCS developers. The GDK
is released at regular intervals (at least once per year, TBD ref to release
plan).

The following sections define the requirements that each DCS has to consider in
order to meet this architecture.

