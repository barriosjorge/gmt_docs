------------------
Using the Services (TBR)
------------------

Start Services
--------------

MongoDB runs as a system service under *systemd*.

.. code-block:: bash

  > sudo systemctl enable mongod
  > sudo systemctl [status|start|restart|stop] mongod


The other services can be started, stopped or checked independently as follows:

.. code-block:: bash

  > log_service start
  > log_service status
  > telemetry_service start
  > telemetry_service status


Check the Log Service
---------------------

In order to check if the basic communication is working the following test can be performed.
In one unix terminal run the log client as:

  *Usage:*  ``log_client [topic]``

The log_client will show log messages on screen. A different color is used for each message type.
By default the log client will subscribe to all log messages. If a topic is included in the command line it will filter the content of the messages and only the messages containing the topic will be shown.:

  *Usage:*  ``test_log [message]``

This simple test will send 4 messages (debug, info, warning, error) to the logging service with the text passed as a parameter.

In order to see if messages are stored a log query can be performed as follows:

  *Usage:*  ``log_query uri num``

For example, the following will show the last 10 messages (from newest to oldest) created by the log_test

.. code-block:: bash

  > log_query gmt://tools/log_adapter 10

All queries have to be done on the exact uri of the component. More queries will be provided in future releases.

It's also possible to explore the log messages stored in the database using the 'mongo' command line tool.
