
FieldBus "isample_ctrl_fb",
    info:    "Main isample EtherCAT bus"
    desc:    "Main isample EtherCAT bus"

    masters: [                          # TODO Only one master per etherCAT fieldbus
            { id: 0, rate: 1000 }
    ]

    domains: [
        { id: 0, master: 0,   rate: 1    }
        { id: 1, master: 0,   rate: 1000 }
    ]

    modules: [
        { name: "coupler",     position: 0, type: "EK1100-11" }
        { name: "dig_inp",     position: 1, type: "EL1008-11" }
        { name: "dig_out",     position: 2, type: "EL2008-11" }
        { name: "ana_inp",     position: 3, type: "EL3002-14" }
        { name: "pt100",       position: 4, type: "EL3202-13" }
        { name: "ana_out",     position: 5, type: "EL4032-11" }
        { name: "focus_motor", position: 6, type: "EL7041-17" }
        { name: "fw1_motor",   position: 7, type: "EL7041-17" }
        { name: "fw2_motor",   position: 8, type: "EL7041-17" }
    ]

    data_objects: [
        { name: "red_push_button",         type: "tx_pdo", label: "RED Push Button",   std_name: "Channel 1 : Input",                       module: 1, domain: 0 }
        { name: "green_push_button",       type: "tx_pdo", label: "GREEN Push Button", std_name: "Channel 2 : Input",                       module: 1, domain: 0 }
        { name: "emergency_button",        type: "tx_pdo", label: "Emergency Button",  std_name: "Channel 3 : Input",                       module: 1, domain: 0 }

        { name: "temp_sensor1",            type: "tx_pdo", label: "Temperature #1",    std_name: "RTD Inputs Channel 1 : Value",            module: 4, domain: 1 }
        { name: "temp_sensor2",            type: "tx_pdo", label: "Temperature #2",    std_name: "RTD Inputs Channel 2 : Value",            module: 4, domain: 0 }
        { name: "temp_sensor3",            type: "tx_pdo", label: "Temperature #1",    std_name: "RTD Inputs Channel 1 : Value",            module: 4, domain: 1 }
        { name: "temp_sensor4",            type: "tx_pdo", label: "Temperature #2",    std_name: "RTD Inputs Channel 2 : Value",            module: 4, domain: 0 }

        { name: "focus_ready",             type: "tx_pdo", label: "Axis Ready",        std_name: "STM Status : Status__Ready to enable",    module: 6, domain: 0 }
        { name: "focus_enabled",           type: "tx_pdo", label: "Axis Enabled",      std_name: "STM Status : Status__Ready",              module: 6, domain: 0 }
        { name: "focus_warning",           type: "tx_pdo", label: "Axis Warning",      std_name: "STM Status : Status__Warning",            module: 6, domain: 0 }
        { name: "focus_focus_error",       type: "tx_pdo", label: "Axis Error",        std_name: "STM Status : Status__Error",              module: 6, domain: 0 }
        { name: "focus_moving_positive",   type: "tx_pdo", label: "Axis Moving +",     std_name: "STM Status : Status__Moving positive",    module: 6, domain: 0 }
        { name: "focus_moving_negative",   type: "tx_pdo", label: "Axis Moving -",     std_name: "STM Status : Status__Moving negative",    module: 6, domain: 0 }

        { name: "fw1_ready",               type: "tx_pdo", label: "Axis Ready",        std_name: "STM Status : Status__Ready to enable",    module: 6, domain: 0 }
        { name: "fw1_enabled",             type: "tx_pdo", label: "Axis Enabled",      std_name: "STM Status : Status__Ready",              module: 6, domain: 0 }
        { name: "fw1_warning",             type: "tx_pdo", label: "Axis Warning",      std_name: "STM Status : Status__Warning",            module: 6, domain: 0 }
        { name: "fw1_focus_error",         type: "tx_pdo", label: "Axis Error",        std_name: "STM Status : Status__Error",              module: 6, domain: 0 }
        { name: "fw1_moving_positive",     type: "tx_pdo", label: "Axis Moving +",     std_name: "STM Status : Status__Moving positive",    module: 6, domain: 0 }
        { name: "fw1_moving_negative",     type: "tx_pdo", label: "Axis Moving -",     std_name: "STM Status : Status__Moving negative",    module: 6, domain: 0 }

        { name: "fw2_ready",               type: "tx_pdo", label: "Axis Ready",        std_name: "STM Status : Status__Ready to enable",    module: 6, domain: 0 }
        { name: "fw2_enabled",             type: "tx_pdo", label: "Axis Enabled",      std_name: "STM Status : Status__Ready",              module: 6, domain: 0 }
        { name: "fw2_warning",             type: "tx_pdo", label: "Axis Warning",      std_name: "STM Status : Status__Warning",            module: 6, domain: 0 }
        { name: "fw2_focus_error",         type: "tx_pdo", label: "Axis Error",        std_name: "STM Status : Status__Error",              module: 6, domain: 0 }
        { name: "fw2_moving_positive",     type: "tx_pdo", label: "Axis Moving +",     std_name: "STM Status : Status__Moving positive",    module: 6, domain: 0 }
        { name: "fw2_moving_negative",     type: "tx_pdo", label: "Axis Moving -",     std_name: "STM Status : Status__Moving negative",    module: 6, domain: 0 }

        { name: "pilot",                   type: "rx_pdo", label: "Pilot Light",       std_name: "Channel 1 : Output",                        module: 2, domain: 0 }
        { name: "emergency_light",         type: "rx_pdo", label: "Emergency Light",   std_name: "Channel 2 : Output",                        module: 2, domain: 0 }
        { name: "heartbeat",               type: "rx_pdo", label: "Heartbeat",         std_name: "Channel 5 : Output",                        module: 2, domain: 0 }
        { name: "counter",                 type: "rx_pdo", label: "Heartbeat",         std_name: "Channel 5 : Output",                        module: 2, domain: 0, index: 0x7080, subindex: 0x01, bit: 0}

        { name: "focus_enable",            type: "rx_pdo", label: "Axis Enable",       std_name: "STM Control : Control__Enable",             module: 6, domain: 0 }
        { name: "focus_reset",             type: "rx_pdo", label: "Axis Reset",        std_name: "STM Control : Control__Reset",              module: 6, domain: 0 }
        { name: "focus_velocity",          type: "rx_pdo", label: "Velocity",          std_name: "STM Velocity : Velocity",                   module: 6, domain: 0 }

        { name: "fw1_enable",              type: "rx_pdo", label: "Axis Enable",       std_name: "STM Control : Control__Enable",             module: 6, domain: 0 }
        { name: "fw1_reset",               type: "rx_pdo", label: "Axis Reset",        std_name: "STM Control : Control__Reset",              module: 6, domain: 0 }
        { name: "fw1_velocity",            type: "rx_pdo", label: "Velocity",          std_name: "STM Velocity : Velocity",                   module: 6, domain: 0 }

        { name: "focus_enable",            type: "rx_pdo", label: "Axis Enable",       std_name: "STM Control : Control__Enable",             module: 6, domain: 0 }
        { name: "focus_reset",             type: "rx_pdo", label: "Axis Reset",        std_name: "STM Control : Control__Reset",              module: 6, domain: 0 }
        { name: "focus_velocity",          type: "rx_pdo", label: "Velocity",          std_name: "STM Velocity : Velocity",                   module: 6, domain: 0 }

        { name: "sensor_type_1",           type: "sdo",     label: "Sensor type #1",   std_name: "RTD Settings Ch.1 : Connection technology", module: 4, domain: 0, default: 1 }
        { name: "sensor_type_2",           type: "sdo",     label: "Sensor type #2",   std_name: "RTD Settings Ch.2 : Connection technology", module: 4, domain: 0, default: 3 }
    ]


