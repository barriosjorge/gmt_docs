Modules
-------

The SWCS domains (TCS, OPS, OSRV) are each composed of software subsystem
modules. As illustrated in the bottom row of Figure 10-3, each subsystem is then
made up of components organized into packages according to their affinity or
relationships. The SWC reference architecture16 defines a guide for organizing
subsystem components into a set of canonical packages. Examples of packages and
their components are shown in Table 10-3. Which packages exist in which
subsystem depends on the specific functionality (e.g., some subsystems do not
require special calibration components, or do not interface with hardware
devices). Table 10-3 describes this pattern, split in two categories:

  * Control Packages – These packages are included in subsystems that involve
    the control of optomechanical hardware Devices.

  * Operation Support Packages – These Packages include software components
    necessary to support health monitoring, automation, and proper operation of
    a Subsystem. Diagnosis and calibration packages are emphasized early on in
    the design. This is an area that is often overlooked despite the fact that
    they may take a significant amount of development effort, especially in the
    case of complex adaptive optics control subsystems.

Each Component has been assigned to a class that defines its default behavior in
the corresponding specification file. Table 10-4 shows an excerpt of the
specification file that defines the interface and features of a
BaseLinearAxisController (Section 10.3.5.5.3 provides an overview of common
motion control Components). This specification is based on the IEC 61800-7-20117
Standard. The standard is concrete, but at the same time is designed to cover a
majority of the motion control use cases. The design process captures when a
Component (e.g., agws_radial_stage_ctrl) fits this default behavior. This
approach provides several benefits:

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

