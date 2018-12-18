UI Framework
============

.. note::
    The UI framework is currently only supported on MacOS.  Linux support will be available in future releases.

The UI Framework introduces a set of libraries and a windowed application that provides a GUI for the OCS.  The framework handles three primary concerns

* Rendering (drawing) elements to the screen (DOM) 
* Library of re-usable UI components that can be shared across the project
* An App that provides an interface to the OCS

Engineering App
---------------

The engineering application provides a GUI to the OCS model.  It is launched via the command line and it will spawn an OS window that renders the UI.

The UI engineering app uses your local bundles from ``$GMT_LOCAL/etc/bundles`` and allows you to see a visual representation of your model files' input/output ports.  For now, the Engineering app needs to run in MacOS or a Linux Desktop. 

To launch the application, run this in the command line

.. code-block:: bash

    $ navigator

This will launch the GUI as a child process of the CLI application.  To stop the GUI, stop the CLI app with ``CTRL + C``.

Launching Custom panels
^^^^^^^^^^^^^^^^^^^^^^^

The ``navigator`` application can also launch custom panels that are defined in a DCS' `*_vis_pkg` folders.  When defined, it's possible to launch standalone panels with the following parameters

.. code-block:: bash

    $ navigator --panel emf_custom_weather_view --port 9098

The ``--panel`` flag specifies an exported panel in some vis package.  The ``--port`` flag is currently required to avoid port collisions (for now).

The engineering app reserves port ``9199``.  Custom panel launches of the application need to specify a different port for each instance.

Troubleshooting
^^^^^^^^^^^^^^^

Refreshing the UI: in some case if the UI becomes unresponsive, press `CMD+R` to refresh.
