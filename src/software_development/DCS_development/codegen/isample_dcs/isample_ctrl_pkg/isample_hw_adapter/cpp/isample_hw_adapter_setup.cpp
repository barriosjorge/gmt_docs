#include "isample_hw_adapter.h"

using namespace gmt;

void IsampleHwAdapter::setup() {
    log_info("port setup");

    // create input ports
       new_input_port(operator_leds,            "operator_leds");
       new_input_port(focus_motor_control,      "focus_motor_control");
       new_input_port(fw1_motor_control,        "fw1_motor_control");
       new_input_port(fw2_motor_control,        "fw2_motor_control");
       new_input_port(sdo_in,                   "sdo_in");
       new_input_port(ecat_bus,                 "ecat_bus");

    // create output ports
       new_output_port(operator_buttons,        "operator_buttons");
       new_output_port(cryo_internal_temp,      "cryo_internal_temp");
       new_output_port(cryo_external_temp,      "cryo_external_temp");
       new_output_port(focus_motor_status,      "focus_motor_status");
       new_output_port(fw1_motor_status,        "fw1_motor_status");
       new_output_port(fw2_motor_status,        "fw2_motor_status");
       new_output_port(sdo_out,                 "sdo_out");
       new_output_port(heartbeat_out,           "heartbeat_out");

    // Create state variable ports  (current, goal, health)
       new_input_port(ops_state_sv.goal,        "ops_state_goal");
       new_output_port(ops_state_sv.value,      "ops_state_value");

    // create data_object references
        create_data_object_ref(operator_leds.pilot,                     "pilot");
        create_data_object_ref(operator_leds.emergency_light,           "emergency_light");
        create_data_object_ref(operator_leds.heartbeat,                 "heartbeat");
        create_data_object_ref(operator_leds.counter,                   "counter");
        create_data_object_ref(focus_motor_control.enable,              "focus_enable");
        create_data_object_ref(focus_motor_control.reset,               "focus_reset");
        create_data_object_ref(focus_motor_control.velocity,            "focus_velocity");
        create_data_object_ref(fw1_motor_control.enable,                "fw1_enable");
        create_data_object_ref(fw1_motor_control.reset,                 "fw1_reset");
        create_data_object_ref(fw1_motor_control.velocity,              "fw1_velocity");
        create_data_object_ref(fw2_motor_control.enable,                "fw2_enable");
        create_data_object_ref(fw2_motor_control.reset,                 "fw2_reset");
        create_data_object_ref(fw2_motor_control.velocity,              "fw2_velocity");
        create_data_object_ref(sdo_in.sensor_type_1,                    "sensor_type_1");
        create_data_object_ref(sdo_in.sensor_type_2,                    "sensor_type_2");
        create_data_object_ref(operator_buttons.red_push_button,        "red_push_button");
        create_data_object_ref(operator_buttons.green_push_button,      "green_push_button");
        create_data_object_ref(operator_buttons.emergency_button,       "emergency_button");
        create_data_object_ref(cryo_internal_temp.temp_sensor1,         "temp_sensor1");
        create_data_object_ref(cryo_internal_temp.temp_sensor2,         "temp_sensor2");
        create_data_object_ref(cryo_external_temp.temp_sensor1,         "temp_sensor3");
        create_data_object_ref(cryo_external_temp.temp_sensor2,         "temp_sensor4");
        create_data_object_ref(focus_motor_status.ready,                "focus_ready");
        create_data_object_ref(focus_motor_status.enabled,              "focus_enabled");
        create_data_object_ref(focus_motor_status.warning,              "focus_warning");
        create_data_object_ref(focus_motor_status.error,                "focus_error");
        create_data_object_ref(focus_motor_status.moving_positive,      "focus_moving_positive");
        create_data_object_ref(focus_motor_status.moving_negative,      "focus_moving_negative");
        create_data_object_ref(fw1_motor_status.ready,                  "fw1_ready");
        create_data_object_ref(fw1_motor_status.enabled,                "fw1_enabled");
        create_data_object_ref(fw1_motor_status.warning,                "fw1_warning");
        create_data_object_ref(fw1_motor_status.error,                  "fw1_error");
        create_data_object_ref(fw1_motor_status.moving_positive,        "fw1_moving_positive");
        create_data_object_ref(fw1_motor_status.moving_negative,        "fw1_moving_negative");
        create_data_object_ref(fw2_motor_status.ready,                  "fw2_ready");
        create_data_object_ref(fw2_motor_status.enabled,                "fw2_enabled");
        create_data_object_ref(fw2_motor_status.warning,                "fw2_warning");
        create_data_object_ref(fw2_motor_status.error,                  "fw2_error");
        create_data_object_ref(fw2_motor_status.moving_positive,        "fw2_moving_positive");
        create_data_object_ref(fw2_motor_status.moving_negative,        "fw2_moving_negative");
        create_data_object_ref(sdo_out.sensor_type_1,                   "sensor_type_1");
        create_data_object_ref(sdo_out.sensor_type_2,                   "sensor_type_2");

    // Add transport definition of port types related to state variables

}
