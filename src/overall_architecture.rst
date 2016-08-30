.. _Overall_Architecture:

Overall Architecture
====================

The first phase of the SWCS development starts with the domain engineering
process (clause 7.3.1 of ISO12207) that allows one to identify the main
architectural components of the SWCS and to group them into uniform categories
of: subsystems, packages and components, following the criteria of internal
affinity, rate of change propagation and interface size.

.. image:: _static/swcs-organization.png
  :align: center
  :scale: 70%
  :alt: SWCS Organization

The above figure illustrates the organization hierarchy illustrated as the
Unified Modeling Language (UML) diagram.  System, Domain, Subsystem and Packages
are aggregations that make up the hierarchy of the GMT software and control
Components. The Classifier class provides basic naming and description
attributes. The Configuration Item class extends Product Breakdown Element (PBE)
and Work Breakdown Element (WBE) classes to enable mapping of the SWCS structure
to the GMT project Product Breakdown Structure and Work Breakdown Structure.

SWCS Domains
------------

The top-level breakdown of the SWCS is based on a clear separation of concerns
between 4 high level domains: the Telescope Control System (TCS), Observatory
Operations System (OPS), Observatory Services (OSRV), and Instrument Control
System (ICS), as shown in the figure below. The components within each domain
are partitioned in a way to facilitate modular software design. Modularity
allows different components to evolve independently through the life of the
project, to address new scalability needs (e.g., new hardware subsystems require
higher performance telemetry), or to address different optimization strategies.

.. image:: _static/application-layer.png
  :align: center
  :scale: 70%
  :alt: Application Layer

In brief, the three domains and some underlying considerations are:

  * Telescope Control System – The TCS domain comprises subsystems that are in
    charge of controlling the telescope optomechanical devices. The hierarchy of
    the TCS architecture follows a functional decomposition or breakdown that
    closely mirrors the physical organization of the telescope hardware
    subsystem.  In this scheme, Device Control Subsystems (italicized to
    emphasize a model component by that name in the software architecture) take
    care of the elementary and aggregated mechanical degrees of freedom of the
    telescope, whereas the Wavefront Control and Pointing Kernel Subsystems take
    care of the integrated behavior of the telescope. The benefit of this
    structure is that it is likely to be very stable once the project is
    baselined. While new hardware will be developed and integrated during the
    life of the project, the core optomechanical design will remain unchanged.

    Most of the software subsystems of the TCS can be designed to share a common
    architecture, which is presented in Section 10.3.5.5 on Device Control
    Framework. Doing so facilitates reuse of common designs among subsystems,
    communication among groups due to having common “vocabularies” and concepts,
    development of a common body of experience, and a more efficient operation
    and maintenance due to the commonalities shared between subsystems. It also
    facilitates the creation of common development tools and process artifacts.
  
  * Observatory Operations groups the software subsystems that provide the
    capabilities to support efficient operations and workflows of the
    observatory.  This domain architecture follows a functional decomposition
    based on the core observatory operation workflows. As such the structure of
    the observatory operation subsystems more closely mirrors the different
    stages in the operation of an observatory: proposal preparation and
    planning, observation execution, final data processing, quality control, and
    archiving of the scientific data.

    The detailed specification of workflows and tools will evolve during the
    project construction phase and likely also during the operations phase as
    the project gains better understanding of the system and identifies areas
    where productivity can be improved. The goal is to develop a system that
    remains flexible and, at the same time, that efficiently supports the
    operational workflows without constraining the introduction of new ones.
  
  * Observatory Services groups the subsystems that provide common
    infrastructure service components. Each observatory services subsystem
    (engineering user interface, logging, telemetry, configuration, etc.)
    addresses a specific structural function. Structural functions are systemic
    in nature and they provide interfaces for any component in the system (e.g.,
    fault management, telemetry). The OSRV components allow developers to focus
    in writing application specific code without worrying about low-level
    infrastructure implementation details.


.. image:: _static/layered-architecture.png
  :align: center
  :scale: 70%
  :alt: Software Layered Architecture

