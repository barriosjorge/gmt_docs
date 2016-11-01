
class IsampleFilterWheelCtrl
    constructor: (@name, @rate) ->
        super @name, @rate

    setup: () ->
            @new_input_port "motor_state"

            @new_output_port "motor_ctrl"
            @new_output_port "heartbeat_out"

    step: () ->
        # Add your code here

module.exports.IsampleFilterWheelCtrl = IsampleFilterWheelCtrl

