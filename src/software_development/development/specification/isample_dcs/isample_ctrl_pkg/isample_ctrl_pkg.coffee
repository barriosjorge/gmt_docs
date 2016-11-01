
Package 'isample_ctrl_pkg',
    info: 'isample Controller Package'
    desc: 'isample Controller Package'

    applications:
        main: { desc: "Main isample Controller package application" }

    connectors: [
        { id: 8001, from: { element: "isample_hw_adapter", port: "cryo_internal_temp"}, to: { element: "isample_cryo_internal_temp_ctrl", port: "temperatures"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8002, from: { element: "isample_hw_adapter", port: "cryo_external_temp"}, to: { element: "isample_cryo_external_temp_ctrl", port: "temperatures"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8003, from: { element: "isample_hw_adapter", port: "operator_buttons"},   to: { element: "isample_focus_ctrl",              port: "hmi_inputs"},          max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8004, from: { element: "isample_hw_adapter", port: "focus_motor_status"}, to: { element: "isample_focus_ctrl",              port: "motor_state"},         max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8005, from: { element: "isample_hw_adapter", port: "fw1_motor_status"},   to: { element: "isample_fw1_ctrl",                port: "motor_state"},         max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8006, from: { element: "isample_hw_adapter", port: "fw2_motor_status"},   to: { element: "isample_fw2_ctrl",                port: "motor_state"},         max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }

        { id: 8007, from: { element: "isample_focus_ctrl", port: "hmi_outputs"},        to: { element: "isample_hw_adapter",              port: "operator_leds"},       max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8008, from: { element: "isample_focus_ctrl", port: "motor_ctrl"},         to: { element: "isample_hw_adapter",              port: "focus_motor_control"}, max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8009, from: { element: "isample_fw1_ctrl",   port: "motor_ctrl"},         to: { element: "isample_hw_adapter",              port: "fw1_motor_control"},   max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8010, from: { element: "isample_fw2_ctrl",   port: "motor_ctrl"},         to: { element: "isample_hw_adapter",              port: "fw2_motor_control"},   max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }

        { id: 8011, from: { element: "isample_hw_adapter", port: "heartbeat_out"},      to: { element: "isample_ctrl_super",              port: "heartbeat_in"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8011, from: { element: "isample_focus_ctrl", port: "heartbeat_out"},      to: { element: "isample_ctrl_super",              port: "heartbeat_in"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8011, from: { element: "isample_fw1_ctrl",   port: "heartbeat_out"},      to: { element: "isample_ctrl_super",              port: "heartbeat_in"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8011, from: { element: "isample_fw2_ctrl",   port: "heartbeat_out"},      to: { element: "isample_ctrl_super",              port: "heartbeat_in"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
    ]

