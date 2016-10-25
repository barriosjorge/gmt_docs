
Controller    'isample_focus_ctrl',
    info:     'isample focus Controller'
    desc:     'This component implements the control of the isample'
    extends:  ['BaseController']
    abstract: false

    state_vars:
        position:     { type: 'float', controllable: true, init: 20.0, max: 40.0, min: 5.0, desc: 'position sv' }

    input_ports:
        hmi_inputs:   { type: 'hmi_buttons',       protocol: 'pull', rate: 1, desc: 'HMI operation buttons' }
        motor_state:  { type: 'motor_status',      protocol: 'pull', rate: 1, desc: 'motor state' }

    output_ports:
        hmi_outputs:  { type: 'hmi_leds',          protocol: 'push', rate: 1, desc: 'digital outputs' }
        motor_ctrl:   { type: 'motor_control',     protocol: 'push', rate: 1, desc: 'motor control' }

    instance_configurations: ['focus_ctrl']

    properties:
        uri_path:     {type: 'String',  default: "gmt://isample_cs/"}
        host:         {type: 'String',  default: "127.0.0.1"}
        port:         {type: 'Integer', default: 8001}
        rate:         {type: 'Integer', default: 10}

