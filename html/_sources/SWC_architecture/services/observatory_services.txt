.. _observatory_services:

Observatory Services
====================

The GMT software and controls system is highly distributed: the control
components are deployed in computers distributed across different locations of
the observatory and connected by networking infrastructure. This scheme makes it
possible to optimize digital and analog signal paths, thermal conditioning, and
maintenance accessibility.

A set of *common services* provides the basic infrastructure that enables the
*telescope control system* (TCS) and *observatory operations* (OOP) components
to communicate and collaborate in order to perform high-level control and
monitoring. Additionally, some of these services have components that allow
self-monitoring of their own operation.  The Figure below shows the
Observatory Services Product Tree:

.. figure:: _static/observatory_services_overview.png

  Observatory Services Product Tree

The set of common services available to
subsystems and components being controlled include:

  * Command Execution
  * Alarm events transport and management
  * Logging events transport
  * Telemetry sampling, transport and filtering
  * Component configuration
  * System health supervision
  * Engineering user interface
  * Command line access to all the registered components
  * Component and subsystem on line documentation (metadata)
  * Network infrastructure management
  * Data flow service (Low latency/ high bandwidth / synchronous)

.. include:: services-architecture_inc.rst

.. include:: services-common_inc.rst


