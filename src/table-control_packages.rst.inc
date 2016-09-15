
.. _table-control_packages:

.. table:: Control Packages

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

