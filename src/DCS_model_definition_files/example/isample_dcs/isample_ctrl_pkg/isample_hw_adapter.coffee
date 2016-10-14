
Controller     'isample_hw_adapter',
    info:      'isample Hw Adapter'
    desc:      'This component defines the interface with the isample Actuators and Sensors'
    abstract:  false
    extends:   ['EthercatAdapter']

    input_ports:
        ecat_bus:              { type: 'ecat_bus_config',           protocol: 'pull', rate: 1, desc: 'ethercat bus configuration' }
        operator_leds:         { type: 'isample_hmi_leds',          protocol: 'pull', rate: 1, desc: 'Human Machine Interface (HMI) digital outputs' }
        focus_motor_control:   { type: 'isample_motor_control',     protocol: 'pull', rate: 1, desc: 'motor control' }
        fw1_motor_control:     { type: 'isample_motor_control',     protocol: 'pull', rate: 1, desc: 'motor control' }
        fw2_motor_control:     { type: 'isample_motor_control',     protocol: 'pull', rate: 1, desc: 'motor control' }
        sdo_in:                { type: 'isample_sdo_data',          protocol: 'pull', rate: 1, desc: 'sdo set config values' }

    output_ports:
        operator_buttons:      { type: 'isample_hmi_buttons',       protocol: 'push', rate: 1, desc: 'Human Machine Interface (HMI) digital inputs' }
        cryo_internal_temp:    { type: 'isample_temp_measurements', protocol: 'push', rate: 1, desc: 'temperature measurements' }
        cryo_external_temp:    { type: 'isample_temp_measurements', protocol: 'push', rate: 1, desc: 'temperature measurements' }
        focus_motor_status:    { type: 'isample_motor_status',      protocol: 'push', rate: 1, desc: 'motor state' }
        fw1_motor_status:      { type: 'isample_motor_status',      protocol: 'push', rate: 1, desc: 'motor state' }
        fw2_motor_status:      { type: 'isample_motor_status',      protocol: 'push', rate: 1, desc: 'motor state' }
        sdo_out:               { type: 'isample_sdo_data',          protocol: 'push', rate: 1, desc: 'sdo get configured values' }

    data_object_map: [

        # input ports / rx_pdos
        { data_object: "pilot",                    port: "operator_leds",       field: "pilot" }
        { data_object: "emergency_light",          port: "operator_leds",       field: "emergency_light" }
        { data_object: "heartbeat",                port: "operator_leds",       field: "hearbeat" }
        { data_object: "counter",                  port: "operator_leds",       field: "counter" }

        { data_object: "focus_enable",             port: "focus_motor_control", field: "enable" }
        { data_object: "focus_reset",              port: "focus_motor_control", field: "reset" }
        { data_object: "focus_velocity",           port: "focus_motor_control", field: "velocity" }

        { data_object: "fw1_enable",               port: "fw1_motor_control",   field: "enable" }
        { data_object: "fw1_reset",                port: "fw1_motor_control",   field: "reset" }
        { data_object: "fw1_velocity",             port: "fw1_motor_control",   field: "velocity" }

        { data_object: "fw2_enable",               port: "fw2_motor_control",   field: "enable" }
        { data_object: "fw2_reset",                port: "fw2_motor_control",   field: "reset" }
        { data_object: "fw2_velocity",             port: "fw2_motor_control",   field: "velocity" }

        { data_object: "sensor_type_1",            port: "sdo_in",              field: "sensor_type_1" }
        { data_object: "sensor_type_2",            port: "sdo_in",              field: "sensor_type_2" }

        # ouput ports / tx_pdos
        { data_object: "red_push_button",          port: "operator_buttons",    field: "red_push_button" }
        { data_object: "green_push_button",        port: "operator_buttons",    field: "green_push_button" }
        { data_object: "emergency_button",         port: "operator_buttons",    field: "emergency_button" }

        { data_object: "temp_sensor1",             port: "cryo_internal_temp",  field: "temp_sensor1" }
        { data_object: "temp_sensor2",             port: "cryo_internal_temp",  field: "temp_sensor2" }

        { data_object: "temp_sensor3",             port: "cryo_external_temp",  field: "temp_sensor1" }
        { data_object: "temp_sensor4",             port: "cryo_external_temp",  field: "temp_sensor2" }

        { data_object: "focus_ready",              port: "focus_motor_status", field: "ready" }
        { data_object: "focus_enabled",            port: "focus_motor_status", field: "enabled" }
        { data_object: "focus_warning",            port: "focus_motor_status", field: "warning" }
        { data_object: "focus_error",              port: "focus_motor_status", field: "error" }
        { data_object: "focus_moving_positive",    port: "focus_motor_status", field: "moving_positive" }
        { data_object: "focus_moving_negative",    port: "focus_motor_status", field: "moving_negative" }

        { data_object: "fw1_ready",                port: "fw1_motor_status",   field: "ready" }
        { data_object: "fw1_enabled",              port: "fw1_motor_status",   field: "enabled" }
        { data_object: "fw1_warning",              port: "fw1_motor_status",   field: "warning" }
        { data_object: "fw1_error",                port: "fw1_motor_status",   field: "error" }
        { data_object: "fw1_moving_positive",      port: "fw1_motor_status",   field: "moving_positive" }
        { data_object: "fw1_moving_negative",      port: "fw1_motor_status",   field: "moving_negative" }

        { data_object: "fw2_ready",                port: "fw2_motor_status",   field: "ready" }
        { data_object: "fw2_enabled",              port: "fw2_motor_status",   field: "enabled" }
        { data_object: "fw2_warning",              port: "fw2_motor_status",   field: "warning" }
        { data_object: "fw2_error",                port: "fw2_motor_status",   field: "error" }
        { data_object: "fw2_moving_positive",      port: "fw2_motor_status",   field: "moving_positive" }
        { data_object: "fw2_moving_negative",      port: "fw2_motor_status",   field: "moving_negative" }

        # sdos
        { data_object: "sensor_type_1",            port: "sdo_out",             field: "sensor_type_1" }
        { data_object: "sensor_type_2",            port: "sdo_out",             field: "sensor_type_2" }
    ]

    instance_configurations: ['isample_hw_adapter']

