
# Component   instance configuration file
# Ports should be setup per instance


isample_temp_ctrl "isample_cryo_internal_temp_ctrl",
    default:

        properties:
            uri_path: 'gmt://default/'
            host: 'localhost'
            port: 8000
            rate: 1000
            acl: 'private'

        state_vars: [
            { name: 'cryo_temp', default: 20,  min: 5, max: 40 }
            { name: 'ops_state', default: 'OFF'  }
            { name: 'sim_mode', default: 'ON_LINE'  }
            { name: 'control_mode', default: 'STANDALONE'  }
        ]
        input_ports: [
            { name: 'temperatures',          protocol: 'pull',  url: 'tcp://localhost:8001', blocking_mode: 'async', max_rate: 1        }
            { name: 'cryo_temp_goal',        protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'ops_state_goal',        protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'sim_mode_goal',         protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'control_mode_goal',     protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]
        output_ports: [
            { name: 'heartbeat_out',         protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: 1        }
            { name: 'cryo_temp_value',       protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'ops_state_value',       protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'sim_mode_value',        protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'control_mode_value',    protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]

isample_temp_ctrl "isample_cryo_external_temp_ctrl",
    default:

        properties:
            uri_path: 'gmt://default/'
            host: 'localhost'
            port: 8000
            rate: 1000
            acl: 'private'

        state_vars: [
            { name: 'cryo_temp', default: 20,  min: 5, max: 40 }
            { name: 'ops_state', default: 'OFF'  }
            { name: 'sim_mode', default: 'ON_LINE'  }
            { name: 'control_mode', default: 'STANDALONE'  }
        ]
        input_ports: [
            { name: 'temperatures',          protocol: 'pull',  url: 'tcp://localhost:8002', blocking_mode: 'async', max_rate: 1        }
            { name: 'cryo_temp_goal',        protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'ops_state_goal',        protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'sim_mode_goal',         protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'control_mode_goal',     protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]
        output_ports: [
            { name: 'heartbeat_out',         protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: 1        }
            { name: 'cryo_temp_value',       protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'ops_state_value',       protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'sim_mode_value',        protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'control_mode_value',    protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]

