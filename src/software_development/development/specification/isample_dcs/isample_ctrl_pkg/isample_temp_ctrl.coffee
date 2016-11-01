
Controller    'isample_temp_ctrl',
    info:     'isample temperature Controller'
    desc:     'This Controller implements the control of the isample cryostat'
    extends:  ['BaseController']
    abstract: false

    state_vars:
        cryo_temp:    { type: 'float', controllable: true, default: 20.0, max: 40.0, min: 5.0, desc: 'temperature sv' }

    input_ports:
        temperatures: { type: 'isample_temp_measurements', protocol: 'pull', max_rate: 1, blocking_mode: 'async', desc: 'temperature measurements' }

    instance_configurations: ['isample_cryo_internal_temp_ctrl', 'isample_cryo_external_temp_ctrl']

    properties:
        uri_path: {type: 'String',  default: "gmt://isample_cs/"}
        host:     {type: 'String',  default: "127.0.0.1"}
        port:     {type: 'Integer', default: 8000}
        rate:     {type: 'Integer', default: 1000}

