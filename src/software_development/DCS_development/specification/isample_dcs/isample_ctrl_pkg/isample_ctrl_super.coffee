
Supervisor    'isample_ctrl_super',
    info:     'isample Control Supervisor'
    desc:     'This provides supervision of the isample controllers'
    extends:  ['BaseController']
    abstract: false

    state_vars:  {}

    input_ports:
        # Should be in super class
        heartbeat_in:     { type: 'HeartBeatEvent',  protocol: 'pull', max_rate: 1, blocking_mode: 'async', desc: 'HMI operation buttons' }

    output_ports:
        heartbeat_out:    { type: 'HeartBeatEvent',  protocol: 'push', max_rate: 1, blocking_mode: 'async', desc: 'motor control' }

    instance_configurations: ['isample_ctrl_super']

    properties:
        uri_path:     {type: 'String',  default: "gmt://isample_cs/"}
        host:         {type: 'String',  default: "127.0.0.1"}
        port:         {type: 'Integer', default: 8001}
        rate:         {type: 'Integer', default: 10}

