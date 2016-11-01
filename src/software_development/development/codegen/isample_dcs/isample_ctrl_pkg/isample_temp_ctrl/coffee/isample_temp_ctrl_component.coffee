
class IsampleTempCtrl
    constructor: (@name, @rate) ->
        super @name, @rate

    setup: () ->
            @new_input_port "temperatures"

            @new_output_port "heartbeat_out"

    step: () ->
        # Add your code here

module.exports.IsampleTempCtrl = IsampleTempCtrl

