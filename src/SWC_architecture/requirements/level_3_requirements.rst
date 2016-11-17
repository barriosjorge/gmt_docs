.. _level_3_SWCS_requirements:

Level 3 SWCS Requirements
-------------------------

The Level 3 SWCS Requirements Document [Mait13]_ is broadly divided into
Functional & Performance Requirements, and General Requirements, as prescribed
by Systems Engineering. Functional & Performance Requirements address telescope
operations (e.g., pointing, guiding, calibration, and thermal control),
observations, and observatory operations (e.g., data management, networking, and
common services).  In comparison, General Requirements address standards,
environment, health and safety, power services, maintenance, reliability, and
documentation of the observatory systems.

Before delving more specifically into Level 3 SWCS requirements, the following
Table presents an overview of the key System Level Requirements and their
flow-down to the SWCS:

.. table:: Principle Level 2 to Level 3 Requirements that Impact SWCS Design Considerations

  +-------------------------------------+--------------------------------------------------+
  | | Level 2 Requirements Summary      | | Level 3 Requirements Flowdown Summary          |
  +=====================================+==================================================+
  | | Lifetime -  Design for a 50-year  | | Communication Standards -  Define a set        |
  | | lifetime, assuming routine        | | of physical communication protocols.           |
  | | maintenance and periodic          +--------------------------------------------------+
  | | upgrades of components and        | | Electronics Standards –  Comply with the       |
  | | subsystems.                       | | electronics standards specifications per       |
  | |                                   | | GMT-SE-REF-00191.                              |
  | |                                   +--------------------------------------------------+
  | |                                   | | Permanent Storage –  Implement permanent       |
  | |                                   | | data storage and backup system at the          |
  | |                                   | | observatory.                                   |
  | |                                   +--------------------------------------------------+
  | |                                   | | Critical Spares –  Provide spares for critical |
  | |                                   | | subsystem and instrument components as         |
  | |                                   | | defined in the GMT Critical Spares Document    |
  | |                                   | | (GMT-SE-DOC-00277).                            |
  +-------------------------------------+--------------------------------------------------+
  | | Efficiency -  Optimize on-sky     | | Efficient Operations -  Identify and define    |
  | | observing efficiency.             | | sequences for instruments, telescope, and      |
  | |                                   | | science, operations to optimize on-sky         |
  | |                                   | | observing efficiency and comply with GMT       |
  | |                                   | | Efficiency Budget (GMT-SE-REF-00593).          |
  | |                                   +--------------------------------------------------+
  | |                                   | | User Command Sequencing -  Provide             |
  | |                                   | | capability to arrange commands in a way        |
  | |                                   | | that allows users to automate the execution    |
  | |                                   | | of complex operations.                         |
  +-------------------------------------+--------------------------------------------------+
  | | Operation Modes -  Enable         | | Operation Modes –  Provide classical, queue,   |
  | | classical, queue, interrupt, and  | | interrupt, and remote observer operation       |
  | | remote observer modes.            | | modes.                                         |
  | |                                   +--------------------------------------------------+
  | |                                   | | Scheduling and Planning -  Provide software    |
  | |                                   | | for advanced planning, scheduling, and         |
  | |                                   | | management of observing programs,              |
  | |                                   | | observatory workflows, and tasks.              |
  +-------------------------------------+--------------------------------------------------+
  | | Observing Modes –  Provide        | | Observing Modes –  Provide capability to       |
  | | natural seeing, NGSAO, LTAO,      | | operate the telescope in natural seeing,       |
  | | and GLAO observing capabilities.  | | GLAO, NGSAO, and LTAO observing modes.         |
  | |                                   +--------------------------------------------------+
  | |                                   | | Mode Switching –  Provide the capability to    |
  | |                                   | | switch from one observing mode to another.     |
  | |                                   +--------------------------------------------------+
  | |                                   | | Observing Conditions Monitoring –  Provide     |
  | |                                   | | the capability to monitor the required         |
  | |                                   | | observing conditions.                          |
  | |                                   +--------------------------------------------------+
  | |                                   | | Incomplete Segmentation –  Provide ability     |
  | |                                   | | to operate with incomplete segmentation.       |
  +-------------------------------------+--------------------------------------------------+
  | | Direct Gregorian (DG) Ports       | | Focal Stations –  Provide the capability to    |
  | | Folded Port (FP) Stations, and    | | operate the telescope using any of the eight   |
  | | Gravity Invariant Stations (GIS)  | | focal stations or future expansion ports.      |
  | | -  Provide standardized locations +--------------------------------------------------+
  | | in the Gregorian Instrument       | | Configuration –  Provide the capability to     |
  | | Rotator (GIR), on the top         | | switch from one telescope optical              |
  | | surface of the GIR, and on the    | | configuration to another in an automated       |
  | | Azimuth Structure, for mounting,  | | way for active instruments.                    |
  | | DG, FP, and GIS, Science          +--------------------------------------------------+
  | | Instruments, respectively.        | | Instruments –  Provide capability to automate  |
  | |                                   | | switching of active instruments, initiated     |
  | |                                   | | and monitored by the operator.                 |
  | |                                   +--------------------------------------------------+
  | |                                   | | Pointing Models -  Provide the ability to      |
  | |                                   | | store and switch between different pointing    |
  | |                                   | | models for all the focal stations.             |
  +-------------------------------------+--------------------------------------------------+
  | | FP Pupil Stability -  Maintain    | | Active Correction -  Actively control the      |
  | | the position of the exit pupil    | | optical system to obtain the best image        |
  | | at the FP focus to less than or   | | quality performance.                           |
  | | equal to 0.25% peak to valley     | |                                                |
  | | of the pupil diameter.            | |                                                |
  +-------------------------------------+--------------------------------------------------+
  | | Pointing Accuracy -  Provide:     | | Pointing Accuracy -  Provide capability to:    |
  | | blind pointing with error less    | | blind point with accuracies that comply with   |
  | | than 5 arcsec rms over the full   | | error budgets in document GMT-SE-REF-00477;    |
  | | range of telescope motion after   | | point relative to a guide star under natural   |
  | | initialization; relative          | | seeing with accuracies that comply with        |
  | | pointing to a guide star with     | | error budgets in document GMT-SE- REF-00477.   |
  | | accuracy better than 0.2 arcsec   +--------------------------------------------------+
  | | at the center of the science      | | Differential Flexure Correction -  Provide     |
  | | field for DG science instruments  | | capability to correct differential flexure     |
  | | under natural seeing.             | | between the AGWS and/or AO Wavefront Sensors   |
  | |                                   | | and the Science Instruments, using internal    |
  | |                                   | | guide sensors provided by the Science          |
  | |                                   | | Instruments, so as to comply with GMT          |
  | |                                   | | Pointing Budget (GMT-SE-REF-00477).            |
  +-------------------------------------+--------------------------------------------------+
  | | Automation of Start-up/           | | Automated Start-up/Shutdown Procedures -       |
  | | Shutdown –  provide automated     | | Provide the capability to execute start-up     |
  | | start-up / shutdown sequences,    | | and shutdown processes that are initiated      |
  | | procedures, and processes that    | | and monitored under operator control.          |
  | | are initiated, monitored, and     +--------------------------------------------------+
  | | controlled by the operator.       | | Standard State Machine –  The control          |
  | |                                   | | subsystem components shall implement a         |
  | |                                   | | SWCS standard state machine.                   |
  +-------------------------------------+--------------------------------------------------+
  | | Operation Support –  Provide      | | Astronomers’ Tools –  Provide software tools   |
  | | software tools to support         | | to assist astronomers in the proposal          |
  | | proposal preparation, program     | | process, observing program definition,         |
  | | definition, execution planning,   | | and execution planning.                        |
  | | execution, and quality            +--------------------------------------------------+
  | | assessment.                       | | Observatory Operations –  Provide software     |
  | |                                   | | tools to schedule and manage observatory       |
  | |                                   | | workflows and tasks, and to execute            |
  | |                                   | | observing programs.                            |
  | |                                   +--------------------------------------------------+
  | |                                   | | Quality Assessment –  Provide software tools   |
  | |                                   | | to assess the validity of observation data     |
  | |                                   | | products.                                      |
  | |                                   +--------------------------------------------------+
  | |                                   | | On-line Assistance –  Provide centralized      |
  | |                                   | | on-line tools to inform, search, and execute   |
  | |                                   | | user commands, and software components.        |
  +-------------------------------------+--------------------------------------------------+
  | | Observing Support -  Provide      | | Condition Monitoring -  Provide capabilities   |
  | | software, with integrated and     | | to monitor the required observing conditions.  |
  | | consistent user interfaces, to    +--------------------------------------------------+
  | | support observing and operation   | | Automated Reconfiguration –  Provide           |
  | | modes.                            | | capability to switch from one telescope        |
  | |                                   | | optical configuration and instrument to        |
  | |                                   | | another in an automated way for any active     |
  | |                                   | | instruments.                                   |
  | |                                   +--------------------------------------------------+
  | |                                   | | Graphical User Interface -  Provide an         |
  | |                                   | | integrated and consistent graphical user       |
  | |                                   | | interface.                                     |
  | |                                   +--------------------------------------------------+
  | |                                   | | Feature Discovery/Navigation -  Provide        |
  | |                                   | | capability to discover, navigate, and access   |
  | |                                   | | efficiently any feature provided by any        |
  | |                                   | | software component.                            |
  +-------------------------------------+--------------------------------------------------+
  | | Centralized Operation -           | | Centralized Control Functions –  Provide       |
  | | Critical systems for operations   | | central control capabilities for every control |
  | | shall be controlled from          | | subsystem.                                     |
  | | centralized operator              +--------------------------------------------------+
  | | workstations.                     | | Control Room -  The GMT observatory shall      |
  | |                                   | | be operated centrally from the control room.   |
  | |                                   +--------------------------------------------------+
  | |                                   | | Operators -  Design for operation by telescope |
  | |                                   | | operators, instrument specialists, and AO      |
  | |                                   | | specialists.                                   |
  +-------------------------------------+--------------------------------------------------+
  | | Data Archive and Access -         | | Science and Engineering data access -          |
  | | Provide data archive system for   | | provide the capability to uniformly store,     |
  | | collecting, storing, retrieving,  | | query, retrieve, and access: all data (raw and |
  | | and accessing all raw science     | | processed) during an observation, engineering  |
  | | and engineering data acquired     | | data from all subsystems, system logs and      |
  | | during observations, including    | | documentation, electrical and electronic       |
  | | relevant metadata.                | | schematics.                                    |
  | |                                   +--------------------------------------------------+
  | |                                   | | On-Line Documentation –  Provide users         |
  | |                                   | | with online help, guides, and manuals for all  |
  | |                                   | | equipment and facility instrumentation used    |
  | |                                   | | during routine operations, in a contextual     |
  | |                                   | | manner.                                        |
  +-------------------------------------+--------------------------------------------------+
  | | System Health -  Provide          | | System Health Assessment -  Provide            |
  | | continuous performance, status,   | | capability to assess the overall health        |
  | | and system health monitoring.     | | of the system.                                 |
  | |                                   +--------------------------------------------------+
  | |                                   | | Engineering Data System –  Provide             |
  | |                                   | | engineering data system to monitor the         |
  | |                                   | | health and performance of all subsystems       |
  | |                                   | | critical to the functioning of the observatory.|
  | |                                   +--------------------------------------------------+
  | |                                   | | Telemetry -  provide capability to sample,     |
  | |                                   | | display, and correlate any signal with the     |
  | |                                   | | resolution and frequency required to           |
  | |                                   | | characterize the behavior of the signal.       |
  | |                                   +--------------------------------------------------+
  | |                                   | | Log System -  provide a method to detect,      |
  | |                                   | | store, and notify the occurrence of relevant   |
  | |                                   | | operation events.                              |
  | |                                   +--------------------------------------------------+
  | |                                   | | Alarm System –  provide the capability to      |
  | |                                   | | manage alarm conditions.                       |
  +-------------------------------------+--------------------------------------------------+
  | | Code Compliance and Design        | | Overall Safety -  Comply with GMT              |
  | | Safety -  Design and construct    | | standards and procedures to insure the safety  |
  | | in accordance with building,      | | of the GMT facility, equipment, and personnel  |
  | | occupational, and electrical      | | at all times (GMT-SE-REF- 00229).              |
  | | safety codes defined in GMT       +--------------------------------------------------+
  | | Compliance to Regulations,        | | Interlock Safety System (ISS) –  Interface     |
  | | Codes and Standards               | | with the ISS to ensure the safe operation of   |
  | | (GMT-SE-REF-00229); adopt         | | the system.                                    |
  | | design safety practices to        +--------------------------------------------------+
  | | reduce risk to personnel and      | | Enhancing Safety via Software –  Provide       |
  | | equipment.                        | | software to enhance the safety and integrity   |
  | |                                   | | of the System.                                 |
  | |                                   +--------------------------------------------------+
  | |                                   | | Safety Limits Redundancy –  Include redundant  |
  | |                                   | | software limits on all systems with moving     |
  | |                                   | | parts that present an over-travel hazard risk. |
  | |                                   +--------------------------------------------------+
  | |                                   | | Non-interference of Manual Override –  The     |
  | |                                   | | SWCS shall not interfere with the protected    |
  | |                                   | | manual overrides on interlocks.                |
  | |                                   +--------------------------------------------------+
  | |                                   | | Time-outs –  Critical subsystems shall have    |
  | |                                   | | built-in time-outs to ensure correct           |
  | |                                   | | operation in case of central control failure.  |
  +-------------------------------------+--------------------------------------------------+
  | | Standards -  SWCS defines         | | Architecture -  Establish architecture for     |
  | | Software and Controls             | | instrument software and control subsystems.    |
  | | (GMT-SWC-REF-00029), and          +--------------------------------------------------+
  | | complies with Laser Safety        | | Software/Hardware Standards – Establish a      |
  | | (GMT-SE-REF-00229) Standards.     | | set of Software/Hardware standards             |
  | |                                   | | (GMT-SWC-REF-00029) for the project.           |
  | |                                   +--------------------------------------------------+
  | |                                   | | Communication Standards – Define a set of      |
  | |                                   | | physical communication protocols.              |
  | |                                   +--------------------------------------------------+
  | |                                   | | Electronics Standards – Comply with the        |
  | |                                   | | electronics standards specifications per       |
  | |                                   | | GMT-SE-REF-00191.                              |
  +-------------------------------------+--------------------------------------------------+

