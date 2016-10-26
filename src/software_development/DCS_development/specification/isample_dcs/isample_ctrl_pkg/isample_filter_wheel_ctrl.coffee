
Controller    'isample_filter_wheel_ctrl',
    info:     'isample filter_wheel Controller'
    desc:     'This component implements the control of the isample'
    extends:  ['BaseController']
    abstract: false

    state_vars:
        position:     { type: 'float', controllable: true, default: 20.0, max: 40.0, min: 5.0, desc: 'position sv' }

    input_ports:
        motor_state:  { type: 'isample_motor_status', protocol: 'pull', max_rate: 1, blocking_mode: 'async', desc: 'motor state' }

    output_ports:
        motor_ctrl:   { type: 'isample_motor_control', protocol: 'push', max_rate: 1, blocking_mode: 'async', desc: 'motor control' }

    properties:
        uri_path: { type: 'String',  default: "gmt://isample_cs/"}
        host:     { type: 'String',  default: "127.0.0.1"}
        port:     { type: 'Integer', default: 8002}
        rate:     { type: 'Integer', default: 10}

    instance_configurations: ['isample_fw1_ctrl', 'isample_fw2_ctrl']
