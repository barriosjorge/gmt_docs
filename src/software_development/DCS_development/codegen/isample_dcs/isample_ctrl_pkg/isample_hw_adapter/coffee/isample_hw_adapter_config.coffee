
# Component   instance configuration file
# Ports should be setup per instance


isample_hw_adapter "isample_hw_adapter",
    default:

        properties:
            uri_path: 'gmt://default/'
            host: 'localhost'
            port: 8000
            acl: 'private'
            rate: 1000

        state_vars: [
            { name: 'ops_state', default: 'OFF'  }
        ]
        input_ports: [
            { name: 'operator_leds',         protocol: 'pull',  url: 'tcp://localhost:8007', blocking_mode: 'async', max_rate: 1        }
            { name: 'focus_motor_control',   protocol: 'pull',  url: 'tcp://localhost:8008', blocking_mode: 'async', max_rate: 1        }
            { name: 'fw1_motor_control',     protocol: 'pull',  url: 'tcp://localhost:8009', blocking_mode: 'async', max_rate: 1        }
            { name: 'fw2_motor_control',     protocol: 'pull',  url: 'tcp://localhost:8010', blocking_mode: 'async', max_rate: 1        }
            { name: 'sdo_in',                protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: 1        }
            { name: 'ecat_bus',              protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: 1        }
            { name: 'ops_state_goal',        protocol: 'pull',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]
        output_ports: [
            { name: 'operator_buttons',      protocol: 'push',  url: 'tcp://localhost:8003', blocking_mode: 'async', max_rate: 1        }
            { name: 'cryo_internal_temp',    protocol: 'push',  url: 'tcp://localhost:8001', blocking_mode: 'async', max_rate: 1        }
            { name: 'cryo_external_temp',    protocol: 'push',  url: 'tcp://localhost:8002', blocking_mode: 'async', max_rate: 1        }
            { name: 'focus_motor_status',    protocol: 'push',  url: 'tcp://localhost:8004', blocking_mode: 'async', max_rate: 1        }
            { name: 'fw1_motor_status',      protocol: 'push',  url: 'tcp://localhost:8005', blocking_mode: 'async', max_rate: 1        }
            { name: 'fw2_motor_status',      protocol: 'push',  url: 'tcp://localhost:8006', blocking_mode: 'async', max_rate: 1        }
            { name: 'sdo_out',               protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: 1        }
            { name: 'heartbeat_out',         protocol: 'push',  url: 'tcp://localhost:8011', blocking_mode: 'async', max_rate: 1        }
            { name: 'ops_state_value',       protocol: 'push',  url: 'tcp://localhost:8000', blocking_mode: 'async', max_rate: undefined }
        ]