The subsections below present the Level 3 SWCS Requirements in more detail.
Functional, Performance and General Requirements are further subdivided into
other sub-categories, as summarized in subsections below.

*Functional and Performance Requirements*
.........................................

**Operational Requirements**

  For the telescope to meet requirements for science and operational efficiency
  the SWCS needs to safely control, automate and coordinate most subsystems to
  act in parallel or in sequence.

  Operational requirements range from operation modes (classical, queue, etc.),
  to observing modes (AO, natural seeing), to instruments, and efficiency. These
  and other areas and their requirements are summarized below:

  * *Operational Modes* -– Operational modes involve classical, queue, service,
    intherrupt, and remote observing, as required by the OCD and the SRD.
    Technical demands of the science programs often dictate which observing
    modes are the most suited. While most science programs benefit most from
    queue observing, "targets of opportunity" will require interrupt or remote
    observing modes. In contrast, some experimental, pilot, or high risk/high
    reward programs may benefit from classical observing. Operational modes
    affect the efficiency of both observatory operations and science, in terms
    of scheduling flexibility and instrument readiness requirements. In
    addition, the SWCS is required to operate the telescope with a partial
    complement of primary and/or secondary mirrors, which will require
    customized alignment, calibration, and phasing procedures.

  * *Observing Modes* -– The SWCS provides the capability to observe under
    natural seeing without any adaptive optics, as well as diffraction limited
    modes using natural and laser guide star adaptive optics to correct
    wavefront errors in the images delivered to the focal plane. The required
    observing modes are: Natural Seeing (NS), Ground Layer Adaptive Optics
    (GLAO), Natural Guide Star AO (NGSAO), and Laser Tomographic AO (LTAO). For
    details on these AO modes, refer to the Adaptive Optics section in SLPDR.
    The SWCS is required to monitor observing conditions and, as conditions
    change, to provide the capability to switch between different observing
    modes and different optical configurations.

  * *Instrument Operation* -– The OCD requires that instruments mounted at any
    of the ports can be deployed for use on any given night. The instrument
    ports include four Direct Gregorian ports in the GIR, three Folded Ports on
    top of the GIR, one Gravity Invariant station on the azimuth disk, one
    future Instrument Platform station on the non-rotating IP, and two Auxiliary
    Instrument ports on the elevation axis outside of the C-rings. The SWCS
    design provides standardized connections to all science instruments,
    maintain the readiness of all active instruments, and provide the capability
    to operate and switch an active instrument set during the night. Switching
    instruments will require the SWCS to automate the process (inserting or
    removing M3 and corrector-ADC, adjusting focus, etc.), and to monitor that
    different instruments do not interfere or vignette the fields of view.

  * *Availability and Startup* –- The operational state of the observatory and
    equipment must be precisely defined and, at any given moment in time, be
    known due to considerations for operations and safety of the staff and
    sensitive equipment. The Figure below shows the observatory states (off,
    environmentally controlled, standby, on) and processes (cold, warm, and
    standby starts).

    .. figure:: _static/observatory_operational_states.png

        Observatory Operational States

    An off state is when: all power is removed from the system, mechanical
    assemblies are properly parked, enclosure shutters are closed, and the
    software is in an inactive state. An environmentally controlled state is
    achieved when the system has reached its nominal operating temperature or
    pressure. A Standby state is reached when the system has achieved a high
    state of readiness to be used, and calibrations have been performed. An On
    state is achieved when the system has achieved full performance specs and is
    in normal operation.

    In most situations, the SWCS will provide the capability to automatically
    execute start-up and shutdown processes that are initiated, monitored, and
    controlled by an operator. Requirements are specified for the amount of time
    to achieve a certain state for the telescope and the AO system.

  * *Blind Pointing* –- Blind pointing is used to (re)position the telescope to
    within the capture range of the acquisition/guide sensors relying solely on
    the accuracy of the mechanical encoders and flexure tables, without
    referencing a bright star or science target with known coordinates. The SWCS
    is required to provide the capability to initialize and calibrate the
    pointing system from cold start, or on-the-fly, by acquiring a position
    reference target using an acquisition camera. The initial blind pointing
    accuracy for GMT is 10 arcsec RMS, with a goal of 5 arcsec. After initial
    pointing for the night, subsequent blind pointings are required to be better
    than 5 arcsec RMS over the full range of the telescope motion, with a goal
    of 3 arcsec. The SWCS will provide the capability to comply with pointing
    budgets that are allocated and related to software and hardware controls as
    given by GMT Pointing Budget (GMT-SE-REF-00477).

  * *AGWS Pointing* –- After stars are acquired by the AGWS, systematic pointing
    errors typically shrink to a size smaller than the natural seeing FWHM. The
    amount of residual offset errors depends on guide star brightness, location
    in the focal plane, the length of time averaging on the guide sensors, and
    differential flexure between the AGWS and the instrument. The pointing
    accuracy requirements are specified at the intersection of the telescope
    reference optical axis (ROA) and the instrument focal plane. For natural
    seeing, the GMT should achieve pointing accuracy to better than 0.2 arcsec
    at the DG ports, averaged over one second. At the center of a Folded Port
    science instrument, the requirement relaxes to 1 arcsec, to allow for
    relative flexure with M3. Differential flexure between the Telescope ROA and
    the Instrument ROA will add to the AGWS pointing uncertainty. The SWCS will
    provide the capability to calibrate and correct differential flexure between
    the AGWS and/or AO wavefront sensors, using guide sensors in the science
    instruments, and to maintain compliance with pointing budgets given by GMT
    Pointing Budget (GMT-SE-REF-00477).

  * *Tracking, Guiding, and Scanning* -– During science observations, the
    telescope structure, GIR, and guiders will move along specified trajectories
    to track the sky or to guide on objects at sidereal or non-sidereal rates.
    Tracking involves using pre-determined telescope mount and GIR encoder
    motion rates to track the rotation of the sky without a guide star. Guiding,
    in which pointing feedback comes from one or more off-axis guide stars, is
    necessary to compensate for pointing model errors and wind perturbations of
    the telescope structure and optics. When guiding sidereal astronomical
    targets, the AGWS probes are either fixed or may move around the telescope
    optical axis if GIR rotation is disabled. Guiding for non-sidereal targets
    requires the telescope to track along a non-sidereal trajectory, while the
    AGWS probes move along either linear or more complex trajectories. The same
    is true in the NGSAO and LTAO observing modes, in which the AGWS does not
    provide the fundamental pointing reference but is used to control
    field-dependent aberrations. In these modes, either the non-sidereal target
    itself, or an off-axis guide star on the On-Instrument Wavefront Sensor
    (OIWS, which must be steered along the predicted non-sidereal trajectory)
    provides the guiding feedback.  Continuous / Drift Scanning is a
    non-sidereal tracking mode where the telescope moves at a set rate relative
    to sky rotation as the science instrument integrates on the data and reads
    out at a predetermined rate. The SWCS will provide capabilities to track,
    guide, and scan, at sidereal and non-sidereal rates.  The GMT is required to
    guide/track on an object with apparent motion of less than 6 arcsec/min
    (with a goal of 20 arcsec/min) relative to the sky rotation.  The SWCS will
    comply with image quality requirements given by Natural Seeing Image Quality
    Error Budgets (GMT-SE-REF-00145) and AOS IQ Error Budget (GMT-AO-REF-00518)
    under AO observing modes.

    In addition to standard sidereal tracking and guiding modes, the SWCS will
    operate in several other more specialized modes. For certain science
    observations it may be necessary to guide on a science target by holding the
    GIR fixed (e.g., extrasolar planet imaging), up to 60 degrees without
    rotation, or by rotating it at particular rates (e.g., to maintain
    parallactic angle). For continuous, or drift, scan mode, the SWCS will
    provide a guided mode for linear scanning at any specified angle, with a
    drift rate that is selectable up to a maximum, and up to a travel distance
    limited by the guiders.

  * *Offsetting* -– An offset is where the telescope repositions by a small amount
    typically without having to reacquire a guide star. Several variations on
    the theme that are commonly used are "Nodding," "Dithering," and "Step and
    Integrate." The SWCS will provide capabilities to perform offsets of those
    and other types, with varying complexity on the patterns, and to coordinate
    observations after performing offsets. The offset distance has an absolute
    maximum of 3 arcmin. The SWCS will provide the capability to achieve
    relative offsets with overall accuracy requirements that comply with the
    allocations in GMT Pointing Budget (GMT-SE-REF-00477).

  * *Acquisition* -– Target acquisition is used for: telescope guiding, stacking
    the 7 telescope apertures, active optics corrections, adaptive optics
    corrections (natural and laser guide stars), and positioning science
    targets.  The SWCS will provide the capability to select and acquire
    observing targets, with acquisition times that comply with GMT Efficiency
    Budget (GMT-SE-REF-00593).

  * *Guiding and Active Optics* -– After guide star acquisitions, the telescope
    guides and delivers natural seeing corrected images to the instruments
    and/or AO system. During observations, the Active Optics (AcO) use guide
    stars to align the optics, collimate the telescope, and control the mirror
    figure for the primary mirror. The SWCS will enable AcO corrections after
    the end of the telescope slew motion. The SWCS should also allow telescope
    guiding even with AcO disabled. The SWCS will also monitor the active optics
    probe positions to prevent shadowing of the science DG narrow field, as well
    as < 20% of the DG wide field, during observations. Lastly the SWCS will
    monitor, and prevent, potential interference and collisions of the AGWS
    guide probes.

  * *Efficiency* –- Efficiency requirements influence the design of the SWCS by
    affecting the sequence of activities (performed in parallel or in series),
    and the partitions of time or error budgets. All efficiency requirements are
    passed onto, or identified, by the SWCS at Level 5 after other GMT subsystem
    requirements are better refined at Level 4. At Level 3, the SWCS has a
    requirement to later identify and define execution sequences for
    instruments, telescope, and science operations to optimize on-sky observing
    efficiency, so as to comply with GMT Efficiency Budget (GMT-SE-REF-00593).

  * *Calibration* -– Calibration requirements ensure that the system performs
    reliably, accurately, and consistently. The SWCS will provide the capability
    to support the calibration of all subsystems and instruments in active or
    ready state, and the calibration of all wavefront sensors during daytime
    prior to the start of observing. All GMT instrument calibrations must comply
    with GMT Efficiency Budget (GMT-SE-REF-00593). For AO, WFS calibrations
    occur during daytime; the amount of time allocated for calibrations for both
    routine and non-routine operations will be dictated by AO Calibration
    Efficiency Performance Budget document (GMT-AO-REF-00515).

