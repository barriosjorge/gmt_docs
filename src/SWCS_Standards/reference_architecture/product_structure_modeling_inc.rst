
.. _dcs-product_structure_modeling:

DCS Product Structure Modeling
------------------------------

Each DCS is made up of components organized into packages according to their
functional affinity or relationships. Examples of packages and their components
are shown in the Table below.

[TBA] Table with function categories and abbreviation. Example of allocation of
functions to components as part of the product verification matrix.


**Functional Breakdown**

  Which packages exist in which subsystem depends on the specific functionality
  (e.g., some subsystems do not require special calibration components, or do
  not interface with hardware devices). The Table below describes this pattern,
  split in two categories:

    * Device Control Packages (DCP) – These packages are included in subsystems
      that involve the control of optomechanical hardware Devices.  

    * Operation Support Packages (OSP) – These Packages include software
      components necessary to support health monitoring, automation, and proper
      operation of a Subsystem.  Diagnosis and calibration packages are
      emphasized early on in the design.  This is an area that is often
      overlooked despite the fact that they may take a significant amount of
      development effort, especially in the case of complex adaptive optics
      control subsystems.

.. table:: SWC Functional Packages:  Device Control

  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Package Name        | | Description                                               | | Typical           |
  | |                     | |                                                           | | Components        |
  +=======================+=============================================================+=====================+
  | | Control Package     | | Contains software Components that implement the           | | Supervisor,       |
  | |                     | | supervisory and control functions of a Device             | | Controller        |
  | |                     | | Control Subsystem (e.g., Mount Control System             | |                   |
  | |                     | | Control Package).                                         | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Data Acquisition    | | Contains software Components that implement the           | | Supervisor,       |
  | |                     | | supervisory and data acquisition functions of a Detector  | | Controller,       |
  | |                     | | Control Subsystem (e.g., AGWS Slope Processor Package).   | | Pipeline          |
  | |                     | | Only Subsystems that contain detectors (e.g wavefront     | |                   |
  | |                     | | sensor, acquisition/guide camera or a science detector)   | |                   |
  | |                     | | need to provide a Data Acquisition Package.               | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Hardware Package    | | Contains hardware Components in which to deploy the       | | Device Control    |
  | |                     | | Device Control or Data Acquisition Package software       | | Computer,         |
  | |                     | | Component and the hardware to interface with the          | | I/O Module        |
  | |                     | | electromechanical Devices.                                | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+

.. table:: SWC Functional Packages:  Operation Support

  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Package Name        | | Description                                               | | Typical           |
  | |                     | |                                                           | | Components        |
  +=======================+=============================================================+=====================+
  | | Sequencing Package  | | Contains sequence Components necessary for the            | | Sequence          |
  | |                     | | operation of the Subsystem.                               | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Diagnosis Package   | | Contains software Components necessary to implement       | | Supervisor,       |
  | |                     | | diagnosis functions when required.  This may involve      | | Controller,       |
  | |                     | | the development of special control or operation modes.    | | Pipeline,         |
  | |                     | |                                                           | | Sequence          |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Calibration Package | | Contains software Components necessary for the            | | Supervisor,       |
  | |                     | | calibration and characterization of hardware Devices.     | | Controller,       |
  | |                     | | This may include the development of special control       | | Pipeline,         |
  | |                     | | or operation modes.                                       | | Sequence          |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Data Processing     | | Contains software Components necessary for the            | | Supervisor,       |
  | | Package             | | calibration and processing of science and WFS detectors.  | | Pipeline          |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Visualization       | | Contains software Components that provide custom          | | Panel,            |
  | | Package             | | visualizations necessary for the efficient operation      | | Widget,           |
  | |                     | | of a given Subsystem (e.g., M1 global status Panel).      | |                   |
  | |                     | | Note that default engineering Panels are available as     | |                   |
  | |                     | | part of the Engineering UI service.                       | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Observing Tool      | | Observing Tool (OT) components provide instrument         | | Panel,            |
  | | Plugin Package      | | specific editors that integrate with the GMT              | | Widget,           |
  | |                     | | Observing Tools to facilitate the specification of        | | Pipeline          |
  | |                     | | instrument specific observation parameters.               | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Safety Package      | | Contains software/hardware Components that implement      | | Supervisor,       |
  | |                     | | Subsystem specific safety functions.  These Components    | | Controller        |
  | |                     | | often interface with the ISS, but are independent         | |                   |
  | |                     | | (e.g., M1 safety controller).                             | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Operation Workflows | | Contains Components that allow the automation of high-    | | Workflow          |
  | | Package             | | level operation workflows relative to the Subsystem       | |                   |
  | |                     | | (e.g., unit test workflow, or calibration workflow in     | |                   |
  | |                     | | case that several sequences and human operations are      | |                   |
  | |                     | | involved).                                                | |                   |
  +-----------------------+-------------------------------------------------------------+---------------------+
  | | Management Package  | | Contains Components that capture the development          | | Plan,             |
  | |                     | | backlog and the Assembly Integration and Testing plans.   | | Workflow          |
  +-----------------------+-------------------------------------------------------------+---------------------+


The OSP shall interface with the following GCS system functions:

  * Visualization
  * Sequencing
  * Operation workflows
  * Calibration
  * Diagnosis
  * Data processing
  * Quality monitoring
  * Safety (through interface ISS)
