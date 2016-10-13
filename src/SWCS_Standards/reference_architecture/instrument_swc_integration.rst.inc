
.. _dcs-instrument_swcs_integration:

Instrument Software and Controls Integration
--------------------------------------------

The GMT instruments software and controls follow the same architectural design
as other device control subsystems. Typically an Instrument Device Control
Subsystem will include most of the packages described in the :ref:`Figure on DCS
context <figure-dcs_context>` and will be developed following the standards and
rules described in this document. The operation of instrument, telescope and
adaptive optics DCSs will be coordinated by the GCS Core Systems (e.g. as
operation sequences executed by the Sequencer) in order to execute automated
observation or calibration operations. The IDCS data pipeline packages are
integrated in the GCS Core Systems (i.e. in the OPS Data Processing System) so
quick look and data products management is operated in a uniform way across the
observatory. Analogously instrument specific user interface panels and observing
tools are integrated in the OPS to ensure consistent and seamless implementation
of observatory workflows.