**Thermal Control Requirements**

  Thermal control requirements manage the heat dissipation in the telescope
  chamber. Thermally conditioned electronic cabinets are used to control heat
  dissipation from electronic sources. The SWCS is required to remotely control
  these cabinets to keep their heat dissipation in the telescope chamber to less
  than 10 watts per square meter.

**Architectural Requirements**

  Software architecture pertains to the organizational structure; the components
  and their relationships; the properties of both; and the semantics necessary
  for understanding or reasoning about the system. Software Architectural
  Requirements establish the high level structure of the observatory software
  system. The SWCS Architectural Requirements are divided into and elaborated in
  the sections below.

  * *General* -– General requirements outline the high level command and control
    structure of the SWCS. The software architecture is based on a component
    model organized in a hierarchy of control and supervision. The SWCS will
    provide central control for every subsystem, and the capability to switch
    between central and local control. To facilitate efficiency in maintenance
    and operations, the SWCS must be able to discover, navigate, and access any
    feature provided by a software component, from a central location.

  * *User Profiles* -– To enable users to perform their functional roles, the
    SWCS defines several levels of access, including the telescope operator,
    instrument specialists, AO specialist, and astronomers, with appropriate and
    consistent graphical user interfaces appropriate for each use case.

  * *Telescope Control* -– At Level 3, the telescope control requirements for
    the SWCS remain at high level, requiring that all subsystems have a standard
    behavior, and that the SWCS provides control for all optical and mechanical
    degrees of freedom. The notion of “Control” includes functions like:
    physical control, logic, sensor reading (optical, mechanical, pressure,
    temperature), commands, diagnosis, calibration, safety, configuration,
    monitoring, or fault management. The SWCS is required to contribute to the
    performance of the system to within the error budget allocations. In
    addition, electronic cabinets in the enclosure should contain only equipment
    that requires short electrical connections to field elements. Remote
    input/output modules should be used whenever possible. The SWCS is required
    to use fiber optic cables that provide electrical isolation when needed.

  * *Observatory Operations* -– Observatory operations involve observations
    management and execution, and data management. Briefly:

      Observation Management and Execution -– From the SLR, the SWCS is required
      to provide tools to assist astronomers in the proposal process to define,
      plan, and execute observing programs. The SWCS will facilitate observing
      by implementing sequences that allow astronomers and operators to automate
      complex operations. The SWCS must also provide the capability to schedule
      and manage observatory workflows and tasks, and monitor the observing
      status of programs. Lastly, the SWCS will implement tools to assess and
      validate data quality.

      Data Management –- Data management requirements call for providing: a data
      archive system for collecting, storing, and retrieving all data acquired
      during observations, including metadata, for the lifetime of the
      observatory; methods to generate data bundles (engineering, science,
      calibration, etc.); a method to group, access, and query science,
      engineering, and telemetry data from the engineering archive; and a
      capability to distribute data offsite.

  * *Observatory Services* -– Observatory services include common
    infrastructure, networking, time synchronization, and data storage systems.
    The requirements for those services are briefly:

      Common Services -– Telemetry, system health assessment, log system,
      configuration management and alarm systems are commonly present in all
      subsystems and components. The SWCS will provide centralized capabilities
      to implement and monitor those services. The SWCS will also provide users
      a universal way to gather information, via visualization displays, or an
      ability to search on existing observatory subsystems for the presence of
      software and hardware components, and their available commands.

      Networking –- The SWCS provides the following networking infrastructure to
      support different levels of quality-of-service and scalability: low
      latency control network, ultra- low latency network to enable GMT
      wavefront control modes, high bandwidth bulk and streaming data transfer,
      industrial Ethernet fieldbus; fiber optics connection between electronic
      room and equipment in the enclosure and telescope; and redundant network
      cabling connection between mission critical components.

      Time Synchronization -– Time synchronization is fundamental to observatory
      operations. The SWCS will coordinate the operations of subsystems to
      within time budgets allocated by the SLR. The SWCS will also obtain and
      serve observatory-wide accurate time references.

      Storage –- Storage requirements define the need for different types of
      storage: non- permanent local storage, transient, permanent, and backup.
      Critical engineering data and permanent data backup will exist for the
      lifetime of the observatory. The SWCS will provide a high bandwidth
      storage network for data access.

