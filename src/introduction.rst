.. _Home:

Introduction
============

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
  infrastructure common services.  They serve as the low level interface between
  hardware and software components and observatory services.  Service adapters
  help to:

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

    * Archiving of the data and event streams coming from service adapters

    * Implementation of optimal communication pattern

    * Archiving of the service configuration data

    * Service analytics and reporting

    * Monitoring the health of the service adapters (the System Supervisor is
      responsible for monitoring the health of the different Service Supervisors)

    * Publish/subscribe access to the data and event streams

    * Load balancing

    * Fault tolerance

    * Scaling due to bandwidth or growing storage demands (e.g., new systems
      added to the observatory)

    * Visualization of service data

    * Cross filtering of multidimensional datasets.

    The implementation of the service supervisors is not monolithic. Depending
    on the prevailing communication patterns, it is possible to implement
    different ways to distribute the process workload (e.g., broker, fan-out).
    This allows the efficient use of computing resources and elastic adaptation
    to the load. 


*Service Bus*

  A dedicated service bus connects Service Adapters and Service Supervisors.
  Each service bus provides a logical network connection that addresses the
  specific throughput, bandwidth and latency requirements of the service.
  Section xxx provides a description of the GMT networking infrastructure.


Common Services
---------------

*Telemetry Service*

  The telemetry service provides the ability to observe any data transmitted by
  hardware or software subsystem available for monitoring. Telemetry data
  usually consist of a continuous flow of scalar values at a certain rate. The
  Telemetry Service allows one to select the quantities to monitor, and to start
  or to stop collecting data.

  The telemetry adapter provides an interface that allows:

    * Retrieval of quantities to be monitored in a given Subsystem or Component

    * Start/stop sampling and collecting of monitoring data

    * Specifying the rate at which the data are sampled.

  Two categories of measurement data can be sampled:

    * Continuous: quantities that are continuous in values. For instance, a
      temperature sensor. 

    * Discrete: quantities that are discrete in values. For instance, the state
      of a switch (ON, OFF), the position of a window within a range of three
      possible positions (CLOSED, HALF-OPEN, OPEN), etc. When monitoring
      discrete quantities, only the changes of value are sampled.

  The telemetry service is implemented, like other infrastructure services, as a
  distributed system.  The telemetry adapters allow any component of the system,
  usually running in Device Control Computers, to send any telemetry data to the
  telemetry supervisor through a common API.  Depending on the required
  bandwidth the adapter may provide different transport strategies (e.g., a
  circular buffer held in memory or Solid State Disk that is flushed
  periodically) and fault tolerance capabilities (e.g., routing the outgoing
  data to an alternative supervisor). The telemetry supervisor takes care of
  storing the data in the telemetry database for further analysis or to relay
  the streams of data for presentation in the user interface.


*Alarm Service*

  The alarm system, along with the system supervisor and the Interlock & Safety
  System (ISS), provide functions to assess and manage the overall health of the
  system. Alarm events are triggered when an alarm condition is detected by a
  Component (e.g., Controller or Supervisor). Alarm events are time-stamped and
  include information on the component that has triggered the alarm.

  The alarm system associates (using metadata) a set of actions with every alarm
  event that has to be monitored manually or executed automatically. These
  actions can include a reference to a workflow or sequence if one has been
  defined.

  Alarm conditions are part of the specification of a component:


  .. code-block:: coffeescript

    # Alarm Event Specification

    EnumType "AlarmSeverity",
        desc: "Defines the severity level of the AlarmEvent"
        literals:
            ALARM_A: ""

    StructType "AlarmEvent",
        extends: []
        abstract: false
        desc: "Time stamped Alarm Event"
        elements:
            id:
                type: "string"
                desc: "Alarm ID. Allows associating the alarm with the Alarm description"
            value:
                type: "string"
                desc: "Text message with additional information related to the alarm event occurrence"
            timestamp: type:
                type: "TimeStamp"
                desc: "Trigger time of the alarm event"
            severity:
                type: "AlarmSeverity", desc: “Level of severity of the alarm event”
            source:
                type: “string”
                desc: “URI of the component that has detect the alarm condition”


  When a fault condition occurs in a component, it is the responsibility of that
  component to either handle the fault or to transmit alarms up the supervisory
  chain until they reach a component that can address the problem, or else
  eventually up to the operations staff.

  The Alarm System provides the following capabilities:

    * Notification of alarm events from any component in the system

    * Analysis of the stream of alarms to identify system health conditions

    * Filtering of alarms

    * Storage of alarm events

    * Visualization of the status of all the alarms in the system

    * Correlation via timestamp with any other event in the system

    * Logging operator acknowledgment.

  In addition to the handling of alarm events, the alarm server provides
  features that allow managing of load balancing and fault tolerance. The alarm
  system operation, as with any other component, can be monitored by the
  telemetry system by specifying monitoring features in its interface (e.g., the
  number of components connected, the number of active alarms, state of the
  server, instant alarm throughput).

