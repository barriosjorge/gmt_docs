.. _tcs_introduction:

Telescope Control System
========================

The Telescope Control System (TCS) encompasses the subsystems in charge of the
control of the telescope optomechanical devices. The design considerations of
the TCS provide a solution that seamlessly unifies the different modes of
operation: natural seeing, ground-layer AO (GLAO), laser tomography AO (LTAO),
into one system that is coherent, easy to manage, maintain, and upgrade.

The TCS subsystems are organized in a control and supervisory subsystem
hierarchy that mirrors the physical arrangement of the telescope subsystems. At
the bottom of the hierarchy, device control subsystems take care of the control
and operation support for the independent telescope hardware devices. These
devices are developed following different timelines and procurement paths (e.g.,
M2 positioner, M1 control system, Mount control system). This separation is
similar to the one used in other telescope projects and provides a modular
design that facilitates interface definition, development planning, and
integration and commissioning activities. Often these subsystems will have an
independent Factory Acceptance Test process prior to integration at the
observatory. Each device control subsystem follows the reference architecture as
described in :ref:`device_control_framework`. In addition, to the device control
subsystems – mainly concerned by mechanical degrees of freedom – two subsystems
provide high-level coordination and control functions: the Pointing Kernel and
Wavefront Control System (WFCS).

The Wavefront Control System provides the high-level optical control of the
telescope. The Pointing Kernel relates sky coordinates with mechanical and
detector coordinates and vice versa. The wavefront control and pointing kernel
subsystems coordinate these low-level device control subsystems to point the
telescope and move probes to the corresponding targets, to achieve and maintain
the nominal optical configuration, and to close the wavefront correction loops
during the execution of an observation. Observations and other operations are
defined and automated using the tools provided by the observatory operations
system (e.g., observing tools, sequencer).

Although the most critical function of the TCS is the control of the hardware
devices, efficiency, safety, and robust operations are also essential to
operations.  Those considerations lead to a design of the TCS that also has the
following functionalities:

  * Calibration. In many subsystems, calibration software is required to produce
    error maps or look-up tables that allow the control system to perform with
    the necessary accuracy.

  * Diagnosis. Some of the GMT hardware subsystems are quite complex. Specific
    software components are often required to verify the behavior of the system
    or to troubleshoot it in case of incorrect behavior.

  * Safety. There are some scenarios where a hardware device could be damaged
    due to incorrect operation. The Interlock and Safety System (ISS) is
    ultimately responsible for preventing any damage to equipment or injury to
    people by the telescope. The ISS may “kick-in” in a drastic way. Safety
    control components implement a safe operation that avoids the engagement of
    the ISS.

  * Supervision. Often the operation of a subsystem involves the coordination of
    several subordinate components. It is then the TCS’s responsibility to
    guarantee that subordinate components are in the correct state, and that the
    performance degrades gracefully in off- nominal scenarios. In addition to
    managing the configuration, startup, and shutdown of the control subsystems
    and hardware devices, supervisory components also implement kinematic
    transformations or anti-collision protection strategies when the system
    under control requires it.

The sections below give an overview of the TCS. :ref:`TCS Subsystems
<tcs-subsystems>` provides a summary of the subsystems inside the TCS, followed
by the degrees of freedom that the TCS controls in
:ref:`tcs-degrees_of_freedom`. The :ref:`tcs-requirements` section presents the
requirements governing the TCS design and operations, followed by details of the
:ref:`tcs-pointing_kernel`.  Lastly, the Section on :ref:`tcs-wavefront_control`
(TBC...) briefly describes the architecture of the GMT Wavefront Control System
(WFCS), and the specific designs of the GMT Natural and AO observing modes.

.. include:: tcs-subsystems.rst.inc

.. include:: tcs-degrees_of_freedom.rst.inc

.. include:: tcs-requirements.rst.inc

.. include:: tcs-pointing_kernel.rst.inc

.. include:: tcs-wavefront_control.rst.inc