**Interface Requirements**

  SWCS shall comply with Internal, Telescope, AOS, Instrument, Facilities,
  Enclosure, Interlock and Safety System and System Services interface control
  documents (ICD). The SWCS main interfaces have been identified and the
  corresponding interface control documents are summarized in the Table below.
  The overall strategy for interface specification is described in Sections
  on :ref:`architecture-development` and :ref:`subsystem_specification_and_modeling`.

.. table:: Software and Controls ICDs (sorted by SWCS PBS)

  +-----------------------------+--------------------------------------------------------------------+
  | ICD Number                  | ICD Name                                                           |
  +=============================+====================================================================+
  | GMT-3.0_6.1.1-ICD-00629     | Software and Controls to GMTIFS ICD                                |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.2.1-ICD-00630     | Software and Controls to GMACS ICD                                 |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.2.2-ICD-00631     | Software and Controls to MANIFEST ICD                              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.3.1-ICD-00632     | Software and Controls to G-CLEF ICD                                |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.2-ICD-00594     | Software and Controls to M1 Subsystem ICD                          |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.7.2.6-ICD-00595 | Software and Controls to M2 Positioner Assembly ICD                |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.1-ICD-00596     | Software and Controls to FSM Subsystem ICD                         |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.7.2.7-ICD-00597 | Software and Controls to M2 Baffles ICD                            |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.5-ICD-00600     | Software and Controls to M3 Subsystem ICD                          |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.7-ICD-00539     | Software and Controls to Mount Subsystem ICD                       |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.4-ICD-00599     | Software and Controls to GIR Subsystem ICD                         |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.3-ICD-00598     | Software and Controls to Corrector-ADC Subsystem ICD               |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.6-ICD-00601     | Software and Controls to Acquisition, Guide and Wavefront          |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.6-ICD-00633       | Software and Controls to Facility Calibration System ICD           |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_7.3.4-ICD-00496     | Enclosure Control System to Enclosure Building Control System ICD  |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_7.3.4-ICD-00492     | Software and Controls to Enclosure Building Control System ICD     |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_2.2-ICD-00634       | Software and Controls to GMT Environmental Monitoring Facility     |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_2.1-ICD-00635       | Software and Controls to Interlock and Safety System ICD           |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.1-ICD-00433       | Software and Controls to Adaptive Secondary Mirror System ICD      |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.2.3-ICD-00183     | Software and Controls to VWS Support Subsystem ICD                 |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.2.1-ICD-00436     | Software and Controls to Natural Guide Star WFS Subsystem ICD      |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.2.2-ICD-00437     | Software and Controls to Laser Tomography WFS Subsystem ICD        |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.3-ICD-00435       | Software and Controls to On-Instrument WFS System ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.5.1-ICD-00438     | Software and Controls to Phasing Camera Subsystem ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.5.2-ICD-00434     | Software and Controls to M1 Edge Sensor Subsystem ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.5.3-ICD-00440     | Software and Controls to M2 Edge Sensor Subsystem ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.6-ICD-00439       | Software and Controls to AO Real Time System ICD                   |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.7-ICD-00252       | Software and Controls to Laser Guide Star Facility ICD             |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.8-ICD-00441       | Software and Controls to AO Calibration System ICD                 |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.9-ICD-00442       | Software and Controls to AO Commissioning Camera System ICD        |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_2.3.2.2-ICD-00636   | Software and Controls to Electronics Cabinets and Enclosures ICD   |
  +-----------------------------+--------------------------------------------------------------------+

