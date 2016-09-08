Modules: Subsystem, Packages, Components
----------------------------------------

The SWCS domains (TCS, OPS, OSRV) are each composed of software subsystem
modules. As illustrated in the bottom row of the :ref:`swcs-organization`
figure, each subsystem is then made up of components organized into packages
according to their affinity or relationships. The SWC reference architecture16
defines a guide for organizing subsystem components into a set of canonical
packages.  Examples of packages and their components are shown in Table 10-3.
Which packages exist in which subsystem depends on the specific functionality
(e.g., some subsystems do not require special calibration components, or do not
interface with hardware devices). Table 10-3 describes this pattern, split in
two categories:

  * :ref:`Control Packages <control-packages>` – These packages are included in subsystems that involve
    the control of optomechanical hardware Devices.

  * :ref:`Operation Support Packages <operation-support-packages>` – These
    Packages include software components necessary to support health monitoring,
    automation, and proper operation of a Subsystem. Diagnosis and calibration
    packages are emphasized early on in the design. This is an area that is
    often overlooked despite the fact that they may take a significant amount of
    development effort, especially in the case of complex adaptive optics
    control subsystems.

.. _core-components:

.. figure:: _static/core-components.png

   Core Components


Each Component has been assigned to a class that defines its default behavior in
the corresponding specification file. Table 10-4 shows an excerpt of the
specification file that defines the interface and features of a
BaseLinearAxisController (Section 10.3.5.5.3 provides an overview of common
motion control Components). This specification is based on the IEC 61800-7-20117
Standard. The standard is concrete, but at the same time is designed to cover a
majority of the motion control use cases. The design process captures when a
Component (e.g., agws_radial_stage_ctrl) fits this default behavior. This
approach provides several benefits:

  * The specification of the component captures performance data, interfaces,
    etc., all of which are used directly in the final implementation.
    Furthermore, the specification closely dovetails a well-developed and
    industrial standard, which significantly reduces the effort needed to
    capture all the information.  This is in sync with the way industrial
    companies specify their subsystems.  This often allows one to implement the
    controller in a standard off-the-shelf smart drive, relieving the computing
    platform of the responsibility to perform all the real-time functionality.
    As the control loops run in dedicated standardized controllers, it is then
    feasible to implement a layer that integrates the controller with the rest
    of the observatory services using more productive high-level languages
    (Section 10.4.6).

  * The mapping between specification and implementation is as direct as it
    gets, and greatly facilitates the traceability of requirements.

  * The interfaces of similar Components share the same detailed specification
    (e.g., the interfaces of all the linear stages are the same). This not only
    allows the development of common control Components, but the possibility to
    reuse common visualization or calibration Components, as well as testing
    procedures.

  * It is possible to specify accordingly the majority of the elementary degrees
    of freedom of the GMT as well as some Axis Groups (e.g.,
    BaseLinearXYController for a Cartesian linear stage), as discussed in
    Section 10.3.2. It is also possible to incorporate fault management, and
    startup/shut down procedures in the same manner modeled using supervisor
    components.  Supervisors are usually more specific to the application and
    their implementation, thus require more customization. Other domains, like
    user interface components or data processing components have been subject to
    the same design process. Sections 10.3.5.9 and Section 10.3.5.7 describe
    them respectively.

.. _component-features:

.. figure:: _static/component-features.png

   Component Features


.. _control-packages:

+--------------------------------------------------------------------------------------------+
| CONTROL PACKAGES                                                                           |
+--------------------+--------------------------------------------------+--------------------+
| Package Name       |  Description                                     | Typical Components |
+====================+==================================================+====================+
| | Device Control   | | Contains software Components that implement    | | Supervisor,      |
| | Package          | | the supervisory and control functions of a     | | Controller       |
| |                  | | Device Control Subsystem (e.g. Mount Control   | |                  |
| |                  | | System Control Package).                       | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Data Acquisition | | Contains software Components that implement    | | Supervisor,      |
| | Package          | | the supervisory and data acquisition functions | | Controller,      |
| |                  | | of a Detector Control Subsystem (e.g., AGWS    | | Pipeline,        |
| |                  | | Slope Processor Package). Only Subsystems that | |                  |
| |                  | | include a Wavefront Sensor (WFS),              | |                  |
| |                  | | acquisition/guide camera or a science detector | |                  |
| |                  | | need to provide a Data Acquisition Package.    | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Hardware         | | Contains hardware Components in which to       | | Device Control   |
| | Package          | | deploy the Device Control or Data Acquisition  | | Computer,        |
| |                  | | Package software Components and the hardware   | | I/O Module       |
| |                  | | to interface with the electromechanical        | |                  |
| |                  | | Devices.                                       | |                  |
+--------------------+--------------------------------------------------+--------------------+

.. _operation-support-packages:

+--------------------------------------------------------------------------------------------+
| OPERATION SUPPORT PACKAGES                                                                 |
+--------------------+--------------------------------------------------+--------------------+
| Package Name       |  Description                                     | Typical Components |
+====================+==================================================+====================+
| | Sequencing       | | Contains sequence Components necessary for the | | Sequence         |
| | Package          | | operation of the Subsystem                     | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Diagnosis        | | Contains software Components necessary to      | | Supervisor,      |
| | Package          | | implement diagnosis functions when required.   | | Controller,      |
| |                  | | This may involve the development of special    | | Pipeline,        |
| |                  | | control or operation modes.                    | | Sequence         |
+--------------------+--------------------------------------------------+--------------------+
| | Calibration      | | Contains software Components necessary for     | | Supervisor,      |
| | Package          | | the calibration and characterization of        | | Controller,      |
| |                  | | hardware Devices.  This may include the        | | Pipeline,        |
| |                  | | development of special control or operation    | | Sequence         |
| |                  | | modes.                                         | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Data Processing  | | Contains software Components necessary for     | | Supervisor,      |
| | Package          | | the calibration and processing of science      | | Pipeline,        |
| |                  | | and wavefront sensor detectors.                | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Visualization    | | Contains software Components that provide      | | Panel,           |
| | Package          | | custom visualizations necessary for the        | | Widget           |
| |                  | | efficient operation of a given Subsystem (e.g. | |                  |
| |                  | | M1 global status Panel).  Note that default    | |                  |
| |                  | | engineering Panels are available as part of    | |                  |
| |                  | | the Engineering UI service.                    | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Safety           | | Contains hardware/software Components that     | | Supervisor,      |
| | Package          | | implement Subsystem specific safety functions. | | Controller,      |
| |                  | | These Components often interface with the ISS  | |                  |
| |                  | | but are independent (e.g. M1 safety            | |                  |
| |                  | | controller).                                   | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Operation        | | Contains Components that allow the automation  | | Workflow         |
| | Workflows        | | of high-level operation workflows relative to  | |                  |
| | Package          | | the subsystems (e.g. unit test workflow, or    | |                  |
| |                  | | calibration workflow in case that several      | |                  |
| |                  | | sequences and human operations are involved).  | |                  |
+--------------------+--------------------------------------------------+--------------------+
| | Management       | | Contains Components that capture the           | | Plan,            |
| | Package          | | development backlog and the Assembly           | | Workflow         |
| |                  | | Integration and Testing plans.                 | |                  |
+--------------------+--------------------------------------------------+--------------------+
