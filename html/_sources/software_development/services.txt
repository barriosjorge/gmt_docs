
Using the Services
==================

Starting and Stopping Services
------------------------------

The mongoDB daemon runs as a system service under *systemd*.

.. code-block:: bash

     $ sudo systemctl [enable|disable] mongod
     $ sudo systemctl [status|start|restart|stop] mongod


The other services can be started, stopped or checked independently as follows:

.. code-block:: bash

    $ log_service [start|stop|restart|status]
    $ telemetry_service [start|stop|restart|status]

Checking the Log Service
------------------------

In order to check if the simple communication is working the following test can be performed.

Open 2 unix terminals. We will call them terminal_1 and terminal_2.

In terminal_1 verify that the log_service is running:

.. code-block:: bash

    $ log_service status

If the status is not *online* then start the log service:

.. code-block:: bash

        $ log_service start

and check the status again. In case of error verify that the mongoDB service is started (see previous section).
If another error is shown please report this issue.

If the log service is started with no error we'll use terminal_1 to show the log messages that we'll create later.
We can run a log client with this command:

    *Usage:*  ``log_client [topic]``

If a *topic* parameter is included in the command line it will filter the content of the messages and only the messages containing the topic will be shown.
By default, if no parameter is given, the log client will subscribe to all log messages:

.. code-block:: bash

    $ log_client
    log client subscribed at port tcp://127.0.0.1:9995

This means that the log_client is waiting for new log messages without any specific topic. Let's produce some log messages.

In terminal_2 we can launch programs that produce log messages. A couple of simple programs can be used for such purpose.
The simplest test is this command:

    *Usage:*  ``test_log [message]``

This command will produce 4 log messages (DEBUG, INFO, WARNING, ERROR) with the text specified in the *message* parameter:
If the parameter *message* is not used the four messages will be empty.

.. code-block:: bash

    $ test_log "this a log service test"

After this command the log_client in terminal_1 should show something like this:

