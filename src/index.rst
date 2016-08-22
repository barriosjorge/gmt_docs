.. _Home:

Introduction
============

.. toctree::
   :maxdepth: 1

Welcome to the GMT Software & Controls home page.

The GMT software and controls system is highly distributed: the control
components are deployed in computers distributed across different locations of
the observatory and connected by networking infrastructure. This scheme makes it
possible to optimize digital and analog signal paths, thermal conditioning, and
maintenance accessibility.

A set of *common services* provides the basic infrastructure that enables the
*telescope control system* (TCS) and *observatory operations* (OOP) components
to communicate and collaborate in order to perform high-level control and
monitoring. Additionally, some of these services have components that allow
self-monitoring of their own operation.  The set of common services available to
subsystems and components being controlled include:

  * Engineering User Interface 
  * Networking infrastructure
  * Configuration
  * Command Execution
  * On-Line Documentation
  * System Supervision
  * Logging
  * Telemetry
  * Alarm

Service Architecture
--------------------

The implementation of the common services follows a distributed architecture (see
following figure) in which (1) distributed components (right-hand-side, blue
blocks) access the service bus via *service adapters* API when an event is
generated (e.g. alarm detected).  (2)  The "payload" (e.g. alarm event,
telemetry sample) is transported from adapter to supervisor through the *service
bus*. (3) *Service supervisors* coordinate services, and process the service
payload when received.  (4) The service payload is stored and/or forwarded to
components that subscribe to the service.  (5)  Operators can filter or
cross-correlate any persistent data stream for further analysis.  Briefly,
some of the highlighted items and terminologies are:

.. image:: _static/common-services-architecture.png
  :align: center
  :scale: 70%
  :alt: Common Services Architecture

*Service Adapters*

  Service adapters enable every distributed component in the system to access
  infrastructure common services.  They serve as the low level interface
  between hardware and software components and observatory services.   The
  reasons for using service adapters are that they help to:

    *  Isolate distributed components from service implementation.  This
       helps to manage obsolescence in hardware and software.

    *  Focus application developers on developing applications (e.g. control,
       data processing).  Application developers should not need to solve
       infrastructure problems that are common to all subsystems.

    *  Standardize base implmentation. A base component (in an object oriented
       sense) implementation provides a template for all service adapters
       to bootstrap from. 

    *  Simplify interaction and deployment.  Software components need to only
       know about the service native API, and not how the service or
       distributed communication are implemented.  They hide details like
       how to manage connection, service threads, marshaling and de-marshaling
       of events and data streams, time stamps, middleware configuration,
       optimal communication pattern, how to register component services
       in runtime database.

  Communication between adapters and supervisors may
  follow different communication patterns (e.g., publish/subscribe, push/pull,
  request/reply).  Section XXX (Core Component Framework) describes the
  different communication patterns that are available. 

*Service Supervisors*

  Service supervisors coordinate and maintain the health status of the services.
  Some services may require several servers running in a cluster, or may connect
  to a high performance file system for persistent high throughput events or
  data streams. The service supervisor provides the following capabilities:


.. note:: 

  Version 1.0 is out!  The purpose of v1.0 documentation is currently limited to
  showing how to configure, start and monitor services (using logging and
  telemetry as examples), how to establish a communication network, and finally,
  how to setup a device control system.  Future versions of this document will
  add other information as the development progresses.


.. toctree::
   :maxdepth: 1

   installation

.. toctree::
   :maxdepth: 1

   configuration

.. toctree::
   :maxdepth: 1

   services

.. toctree::
   :maxdepth: 1

   examples

.. toctree::
   :maxdepth: 1

   dcs_dev_guide

.. toctree::
   :maxdepth: 1

   contribute
