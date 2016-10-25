
# Should be supervisor

Controller    'isample_ctrl_super',
    info:     'isample Control Supervisor'
    desc:     'This provides supervision of the isample controllers'
    extends:  ['BaseController']
    abstract: false

    state_vars:
        position:     { type: 'float', controllable: true, init: 20.0, max: 40.0, min: 5.0, desc: 'position sv' }

    input_ports:
        # Should be in super class
        heartbeat:     { type: 'heartbeat',  protocol: 'pull', rate: 1, desc: 'HMI operation buttons' }

    output_ports:
        heartbeat:     { type: 'heartbeat',  protocol: 'push', rate: 1, desc: 'motor control' }

    instance_configurations: ['isample_ctrl_super']

    properties:
        uri_path:     {type: 'String',  default: "gmt://isample_cs/"}
        host:         {type: 'String',  default: "127.0.0.1"}
        port:         {type: 'Integer', default: 8001}
        rate:         {type: 'Integer', default: 10}

