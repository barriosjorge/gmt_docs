#include "isample_ctrl_super.h"

using namespace gmt;

void IsampleCtrlSuper::setup() {
    log_info("port setup");

    // create input ports
    new_input_port(heartbeat_in,             "heartbeat_in");

    // create output ports
    new_output_port(heartbeat_out,           "heartbeat_out");

    // Create state variable ports  (current, goal, health)
    new_input_port(ops_state_sv.goal,        "ops_state_goal");
    new_output_port(ops_state_sv.value,      "ops_state_value");
    new_input_port(sim_mode_sv.goal,         "sim_mode_goal");
    new_output_port(sim_mode_sv.value,       "sim_mode_value");
    new_input_port(control_mode_sv.goal,     "control_mode_goal");
    new_output_port(control_mode_sv.value,   "control_mode_value");

    // Add transport definition of port types related to state variables

}
