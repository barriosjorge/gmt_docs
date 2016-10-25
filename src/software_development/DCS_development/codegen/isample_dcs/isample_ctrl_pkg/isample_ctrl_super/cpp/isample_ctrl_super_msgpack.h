#ifndef _isample_ctrl_super_msgpack_h_
#define _isample_ctrl_super_msgpack_h_

#include <msgpack.hpp>
#include "../../../cpp/isample_dcs_port_types.h"

struct isample_ctrl_super_conf {
    struct PropertyConf        properties;
    struct StateVarConf        state_vars;
    struct InputPortConf       input_ports;
    struct OutputPortConf      output_ports;
    MSGPACK_DEFINE_MAP(properties, state_vars, input_ports, output_ports)
};

// Property related data types
struct PropertyConf {
    std::string          uri_path;            // Uri path for the component
    std::string          host;                // Default host for deployment.
    int                  port;                // Default configuration port
    int                  rate;                // The update rate of the controller loop. In each iteration of the loop the controller must update its estimation of the state variables, if necessary with the use of and estimation model, must calculate the control output, if necessary wiht a control model and must assess the health of the system under control and of its own operation
    std::string          acl;                 // Access Control List. List of namespaces that can issue a command to the controller. TBC
    MSGPACK_DEFINE_MAP(uri_path, host, port, rate, acl)
};

// State variables related properties

struct ops_state_prop {
    OperationalState default;
    std::string url;
    MSGPACK_DEFINE_MAP(default, url)
};

struct sim_mode_prop {
    SimulationMode default;
    std::string url;
    MSGPACK_DEFINE_MAP(default, url)
};

struct control_mode_prop {
    ControlMode default;
    std::string url;
    MSGPACK_DEFINE_MAP(default, url)
};

struct StateVarConf {
    ops_state_prop       ops_state;           // Operational Mode State Variable
    sim_mode_prop        sim_mode;            // Simulation Mode State Variable
    control_mode_prop    control_mode;        // Control Mode State Variable
    MSGPACK_DEFINE_MAP(ops_state, sim_mode, control_mode)
};

// Input port related properties

struct heartbeat_in_prop {
    HeartBeatEvent default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct InputPortConf {
    heartbeat_in_port          heartbeat_in;        // HMI operation buttons
    MSGPACK_DEFINE_MAP(heartbeat_in)
};

// Output port related properties

struct heartbeat_out_prop {
    HeartBeatEvent default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct OutputPortConf {
    heartbeat_out_port         heartbeat_out;       // Hearbeat signal
    MSGPACK_DEFINE_MAP(heartbeat_out)
};

#endif // _isample_ctrl_super_msgpack_h_
