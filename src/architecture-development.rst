
Development
-----------

From a development standpoint, the software architecture has the following
hierarchy.  The application layer residing at the top contains services and
tools that run the observatory (via services and operations), telescope control
system (TCS), and the instrument control system (ICS).  Below the application
layer are frameworks, packages, and the operating system on which the
applications depend or build.

.. image:: _static/layered-architecture.png
  :align: center
  :scale: 70%
  :alt: Software Layered Architecture

