.. _Overall_Architecture:

Overall Architecture
====================

A system as complex as the GMT has many parts and behaviors that require
control.  The overall architecture of the GMT Software and Controls System
(SWCS) has to capture various properties and behaviors of the observatory as a
whole: the system organization, physical and behavioral properties of the
systems and subsystems, their control hierarchy, communication and interaction
of the subcomponents under control, runtime operations, how to use by human
operators.  Those various aspects together provide a coherent yet still
schematic narrative of the overall system.  They filter down and are refined
into technical and operational requirements that become the basis around which
detailed designs of the control software may begin.  The software architecture
is a process that captures decisions to best meet the requirements at the system
level, while optimizing over parameters to meet the :ref:`key-principles`, in
particular, performance, reliability, maintainability, and cost.  The discussion
below gives a summary of the overall SWCS architecture from several different
top-level perspectives, i.e. from the standpoint of the SWCS organization, the
global SWCS domains, software development layers, software deployment layers,
control hierarchy, system health and supervision, software frameworks, and the
subsystem modules.  More detailed discussions are provided in the appropriate
links.

.. _architecture-organization:

.. include:: architecture-organization.rst

.. _architecture-control_domains:

.. include:: architecture-domains.rst

.. _architecture-development:

.. include:: architecture-development.rst

.. _architecture-deployment:

.. include:: architecture-deployment.rst

.. _architecture-controls:

.. include:: architecture-controls.rst

.. _architecture-health_supervision:

.. include:: architecture-health_supervision.rst

.. _architecture-frameworks:

.. include:: architecture-frameworks.rst

.. _architecture-modules:

.. include:: architecture-modules.rst