*General Requirements*
......................

General Requirements involve: SWCS common standards, environmental and health,
general services, maintenance, documentation, and testing – items which are
required to establish and maintain the baseline health and proper functioning
the observatory at all times that GMTO is in operation. The items are briefly
summarized below.

**Standards Requiremnets**

  Standards Requirements involve SWCS standards that enable the integration of
  software and hardware into a coherent telescope system, whereas data formats
  standards establish common practices for properly expressing and representing
  numerical and science data.

    * *SWCS standards* -– The SWCS standards require that the SWCS establish a
      reference model for a control subsystem, software and hardware standards
      (SWC-REF-00029) and comply with electronic, software (operating systems,
      user interface libraries, distributed system libraries, network,
      databases, etc.), and hardware standards (control computers, PLCs,
      workstations, servers, I/O modules, fieldbuses and network).

    * *Data Formats* -– Data format standards require that the SWCS use SI units,
      that all numerical values which represent physical magnitudes have units,
      that GMT adopt the Flexible Image Transport Systems (FITS) to record
      science observations, that the GMT data be compliant with Virtual
      Observatory standards, and that the SWCS provide a data archive system for
      collecting, storing, and retrieving all raw data and metadata acquired
      during observations for the lifetime of the observatory.

**Health and Safety Requirements**

  To establish a safe working environment, the GMT project adopts industry
  standards presented in the document: GMT Compliance to Regulations, Codes and
  Standards [Sawy12a]_, which the SWCS inheritsa nd complies with as the
  baseline.  The Hazard Analysis process described in Chapter 5.11 of the SLPDR
  identifies safety risks and defines mitigation actions that are allocated to
  GMT subsystems, including the SWCS. The SWCS is required to provide
  capabilities: to continuously monitor performance, status, and health of the
  system; to interface with the Interlock and Safety System; to enhance the
  safety and integrity of the system with software; to include redundant safety
  limits on moving parts that have risk implications for the hardware or
  personnel; and to enable manual interlock override without interference from
  software. However the SWCS is not ultimately responsible for the safety of the
  personnel and the system. The SWCS must also inherit operating limits
  established by Level 2 requirements, such as observing limits for science
  observations that include absolute hardware and software limit-switches. In
  case of central control failure (e.g., in the observatory control system,
  operator console), all critical subsystems will have built-in time-outs.
  Lastly, the SWCS will provide status information for: common operating states,
  alarm conditions, trip conditions and corrective actions, power supply, and
  other items required to operate subsystems from the control room. 

