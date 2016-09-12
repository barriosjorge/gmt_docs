.. _Overall_Architecture:

Overall Architecture
====================

A system as complex as the GMT has many parts and behaviors that require
control.  As such there are multiple ways to describe the system, what it is,
and how it works, e.g.: the system organization, physical and behavioral
properties of the systems and subsystems, their control hierarchy, communication
and interaction of the subcomponents under control, runtime operations, how to
use by human operators.  Those characterizations, taken altogether, form a more
complete and coherent picture of the overall system than any individual aspect.
They filter down and are refined into technical and operational requirements
that become the basis around which to design the control software.  The software
architecture captures decisions that best meet those requirements, while
optimizing over parameters to meet the :ref:`key-principles`, in particular,
performance, reliability, maintainability, and cost.

The discussion below gives a summary of the overall SWCS architecture from
several different top-level perspectives, i.e. from the standpoint of the SWCS
organization, the global SWCS domains, software development layers, software
deployment layers, control hierarchy, system health and supervision, software
frameworks, and the subsystem modules.  More detailed discussions are provided
in the appropriate links.

.. include:: architecture-organization.rst

.. include:: architecture-domains.rst

.. include:: architecture-development.rst

.. include:: architecture-deployment.rst

.. include:: architecture-controls.rst

.. include:: architecture-health_supervision.rst

.. include:: architecture-frameworks.rst

.. include:: architecture-modules.rst


