
.. _device_control_framework:

Device Control Framework
------------------------

Device control subsystems (e.g., primary mirror control system, ASM control
system) command mechanical degrees of freedom or read optical and other sensors.
Section 10.3.2.1 presents a list of the most significant device control
subsystems in the TCS. Their degrees of freedom are represented by a set of
state variables, which define the observed and desired state of the system and
are often updated in an arrangement of nested control loops. These control loops
may be implemented with different strategies:

  * The complete control loop is implemented in an embedded smart controller
    (e.g., a COTS motion drive that implements the EtherCAT CoE DS-402 profile).
    The embedded controller is supervised by a software component that allows
    the integration with the rest of the observatory services. This is the
    recommended implementation when a system under control has a single degree
    of freedom and single or dual feedback (the Rotation or Pupil stage of the
    LTWS is an example of this arrangement).

  * The system under control requires multiple actuators and/or feedback
    sensors, even if it has a single degree of freedom. In this case, part of
    the control loop runs inside a smart controller like in the previous case,
    but some part of the loop needs to runs in a high level controller – given
    that in this scenario it is difficult to find a commercial standardized
    product that provides the adequate number of inputs, outputs and capability
    of closing the loops using them (e.g., mount control system).
  
  * Optical degrees of freedom are often grouped in large interdependent sets.
    This scenario requires that the controller estimate the current state and
    calculate the desired state in complex computations with very diverse ranges
    of update regimes. These calculations are very specific to the optical
    system under control, so no standard solutions or commercial products exist.
    In this case, the development of specific software run on high performance
    computing hardware may be necessary (e.g., wavefront control).

Although the principal function of a Device Control Subsystem is the control of
hardware devices, an efficient and robust operation requires the development of
other important functions:

  * Calibration. In many subsystems, calibration software is required to produce
    error maps or look-up tables (LUT) that allow the control system to perform
    with the necessary accuracy.

  * Diagnosis. Some of the GMT hardware subsystems are quite complex. Specific
    software components are often required to verify the behavior of the system
    or to troubleshoot it in case of incorrect behavior.

  * Safety. There are some scenarios where a hardware device could be damaged
    due to incorrect operation. The Interlock and Safety System (ISS) is
    ultimately responsible to prevent any damage to equipment or injury to
    people by the telescope. The ISS “kicks-in” often in a dramatic way. Safety
    control components provide safe guards to preempt the engagement of the ISS.

  * Supervision. Often the operation of a subsystem involves coordinating
    several subordinate components. It is then the TCS responsibility to
    guarantee that subordinate components are in the correct state and that the
    performance degrades gracefully in off-nominal scenarios. In addition to
    managing the configuration, and startup/shutdown of the control subsystems
    and hardware devices, supervisory components also implement kinematic
    transformations or anti-collision protection strategies when the system
    under control requires it.

