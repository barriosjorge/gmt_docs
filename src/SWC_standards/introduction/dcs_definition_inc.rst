.. _dcs_definition:

DCS_Definition
--------------

Each DCS includes all the hardware and software necessary to control and operate
a telescope or instrument opto/electro/mechanical subsystem (e.g. M1, NGSAO
wavefront sensor, GMT science instrument).  The :numref:`Figure %s
<figure-dcs_subsystems>`, below, presents the location of DCS within the context
of the overall Software and Controls System.  The adoption of a reference
architecture offers the following benefits:

  * Enables the inter-operation between different SWC subsystems.
  * Promotes commonality.
  * Enables reuse of components.
  * Simplifies operation and maintenance thanks to the use of common features.
  * Simplifies the definition of interfaces.
  * Reduces the number of spare parts needed to guarantee the downtime budget.
  * Fosters the use of same solutions to similar problems.
  * Provides a guideline for the design of the SWC subsystems.
  * Reduces the support effort.
  * Provides system level testing strategies

GMTO will support (e.g. frameworks, device drivers, development tools) the
development of all the hardware and software based in these standards. The
software subsystems developed for the GMTO shall use the frameworks and
components provided by GMTO. Other alternatives not included in the standard
shall not be considered neither supported.

New specific alternatives may be approved and introduced in the standard only
when, according the GMTO criteria:

  * The existing standard does not provide the capability to solve a problem.

  * The solution of a problem turns out to be too complex with the current
    standard whereas it could be easily solved by means of alternative
    technologies.

  * Technology evolution during the life of the telescope recommends updating
    part of the electronic equipment.

The hardware standards described here apply to all the electronic equipment and
electronic components that will be used in a DCS subsystem. This includes the
control of the instruments and other equipment that may be developed outside of
the project office. Subsystems developed externally shall be compliant with
these standards.

.. _figure-dcs_subsystems:

.. figure:: _static/dcs_subsystems.png

   DCS subsystems in the context of the GMT Software and Control System.
   Telescope and Instrument DCS account for almost 30 subsystems in the GMT
   Software and Controls System.

GMTO will release a new version of its software periodically; such software will
keep backward compatibility with previous versions to the largest possible
extent. The usage of such newer release shall be mandatory for every group
developing software for GMTO. In case of incompatible versions, an adaptation
time will be considered. Exceptionally, and with GMTO approval, the usage of
newer release can be temporary delayed if critical activities are in progress.

In the initial stages of the project some frameworks and libraries may have
their public interface already specified despite the fact that its
implementation is not yet completed. This is to inform the design of some
subsystems or to define interfaces between subsystems.

Due to the expected duration of the project, these standards should not be
considered frozen at present time. It is advisable for the project to make use
of the most recent concepts and tools as they become available and they
demonstrate an advantage over the existing ones (e.g. improved reliability,
lower cost).


