#ifndef _isample_hw_adapter_msgpack_h_
#define _isample_hw_adapter_msgpack_h_

#include <msgpack.hpp>
#include "../../../cpp/isample_dcs_port_types.h"

struct isample_hw_adapter_conf {
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
    std::string          acl;                 // Access Control List. List of namespaces that can issue a command to the controller. TBC
    int                  rate;                // The update rate of the controller loop. In each iteration of the loop the controller must update its estimation of the state variables, if necessary with the use of and estimation model, must calculate the control output, if necessary wiht a control model and must assess the health of the system under control and of its own operation
    MSGPACK_DEFINE_MAP(uri_path, host, port, acl, rate)
};

// State variables related properties

struct ops_state_prop {
    OperationalState default;
    std::string url;
    MSGPACK_DEFINE_MAP(default, url)
};

struct StateVarConf {
    ops_state_prop       ops_state;           // Operational Mode State Variable
    MSGPACK_DEFINE_MAP(ops_state)
};

// Input port related properties

struct operator_leds_prop {
    isample_hmi_leds default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct focus_motor_control_prop {
    isample_motor_control default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct fw1_motor_control_prop {
    isample_motor_control default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct fw2_motor_control_prop {
    isample_motor_control default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct sdo_in_prop {
    isample_sdo_data default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct ecat_bus_prop {
    struct FieldBus default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct InputPortConf {
    operator_leds_port         operator_leds;       // Human Machine Interface (HMI) digital outputs
    focus_motor_control_port   focus_motor_control; // motor control
    fw1_motor_control_port     fw1_motor_control;   // motor control
    fw2_motor_control_port     fw2_motor_control;   // motor control
    sdo_in_port                sdo_in;              // sdo set config values
    ecat_bus_port              ecat_bus;            // ethercat bus configuration
    MSGPACK_DEFINE_MAP(operator_leds, focus_motor_control, fw1_motor_control, fw2_motor_control, sdo_in, ecat_bus)
};

// Output port related properties

struct operator_buttons_prop {
    isample_hmi_buttons default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct cryo_internal_temp_prop {
    isample_temp_measurements default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct cryo_external_temp_prop {
    isample_temp_measurements default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct focus_motor_status_prop {
    isample_motor_status default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct fw1_motor_status_prop {
    isample_motor_status default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct fw2_motor_status_prop {
    isample_motor_status default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct sdo_out_prop {
    isample_sdo_data default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct heartbeat_out_prop {
    HeartBeatEvent default;
    std::string   protocol;
    std::string   url;
    std::string   blocking_mode;
    uint8_t       rate;
    MSGPACK_DEFINE_MAP(default, protocol, url, blocking_mode, rate)
};

struct OutputPortConf {
    operator_buttons_port      operator_buttons;    // Human Machine Interface (HMI) digital inputs
    cryo_internal_temp_port    cryo_internal_temp;  // temperature measurements
    cryo_external_temp_port    cryo_external_temp;  // temperature measurements
    focus_motor_status_port    focus_motor_status;  // motor state
    fw1_motor_status_port      fw1_motor_status;    // motor state
    fw2_motor_status_port      fw2_motor_status;    // motor state
    sdo_out_port               sdo_out;             // sdo get configured values
    heartbeat_out_port         heartbeat_out;       // Hearbeat signal
    MSGPACK_DEFINE_MAP(operator_buttons, cryo_internal_temp, cryo_external_temp, focus_motor_status, fw1_motor_status, fw2_motor_status, sdo_out, heartbeat_out)
};

#endif // _isample_hw_adapter_msgpack_h_