**Environmental Requirements**

  Environmental requirements facilitate the optimal use of the observatory by
  monitoring the atmosphere and weather forecasts to aid observation scheduling,
  planning, and on-the-fly decision making. The requirements protect the
  observatory and instruments actively during adverse weather (lightning, rain,
  and wind storms) and earthquakes by triggering emergency procedures
  automatically or with operator supervision. The electronic and hardware
  components must also be protected passively from moisture, power surges, wind,
  etc.

  The Environmental Requirements stipulate that the GMT will be operated
  centrally from a control room, and that electronic equipment for operating the
  telescope, AO, and instruments will be located in the electronics room. The
  SWCS will provide capabilities: to access weather forecasting; to interface to
  the environment monitoring facility to monitor dust, atmospheric turbulence,
  water vapor, atmospheric seeing, weather conditions; and to record, and make
  accessible, all environmental statistics. In the event of an earthquake, the
  SWCS is designed to survive without structure failure up to a maximum level
  defined in the document on GMT Environmental Conditions [Mait12]_. The SWCS
  will provide capability to execute automated safety procedures to protect
  personnel, the telescope, enclosure, instruments, and electrical systems, in
  the event of loss of power, storms, lightning, and earthquakes.

**Services Requirements**

  Service requirements involve power, electrical grounding, liquid cooling,
  compressed air, nitrogen, helium, communication lines, electronic cabinets, and
  washing services. GMTO will utilize Chilean standard voltages (380V 3-phase and
  220V single phase) and frequency (50 Hz), backed up by on-site emergency power
  generators, and supplied to the telescope through various power distribution
  panels and electronics cabinets installed as part of the telescope systems
  utilities infrastructure. The SWCS hardware (e.g., computers, networking
  equipment) will run off of UPS as per the GMT Common Utilities power budget
  (GMT-SE-REF-00366).
  
    * *Power* -– The requirements for the electrical power systems are defined in
      GMT Electrical Power Systems [Sawy12b]_ and Telescope Common Utilities and
      Equipment [Sawy12c]_.  The SWCS is required to provide cabling
      infrastructure to support safe installation and operation of the GMT control
      system.
  
    * *Grounds* -– In addition to the grounds associated with power feeds to various
      sub-circuits and equipment on the telescope, additional circuits will be
      required to electrically ground the structures of the moving components
      (azimuth disk, Optical Support Structure, and GIR), and other locations to
      isolate noise sensitive equipment. The SWCS equipment will be compatible
      with the GMT power filtering and grounding system, which has been designed
      to minimize electrical interference.
  
    * *Electronics Cabinets* -– According to the document Telescope Common
      Utilities and Equipment8, there are 8 service bays on the GIR that will be
      used for placing 16 electronics cabinets. The IP platform and azimuth
      platform structures will also include an area for locating electronic
      cabinets. The Standard Electronics Cabinets (SEC) includes active heat
      removal for a maximum of 2000 W, and feature remote power on/off control.
      Each SEC provides 2200W of 220V UPS. The SEC maintains the air inside the
      cabinet to an average temperature of ambient ± 2C. The SWCS hardware
      components will be designed to allow adequate installation clearances inside
      the SEC and will provide the local control of the cabinets and the
      integration with the supervisory components of the Observatory Control
      System for global start-stop sequences and health monitoring.

