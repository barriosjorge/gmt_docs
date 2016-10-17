.. _dcs-component_architecture:

Component Architecture
----------------------

The design of the GMT software and controls system is based on a distributed
component architecture. Components represent the most elementary unit for the
purpose of development, testing, integration and reuse. Groups of components can
be connected to create composite modules that implement complex functions.
Component interfaces are defined using Ports, which can be linked by means of
Connectors. For example, connectors are used to (a) integrate standardized
reusable control components with a given field bus configuration; (b) connect
component responses with user interface components; or (c) connect components
with common observatory services. Connectors are specified in the model without
making any assumption of the underlying middleware used by the platform-specific
implementation.

.. figure:: _static/component_port_connector.png

  Component, Port, and Connector

Components, Ports and Connectors are used to model both physical and logical
systems. SysML internal block diagrams (*ibd*) are used to represent how
components relate to each other.

The basic components used to model the device control domain are Device
Controllers and Supervisors. Device controllers are specialized components that
implement the control function of single degree of freedom (e.g. linear position
controller) or multiple degrees of freedom that coordinate more elementary ones
(e.g. axis group controller). Supervisors implement the high-level interfaces of
DCSs and are responsible of the subsystem integrity (e.g. collision avoidance),
component configuration, subsystem robustness, component life cycle and
subsystem modal transitions amongst other functions.

