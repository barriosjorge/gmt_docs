

.. _specification-logging_service:

.. code-block:: coffeescript

     # Logging Event Specification

     EnumType "LogLevel",

         desc: "The log methods expect a log level, which can be used to filter
               log messages when they are retrieved. Levels follow OSGi Log Service
               Specification."

         literals:
             LOG_DEBUG:   "Used for problem determination and may be irrelevant to anyone but
                          the Component developer."
             LOG_ERROR:   "Indicates the component may not be functional. Action should be
                          taken to correct this situation."
             LOG_INFO:    "May be the result of any change in the component and does not
                          indicate problem."
             LOG_WARNING: "Indicates a component is still functioning but may experience
                          problems in the future because a warning condition"

         StructType "LogEvent",
             extends: []
             abstract: false
             desc: "Time stamped Log event"
             elements:
                 value:
                     type: "string"
                     desc: "Text message with additional information related to the alarm event occurrence"
                 timestamp:
                     type: "TimeStamp"
                     desc: "Time of the creation of the log message"
                 level:
                     type: "LogLevel"
                     desc: "Level of the log event"
                 source:
                     type: "string"
                     desc: "URI of the component that has issue the log message"
