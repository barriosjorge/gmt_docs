fs = require 'fs'

#Create a m2m plugin with transformations for StructType, Configuration and Enum

StructType "isample_hmi_buttons",
    desc: "digital inputs corresponding to pressed buttons"
    elements:   # Change name
        red_push_button:   { desc: "RED Push Button",       type: "bool",     units: "" }
        green_push_button: { desc: "GREEN Push Button",     type: "bool",     units: "" }
        emergency_button:  { desc: "Emergency Button",      type: "bool",     units: "" }

StructType "isample_temp_measurements",
    desc: "temperature measurements",
    elements:
        temp_sensor1:      { desc: "temperature sensor #1", type: "uint16_t", units: "celsius" }
        temp_sensor2:      { desc: "temperature sensor #2", type: "uint16_t", units: "celsius" }
        press_sensor1:     { desc: "pressure sensor    #1", type: "uint16_t", units: "bar" }

StructType "isample_motor_status",
    desc: "status of motor device"
    elements:
        ready:             { desc: "Axis Ready",            type: "bool",     units: "" }
        enabled:           { desc: "Axis Enabled",          type: "bool",     units: "" }
        warning:           { desc: "Axis Warning",          type: "bool",     units: "" }
        error:             { desc: "Axis Error",            type: "bool",     units: "" }
        moving_positive:   { desc: "Axis Moving +",         type: "bool",     units: "" }
        moving_negative:   { desc: "Axis Moving -",         type: "bool",     units: "" }

StructType "isample_hmi_leds",
    desc:  "digital outputs to control lights"
    elements:
        pilot:             { desc: "Pilot Light",           type: "bool",     units: "on/off" }
        emergency_light:   { desc: "Emergency Light",       type: "bool",     units: "on/off" }
        heartbeat:         { desc: "Heartbeat",             type: "bool",     units: "0/1"    }
        counter:           { desc: "Counter",               type: "uint8_t",  units: "counts" }

StructType "isample_motor_control",
    desc:  "motor control"
    elements:
        enable:            { desc: "Axis Enable",           type: "bool",     units: "" }
        reset:             { desc: "Axis Reset",            type: "bool",     units: "" }
        velocity:          { desc: "Velocity",              type: "int16_t",  units: "steps/s2" }

StructType "isample_sdo_data",
    desc: "service data objects",
    elements:
        sensor_type_1:     { desc: "sensor #1 tech",        type: "uint16_t", units: "" }
        sensor_type_2:     { desc: "sensor #2 tech",        type: "uint16_t", units: "" }

