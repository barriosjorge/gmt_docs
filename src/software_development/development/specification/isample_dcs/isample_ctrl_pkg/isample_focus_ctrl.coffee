
Controller    'isample_focus_ctrl',
    info:     'isample focus Controller'
    desc:     'This component implements the control of the isample'
    extends:  ['BaseController']
    abstract: false

    state_vars:
        position:     { type: 'float', controllable: true, default: 20.0, max: 40.0, min: 5.0, desc: 'position sv' }

    input_ports:
        hmi_inputs:   { type: 'isample_hmi_buttons',   protocol: 'pull', max_rate: 1, blocking_mode: 'async', desc: 'HMI operation buttons' }
        motor_state:  { type: 'isample_motor_status',  protocol: 'pull', max_rate: 1, blocking_mode: 'async', desc: 'motor state' }

    output_ports:
        hmi_outputs:  { type: 'isample_hmi_leds',      protocol: 'push', max_rate: 1, blocking_mode: 'async', desc: 'digital outputs' }
        motor_ctrl:   { type: 'isample_motor_control', protocol: 'push', max_rate: 1, blocking_mode: 'async', desc: 'motor control' }

    instance_configurations: ['isample_focus_ctrl']

    properties:
        uri_path:     {type: 'String',  default: "gmt://isample_cs/"}
        host:         {type: 'String',  default: "127.0.0.1"}
        port:         {type: 'Integer', default: 8001}
        rate:         {type: 'Integer', default: 10}

