
# Component   instance configuration file
# Ports should be setup per instance


isample_focus_ctrl "isample_focus_ctrl",
    default:

        properties:
            uri_path: 'gmt://default/'
            host: 'localhost'
            port: 8000
            rate: 1000
            acl: 'private'

        state_vars: [
            { name: 'position', default: 20,  min: 5, max: 40 }
            { name: 'ops_state', default: 'OFF'  }
            { name: 'sim_mode', default: 'ON_LINE'  }
            { name: 'control_mode', default: 'STANDALONE'  }
        ]
        input_ports: [
            { name: 'hmi_inputs',            protocol: 'pull',  url: 'tcp://localhost:8003', blocking_mode: 'async', max_rate: 1        }
            { name: 'motor_state',           protocol: 'pull',  url: 'tcp://localhost:8004', blocking_mode: 'async', max_rate: 1        }
            { name: 'position_goal',         protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'ops_state_goal',        protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'sim_mode_goal',         protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'control_mode_goal',     protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]
        output_ports: [
            { name: 'hmi_outputs',           protocol: 'push',  url: 'tcp://localhost:8007', blocking_mode: 'async', max_rate: 1        }
            { name: 'motor_ctrl',            protocol: 'push',  url: 'tcp://localhost:8008', blocking_mode: 'async', max_rate: 1        }
            { name: 'heartbeat_out',         protocol: 'push',  url: 'tcp://localhost:8011', blocking_mode: 'async', max_rate: 1        }
            { name: 'position_value',        protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'ops_state_value',       protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'sim_mode_value',        protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
            { name: 'control_mode_value',    protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]

