#ifndef _isample_filter_wheel_ctrl_h_
#define _isample_filter_wheel_ctrl_h_

#include "../../../cpp/isample_dcs_port_types.h"
#include "core.h"
#include "base_controller.h"

namespace gmt
{

class IsampleFilterWheelCtrl : public BaseController
{
    public:
        IsampleFilterWheelCtrl(std::string uri, uint32_t rate);
        virtual ~IsampleFilterWheelCtrl();

        void setup() override;
        void step(bool setup_ok) override;

    private:

        // Create state variables
        StateVar<float>                position_sv;
        StateVar<OperationalState>     ops_state_sv;
        StateVar<SimulationMode>       sim_mode_sv;
        StateVar<ControlMode>          control_mode_sv;

        // input port declaration
        isample_motor_status motor_state;

        // output port declaration
        isample_motor_control motor_ctrl;
        HeartBeatEvent       heartbeat_out;

        // Define alarms for port and state_var health conditions

        // Base class shall be able to initialize state_var based on ports?
};

} // namespace gmt

#endif   // _isample_filter_wheel_ctrl_h_
