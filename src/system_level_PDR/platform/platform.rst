
.. _platform:

Platform
========

This section provides a description of the technologies used in the development
of the GMT SWC System.  It is the responsibility of the SWCS to define the
platform that can meet operational requirements, thus most of the
platform-related requirements are located in Hardware and Software Standard
documents.

Several criteria play an important role in evaluating the platform technologies:
technical, long-term availability, commercial and community support, and cost
effectiveness. Fortunately, several choices are available both in the commercial
and open source world to address the requirements of the GMT Software and
Controls, making feasible several architecture platforms that will provide an
adequate implementation. The SWCS platform is based on the use of
well-established industrial standards, commercial off-the-shelf, and open source
products while custom-built solutions are strongly discouraged. Design choices
and prescribed standards come about through prototyping, benchmarking and
evaluations. Other guidelines considered include:

  * Avoiding proprietary or vendor lock-in options when several solutions based
    on open standards or even open source already exist,

  * Avoiding niche market solutions when alternatives exist from competitive
    markets, especially where economy of scale plays an important role (e.g.,
    industrial automation).

The GMT project office has evaluated [Filg12]_ several technologies as part of
its preliminary design work, ranging from mature to more emergent. Preliminary
evaluations show that a design based on widely available industrial open
standards and open source products is capable of meeting the GMT Control System
requirements. A set of guidelines and requirements regarding the use of these
technologies in the project is included in the Software and Controls Handbook
[Filg13b]_.

.. include:: platform-computing_inc.rst

.. include:: platform-field_device_interface_technology_inc.rst

.. include:: platform-time_distribution_system_inc.rst

.. include:: platform-distributed_communications_inc.rst

.. include:: platform-networking_inc.rst

.. include:: platform-software_development_inc.rst
