
.. _specification-alarm_service:

.. code-block:: coffeescript

    # Alarm Event Specification

    EnumType "AlarmSeverity",
        desc: "Defines the severity level of the AlarmEvent"
        literals:
            ALARM_A: ""

    StructType "AlarmEvent",
        extends: []
        abstract: false
        desc: "Time stamped Alarm Event"
        elements:
            id:
                type: "string"
                desc: "Alarm ID. Allows associating the alarm with the Alarm description"
            value:
                type: "string"
                desc: "Text message with additional information related to the alarm event occurrence"
            timestamp:
                type: "TimeStamp"
                desc: "Trigger time of the alarm event"
            severity:
                type: "AlarmSeverity"
                desc: "Level of severity of the alarm event"
            source:
                type: "string"
                desc: "URI of the component that has detect the alarm condition"

