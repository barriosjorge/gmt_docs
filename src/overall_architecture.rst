.. _Overall_Architecture:

Overall Architecture
====================

A system as multifaceted and complex as the GMT has many areas that require
specifying and designing, from the conceptual to operational level, e.g.: the
system organization, physical and behavioral properties of the systems and
subsystems, their control hierarchy, communication and interaction of the
subcomponents under control, runtime operations, use by human operators, etc..
This means that there are many ways to describe how a system works, all of which
come together to form a complete and coherent picture of the overall system.
All the areas further filter down and are refined into technical and operational
requirements that become the basis around which to design software to meet.  The
software architecture captures decisions that best meet those requirements,
while optimizing over parameters to meet the :ref:`key-principles`, in
particular, performance, reliability, maintainability, and cost.

The discussion below gives a cross-sectional view of the overall SWCS
architecture, from the standpoint of the SWCS organization, the global SWCS
domains, software development layers, software deployment layers, control
hierarchy, system health and supervision, software frameworks, and the subsystem
modules.  More detailed discussions are provided in the appropriate links.

.. include:: architecture-organization.rst

.. include:: architecture-domains.rst

.. include:: architecture-development.rst

.. include:: architecture-deployment.rst

.. include:: architecture-controls.rst

.. include:: architecture-health_supervision.rst

.. include:: architecture-frameworks.rst

.. include:: architecture-modules.rst


