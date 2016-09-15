

.. table:: Operation Support Packages


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
