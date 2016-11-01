.. _dcs-context:

Context
-------

The following diagram extends the previous one to include the DCS components in
the context of the overall GMT software:

.. _figure-dcs_context:

.. figure:: _static/dcs_context.png

  DCS Context

The DCS Reference Architecture elements:

  **GMT SWC Core Systems**

    Includes all the hardware and software required to operate the observatory
    and telescope as a system and to coordinate all the DCSs. It comprises the
    Observatory Operation System, the Observatory Services System and the global
    Telescope Control System.

    * Observing Execution System – Includes all the hardware and software
      required operate the observatory.

    * Core Services – Includes common observatory services.

    * Telescope Control System (TCS) – Includes the system level functions (e.g.
      wavefront control, pointing) of the telescope control functions.

  **Controlled Subsystem (CSS)**

    Control relevant part of a system to achieve the specified control
    objectives. This includes the control system and the controlled plant. (e.g.
    M1)

    * Device Control Subsystem (DCS) – Includes all the hardware and software
      required to control a Subsystem Controlled Plant (SCP). DCS include a set
      of Device Control Packages and may include a set of Operation Support
      Packages (OSP).

      - Device Control Packages (DCP) – Includes all the software necessary to
        control a Subsystem Controlled Plant (SCP). 
 
      - Device Controller – Includes all the software necessary to operate a CSS
        Device.

      - Operation Support Packages (OSP) – Includes all the software necessary
        to operate a CSS integrated with the rest of the observatory.

    * Subsystem Controlled Plant (SCP) – Physical system, or one of its parts,
      which is the target of the control problem. Includes sensing and actuating
      Devices. (e.g. M1 support system). In the State Analysis [ref] terminology
      the plant is known as system under control.

Additionally two categories of DCS that share the same architectural principles are defined:

  * Telescope DCS (TDCS) – Collection of DCSs that provide control of telescope
    and adaptive optics CSS.

  * Instrument DCS (IDCS) – Collection of DCSs that provide control of a GMT
    Science Instruments. 

.. figure:: _static/dcs_reference_architecture.png

  Device Control Subsystem Reference Architecture
