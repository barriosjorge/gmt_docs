--------------------------------------
Installation and release configuration
--------------------------------------

Installation
------------
 download RPMs, etc

Release configuration
----------------------

 The RPM distribution does not require these environments. In fact, GMT_ROOT should not be defined
 (or set to '') to use the RPM system distribution.

 Once installed some customization is required depending on the machine running.
 Edit and source the bash profile file `etc/gmt_env_vars`.

Services configuration
----------------------

 Currently we use only one unique server per service. Each server is a distributed component with the following ports:

 - one port to receive data (logs, monitored values, etc) from external distributed components
 - one port to publish data to subscribers
 - one port to receive queries and send answers from/to clients
 - one local connection to the database server

 Also, each service as an internal rate to perform periodic checks or other tasks.
 The following files need to be customized for you application in `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/obs_srv/log_sys/log_service.cson`

 ```
 server_1:
     name      : 'LogServer_1'
     rate      : 600000                                   # periodic loop rate to perform checks, stats, etc.
     url       : 'tcp://127.0.0.1:9998'                   # to receive log messages from components
     pub_url   : 'tcp://127.0.0.1:9995'                   # to publish logs to subscribers
     query_url : 'tcp://127.0.0.1:9994'                   # to receive querys from clients
     db_url    : 'mongodb://127.0.0.1:27017/gmt_test_logs_1' # db to store log messages

 ```

 Note: The pub_url value shall be the same used in the GMT_LOG_URL environment var.
 This variable is only required for the C++ components in
 `${GMT_ROOT}/var/lib/gmt/cson/runtime/db/config/obs_srv/telemetry_sys/telemetry_service.cson`

 ```
 server_1:
     name          : 'TelemetryServer_1'
     rate          : 600000                                           # periodic loop rate to perform checks, stats, etc.
     url           : 'tcp://127.0.0.1:9997'                        # to receive monitored values from components
     pub_url       : 'tcp://127.0.0.1:9993'                        # to publish monitors to subscribers
     query_url     : 'tcp://127.0.0.1:9992'                        # to receive queries from clients
     db_url        : 'mongodb://127.0.0.1:27017/gmt_test_telemetry_1' # db to store monitors
 ```

Databases and logs
------------------

 The Data Archive uses mongoDB as backend data base. Each service keeps and independent database.

 Each service daemon stores out and error messages on `$GMT_ROOT/var/log`
 Please check these files if services failed to start or an error is shown while checking their status

Firewall and network ports
---------------------------

 The GMT software is networked system. The following instructions assume that the used ports are open for tcp/udp communications.
 With root/admin permissions it's possible to disable the whole firewall or specific ports can be open like this:

     sudo firewall-cmd --add-port=$PORT/tcp --permanent --zone=public
     sudo firewall-cmd --add-port=$PORT/udp --permanent --zone=public

URIs and URLs
-------------

 GMT Components use an unique URI in the following scheme

    gmt://subsystem/component:port

 The port number is used to send the component setup (rates, ports, etc).
 Example:

     gmt://examples/basic_controller:8001

 GMT Ports have an url using the nanomsg scheme

    transport://host:net_port

 Example:

     tcp://127.0.0.1:9001