**Reliability and Maintainability Requirements**

  These requirements promote system reliability and facilitate routine
  maintenance. Reliability is achieved by: using high quality components,
  over-specifying or overrating equipment, implementing contamination control,
  using proven design techniques, designing for ease of serviceability, and
  providing adequate spare parts. The SWCS will provide: an engineering mode to
  allow low-level control of components and subsystems; software tools to
  display real-time and long-term performance trends of components and
  subsystems; an ability to correlate time-stamped data with other subsystems.
  The SWCS will also provide equipment, procedures, and safe access, to maintain
  and service all critical components. The SWCS will provide the capability to
  achieve maintenance time requirements per Maintenance Time Budget
  (GMT-SE-DOC-00420). The SWCS will also standardize common components to
  optimize the stock and number of different spare parts.

**Documentation Requirements**

  The SWCS will provide documentation needed to operate, support, and maintain
  the GMT. All SWCS documentation will be accessible, searchable, and
  retrievable on-line. SWCS documentation will also provide access to user
  guides for all equipment and facility instrumentation used during routine
  operations, technical documentation (manuals, drawings), and electronics
  schematics.

**Testing Requirements**

  Testing requirements pertain to testing and verification of the GMT software,
  instruments, and subsystems produced by all the partners and subcontractors
  working with and for the project. The SWCS will develop software modules that
  have automated test procedures, and that support testing for backward
  compatibility. Contractors and procurement suppliers must provide SWCS all
  necessary software and hardware tools for factory acceptance testing.
  Documentation for testing includes information on the version of equipment,
  version of test specification, and version of design specification, for every
  test (unit testing, system and integration, acceptance). The SWCS will
  generate a report that tracks all requirements that are fulfilled,
  unfulfilled, or unverifiable, using a common template. All the software
  components of the SWCS will be subject to a Continuous Integration Process
  with the goal of ensuring interface compatibility before the final
  integration. The Continuous Integration Process will also include automated
  unit and integration testing as the software modules are incrementally
  developed. This process will include all the software components, regardless
  of the organization procuring them.
