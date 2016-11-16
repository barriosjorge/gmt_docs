.. _observatory_operations:

Observatory Operation System
============================

The Observatory Operations System (OPS) supports users during observatory
operations, which includes science observations, data management, and
engineering operations, among other activities. It not only provides users the
high-level software tools for observing, it also provides tools to manage
high-level workflows and logic to maximize science productivity as well as
observing and operational efficiency.

The OPS addresses the following use cases, categorized by user roles:

  * Scientists: document and data access, data processing, Phase I proposal
    design (exposure time calculation, data simulation, guide star finding),
    proposal preparation and submission

  * Observers: Phase II proposal submission, observing run planning, instrument
    configuration setup, target scheduling, target visualization, observing
    sequence design, run-time data quick-look; data acquisition, calibration,
    visualization, processing, quality verification and analysis; high level
    data (spectral extraction, mosaic, 3-D data cube) creation

  * AO Specialists: AO and laser maintenance, operations, control, and
    calibrations; safety monitoring, workflow and sequence design and execution

  * Instrument Scientist: operation, maintenance, and quality control of the
    science instruments, workflow and sequence design and execution

  * Telescope Operators: runtime target and queue scheduling, target
    visualization, instrument/telescope management and monitoring, sequence
    design and execution

  * Engineers: daytime maintenance, observatory logging, instrument diagnosis;
    data trend monitoring, analysis, calibration, data visualization; document
    management, nighttime troubleshooting assistance

  * Management: program management and long-term telescope scheduling; data
    archive management, software management

Maximizing operational efficiency is a key science and system level requirement
– one that has many implications impacting every aspect of the OPS design. For a
complex system like the GMT, maximizing efficiency requires not only providing
basic tools or standardizing user interfaces, it also involves: orchestrating
potentially complex workflows and activities to act in parallel or in sequence,
automating workflows where possible, actively monitoring the system performance,
providing adequate calibrations, and facilitating troubleshooting when problems
occur. During the software domain engineering process several aspects have been
considered:

  * Accurately capture observatory operations domain specific knowledge.

  * Standardize techniques that are used for carrying out observatory operations

  * Define user activities and workflows (e.g., scheduling, calibration,
    diagnosis, monitoring).

  * Identify capabilities (observing, monitoring, maintenance, and diagnosis)
    that need to be provided and for which subsystems.

  * Refine desired operational and monitoring capabilities into tools that need
    to be implemented.

  * Provide uniform processing, storage, and archival access, to all telemetry,
    engineering, environmental, science, management, and documentation data.

  * Identify common components in all subsystems so as to allow for code reuse.

  * Provide a concrete basis for estimating project effort and cost.

  * Facilitate collaboration between different users of the observatory in their
    various roles.

The sections to follow present the OPS. :ref:`operations_overview` presents an
overview of observatory operations by way of a typical operation workflow,
followed by the overall OPS architecture itself. :ref:`operations_deployment`
gives a brief overview of how the OPS will be deployed, followed by
:ref:`operations_subsystems`.  Subsequent sections discuss the components that
make up the OPS. :ref:`operations_user_interface` presents current user
interface concepts that are used to carry out operations. :ref:`observing_tools`
discusses observing tools used for proposal preparation and during observing.
Scheduling of telescope targets and programs can happen concurrently during
observations or over entire semesters or years, depending on the observing mode
(classical vs. queue), and is discussed in the :ref:`scheduling_system`.
Science observations or calibrations often may involve orchestrating instrument
and telescope operations, which is the role of the :ref:`sequencer`.  User
operation of the adaptive optics is fully integrated into the observing system.
Even so, operating the AO system involves several additional safety
considerations, including aircraft safety, laser traffic control safety, and
spacecraft safety (see :ref:`laser_ao_operations_safety`).  Next, the
:ref:`quality_monitoring System` supports proper system performance by
facilitating engineering analysis of the telemetry and instrumental data during
runtime or offline. Operational, engineering, and science data are stored
on-site at the observatory and mirrored offsite by the
:ref:`data_archiving_system`.  Lastly, the :ref:`data_processing_system` is
integral to both science observations and to ensure that the telescope,
instruments, sensors, and detectors, are performing properly during runtime.

.. toctree::
    :maxdepth: 1
    :numbered:

    overview
    deployment
    subsystems
    user_interface
    observing_tools
    scheduling_system
    sequencer
    laser_ao_safety
    quality_monitoring.rst
    data_archiving
    data_processing
