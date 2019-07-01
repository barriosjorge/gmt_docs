.. _grs_guide:

grs documentation
=================

Introduction
------------

This document describes the use of the *grs* tool.

The grs command line tool
-------------------------

The grs utility allows interacting and communicating with running components.

  .. code-block:: bash

   $ grs --help

    grs [command]

    Commands:
    grs send [instance]         Send a message to the port of the instance   [aliases: push]
    grs listen [instance]       Listen to messages from the port of the instance
    grs compile [instance]      Compile the configuration of an instance. Compiled files are
                                saved in $GMT_LOCAL
    grs send_config [instance]  Send configuration to the instance
    grs info [instance]         displays configuration information for a given instance
    grs get [instance]          displays the value of a feature of a remote Component instance
    grs set [instance]          Sets the value of a feature in a remote Component instance
    grs inspect [instance]      scans the values of all the features of a remote Component
                                instance

    Options:
    --version    Show version number                                                    [boolean]
    --name       name of the configurable entity                   [string] [default: "grs_6259"]
    --scope      scope to load the configuration file                      [string] [default: ""]
    --config     name of the component configuration to be applied  [string] [default: "default"]
    --auto_conf  load the configuration from file if it exists          [boolean] [default: true]
    --logging    logging level                                         [string] [default: "info"]
    --help       Show help                                                              [boolean]

    Examples:
    grs send mount_azt_ctrl -p config_in -m Hi

    For more information, find our manual at https://gmto.github.io/gmt_docs/


grs send
........

**Description**

The ``send`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs send --help

    grs send [instance]

    Send a message to the port of the instance

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_6369"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --delay, -d     Delay between messages                             [number] [default: 1]
    --port, -p      name of the port                                                [string]
    --url, -u       url of the port                                                 [string]
    --msg, -m       message(s) to be send                                            [array]
    --file, -f      Name of the file to send                                        [string]
    --repeats, -r   Number of times the message is send                [number] [default: 1]
    --conf, -c      name of the configuration                  [string] [default: "default"]



grs listen
..........

**Description**

The ``listen`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs listen --help

    grs listen [instance]

    Listen to messages from the port of the instance

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_6365"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --port, -p      name of the port                        [string] [default: "sd_rep_out"]
    --url, -u       url of the port                                                 [string]
    --conf, -c      name of the configuration                  [string] [default: "default"]


**Options**

``-o, --override``
   If the command is run more than once, this flag will write over the existing files

``-p, --preserve``
   If the command is run more than once, this flag will preserve a copy of the existing
   files with the extension *.as_is*

``-h, --help``
   Display the help message



grs compile
...........

**Description**

The ``compile`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs compile --help

    grs compile [instance]

    Compile the configuration of an instance. Compiled files are saved in $GMT_LOCAL

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_6371"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --conf, -c      name of the configuration                  [string] [default: "default"]




grs info
........

**Description**

The ``info`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs info --help

    grs info [instance]

    displays configuration information for a given instance

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_7074"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --conf, -c      name of the configuration                  [string] [default: "default"]


grs get
.......

**Description**

The ``get`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs get --help

    grs get [instance]

    displays the value of a feature of a remote Component instance

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_7076"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --conf, -c      name of the configuration                  [string] [default: "default"]
    --feature, -f   name of the feature                                             [string]
    --slice, -s     name of the attribute to slice the collection                   [string]

grs set
.......

**Description**

The ``set`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs set --help

    grs set [instance]

    Sets the value of a feature in a remote Component instance

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_7077"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --conf, -c      name of the configuration                  [string] [default: "default"]
    --feature, -f   name of the feature                                             [string]
    --value, -v     New value                                                        [array]


grs inspect
...........

**Description**

The ``inspect`` command listens to messages from an running component instance

  .. code-block:: bash

   $ grs inspect --help

    grs inspect [instance]

    scans the values of all the features of a remote Component instance

    Options:
    --version       Show version number                                            [boolean]
    --name          name of the configurable entity           [string] [default: "grs_7078"]
    --scope         scope to load the configuration file              [string] [default: ""]
    --config        name of the component configuration to be applied
                                                                [string] [default: "default"]
    --auto_conf     load the configuration from file if it exists  [boolean] [default: true]
    --logging       logging level                                 [string] [default: "info"]
    --help          Show help                                                      [boolean]
    --instance, -i  name of the instance                                            [string]
    --feature, -f   name of the feature                                             [string]
    --rate, -r      Scan rate, 0 = 1 shot                             [number] [default: 10]
    --conf, -c      name of the configuration                  [string] [default: "default"]
