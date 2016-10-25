fs = require 'fs'

# TODO Update to DCS

Subsystem 'isample_dcs',
    info: 'Hardware Developer Kit Control System'
    desc: fs.readFileSync __dirname + '/isample_dcs.rst', 'utf8'

    connectors: [
        { id: 8101, from: { element: "isample_ctrl_super", port: "heartbeat"}, to: { element: "isample_dcs_super", port: "heartbeat"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_vis_super",  port: "heartbeat"}, to: { element: "isample_dcs_super", port: "heartbeat"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_cal_super",  port: "heartbeat"}, to: { element: "isample_dcs_super", port: "heartbeat"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_seq_super",  port: "heartbeat"}, to: { element: "isample_dcs_super", port: "heartbeat"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_diag_super", port: "heartbeat"}, to: { element: "isample_dcs_super", port: "heartbeat"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
    ]

    port_types:
        hmi_buttons:
            desc: "digital inputs corresponding to pressed buttons"
            types:   # Change name
                red_push_button:   { desc: "RED Push Button",       type: "bool",     units: "" }
                green_push_button: { desc: "GREEN Push Button",     type: "bool",     units: "" }
                emergency_button:  { desc: "Emergency Button",      type: "bool",     units: "" }

        temp_measurements:
            desc: "temperature measurements",
            types:
                temp_sensor1:      { desc: "temperature sensor #1", type: "uint16_t", units: "celsius" }
                temp_sensor2:      { desc: "temperature sensor #2", type: "uint16_t", units: "celsius" }
                press_sensor1:     { desc: "pressure sensor    #1", type: "uint16_t", units: "bar" }

        motor_status:
            desc: "status of motor device"
            types:
                ready:             { desc: "Axis Ready",            type: "bool",     units: "" }
                enabled:           { desc: "Axis Enabled",          type: "bool",     units: "" }
                warning:           { desc: "Axis Warning",          type: "bool",     units: "" }
                error:             { desc: "Axis Error",            type: "bool",     units: "" }
                moving_positive:   { desc: "Axis Moving +",         type: "bool",     units: "" }
                moving_negative:   { desc: "Axis Moving -",         type: "bool",     units: "" }

        hmi_leds:
            desc:  "digital outputs to control lights"
            types:
                pilot:             { desc: "Pilot Light",           type: "bool",     units: "on/off" }
                emergency_light:   { desc: "Emergency Light",       type: "bool",     units: "on/off" }
                heartbeat:         { desc: "Heartbeat",             type: "bool",     units: "0/1"    }
                counter:           { desc: "Counter",               type: "uint8_t",  units: "counts" }

        motor_control:
            desc:  "motor control"
            types:
                enable:            { desc: "Axis Enable",           type: "bool",     units: "" }
                reset:             { desc: "Axis Reset",            type: "bool",     units: "" }
                velocity:          { desc: "Velocity",              type: "int16_t",  units: "steps/s2" }

        sdo_data:
            desc: "service data objects",
            types:
                sensor_type_1:     { desc: "sensor #1 tech",        type: "uint16_t", units: "" }
                sensor_type_2:     { desc: "sensor #2 tech",        type: "uint16_t", units: "" }


Package 'isample_vis_pkg',
    info: 'isample Visualization Package'
    desc: 'isample Visualization Package'

Package 'isample_seq_pkg',
    info: 'isample Sequencing Package'
    desc: 'isample Sequencing Package'

Package 'isample_diag_pkg',
    info: 'isample Diagnosis Package'
    desc: 'isample Diagnosis Package'

Package 'isample_cal_pkg',
    info: 'isample Calibration Package'
    desc: 'isample Calibration Package'

Package 'isample_wkf_pkg',
    info: 'isample Workflow Package'
    desc: 'isample Workflow Package'

Package 'isample_mngt_pkg',
    info: 'isample Management Package'
    desc: 'isample Management Package'