.. code-block:: bash

    $ log_client
    log client subscribed at port tcp://127.0.0.1:9995
    [DBG] 2016-01-01T00:24:32.769Z [gmt://tools/log_adapter] this a log service test
    [INF] 2016-01-01T00:24:32.769Z [gmt://tools/log_adapter] this a log service test
    [WRN] 2016-01-01T00:24:32.769Z [gmt://tools/log_adapter] this a log service test
    [ERR] 2016-01-01T00:24:32.769Z [gmt://tools/log_adapter] this a log service test

each message type using a different color. If messages are not shown please report the error.
To exit the log_client just use CTRL-C.

If the messages are shown you can do more tests filtering results using any topic:

.. code-block:: bash

    $ log_client instrument
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: instrument

If we send the following log messages from terminal_2:

.. code-block:: bash

    $ test_log "this another log service test"

then nothing should be shown in terminal_1, but if in terminal_2 we use:

.. code-block:: bash

    $ test_log "this a log message from the instrument"

the following should be shown in terminal_1:

.. code-block:: bash

    $ log_client instrument
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: instrument
    [DBG] 2016-01-01T00:24:32.770Z [gmt://tools/log_adapter] this a log message from the instrument
    [INF] 2016-01-01T00:24:32.770Z [gmt://tools/log_adapter] this a log message from the instrument
    [WRN] 2016-01-01T00:24:32.770Z [gmt://tools/log_adapter] this a log message from the instrument
    [ERR] 2016-01-01T00:24:32.770Z [gmt://tools/log_adapter] this a log message from the instrument

Multiple log clients can be started at the same time in different terminals and with different subscription topics.
Each client subscribes to the log service independently.

We can send more log messages using this command:

    *Usage:*  ``test_logs [number of messages] [thread_1 rate in ns] [thread_2 rate in ns]``

This test uses two threads to send independent log messages and each thread has a different rate.
For example, start the log_client as usual in terminal_1:

.. code-block:: bash

    $ log_client
    log client subscribed at port tcp://127.0.0.1:9995

and in terminal_2 use:

.. code-block:: bash

    $ test_logs 5 1000000 2000000

This will produce 5 x 2 threads x 4 types + 2 additional = 42 messages. The rates are 1 second and 2 seconds.

.. code-block:: bash

    $ log_client
    log client subscribed at port tcp://127.0.0.1:9995
    [DBG] 2016-09-01T23:11:16.167Z [thread_1] debug message num = 1
    [INF] 2016-09-01T23:11:16.167Z [thread_1] info message num = 1
    [WRN] 2016-09-01T23:11:16.167Z [thread_1] warning message num = 1
    [ERR] 2016-09-01T23:11:16.167Z [thread_1] error message num = 1
    [DBG] 2016-09-01T23:11:17.167Z [thread_2] debug message num = 1
    [INF] 2016-09-01T23:11:17.167Z [thread_2] info message num = 1
    [WRN] 2016-09-01T23:11:17.167Z [thread_2] warning message num = 1
    [ERR] 2016-09-01T23:11:17.167Z [thread_2] error message num = 1
    etc...

Much faster rates and a large number of messages can be used:

.. code-block:: bash

    $ test_logs 50000 1000 2000

In case messages are not shown please verify the following environment variables:

.. code-block:: bash

    export GMT_LOG_POLICY=1
    export GMT_LOG_URL=tcp://127.0.0.1:9998

Starting example components
---------------------------

The main use of the log service is inside the GMT components. To check the log service with the simple example components we can start them in terminal_2:

.. code-block:: bash

    $ run_example_components

and then in terminal_1 we can see:

.. code-block:: bash

    $ log_client
    log client subscribed at port tcp://127.0.0.1:9995
    [INF] 2016-09-01T23:34:00.157Z [gmt://examples/my_app:7000] app step num = 0
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_inc3:8003] x1 = 1
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_inc1:8001] x1 = 1
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_inc2:8002] x1 = 1
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_inc3:8003] x1 = 2
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_inc1:8001] x1 = 2
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_inc2:8002] x1 = 2
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:34:02.157Z [gmt://examples/my_app:7000] app step num = 1
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_inc3:8003] x1 = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_inc1:8001] x1 = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_inc2:8002] x1 = 3

Messages are produced periodically while the components are running. To kill the components just use CTRL-C in terminal_2.
If you have the process in background like this:

.. code-block:: bash

    $ run_example_components &

then the components will keep running and using the network ports so, if you run again the same command, some errors will be shown:

.. code-block:: bash

    ERROR: unable to connect Port <examples/my_app:setup> (tcp://0.0.0.0:7000) : Address already in use
    ERROR: unable to connect Port <examples/simple_component:setup> (tcp://0.0.0.0:8000) : Address already in use
    ERROR: unable to connect Port <examples/component_inc1:setup> (tcp://0.0.0.0:8001) : Address already in use
    ERROR: unable to connect Port <examples/component_inc2:setup> (tcp://0.0.0.0:8002) : Address already in use
    ERROR: unable to connect Port <examples/component_inc3:setup> (tcp://0.0.0.0:8003) : Address already in use
    ERROR: unable to connect Port <examples/component_sum1:setup> (tcp://0.0.0.0:8004) : Address already in use
    ERROR: unable to connect Port <examples/component_sum2:setup> (tcp://0.0.0.0:8005) : Address already in use

This means that the example components are already running and using the networks addresses.
To avoid this you need to kill the run_example_components process before to start a new one:

.. code-block:: bash

    $ ps -fea | grep run_example_components
    user     15209 31894  0 19:40 pts/0    00:00:00 run_example_components
    user     15365 31894  0 19:43 pts/0    00:00:00 grep --color=auto run_example_components

    $ kill -9 15209
    [1]-  Killed            run_example_components

We'll see this example in much more detail later.

Making a query to the Log Service
---------------------------------

The log service stores all received messages in a local database. In order to query this database the log service shall be started and then in any terminal we can use:

     *Usage:*  ``log_query uri num``

For example, the following will show the last 10 messages (from newest to oldest) created by the simple_component in the previous section:

.. code-block:: bash

    $ log_query gmt://examples/simple_component:8000 10
    starting log query at tcp://127.0.0.1:9994
    [INF] 2016-09-01T23:44:40.936Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:39.936Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:38.936Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:37.936Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:36.936Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:35.934Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:34.934Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:34.853Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:33.934Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:44:33.853Z [gmt://examples/simple_component:8000] hello, component world

All queries have to be done on the exact **URI** of the component that produces the messages. More queries will be provided in future releases.

It's also possible to explore the log messages stored in the database or manage the databases using the *mongo* command line tool. Please check the mongoDB documentation in this case.
