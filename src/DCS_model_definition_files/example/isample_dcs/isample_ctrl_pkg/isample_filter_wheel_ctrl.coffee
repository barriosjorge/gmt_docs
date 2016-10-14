
Controller    'isample_filter_wheel_ctrl',
    info:     'isample filter_wheel Controller'
    desc:     'This component implements the control of the isample'
    extends:  ['BaseController']
    abstract: false

    state_vars:
        position:     { type: 'float', controllable: true, default: 20.0, max: 40.0, min: 5.0, desc: 'position sv' }

    input_ports:
        motor_state:  { type: 'motor_status', protocol: 'pull', rate: 1, desc: 'motor state' }

    output_ports:
        motor_ctrl:   { type: 'motor_control', protocol: 'push', rate: 1, desc: 'motor control' }

    instance_configurations: ['fw1_ctrl', 'fw2_ctrl']

    properties:
        uri_path: {type: 'String',  default: "gmt://isample_cs/"}
        host:     {type: 'String',  default: "127.0.0.1"}
        port:     {type: 'Integer', default: 8002}
        rate:     {type: 'Integer', default: 10}

