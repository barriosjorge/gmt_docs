#ifndef _isample_temp_ctrl_h_
#define _isample_temp_ctrl_h_

#include "../../../cpp/isample_dcs_port_types.h"
#include "core.h"
#include "base_controller.h"

namespace gmt
{

class IsampleTempCtrl : public BaseController
{
    public:
        IsampleTempCtrl(std::string uri, uint32_t rate);
        virtual ~IsampleTempCtrl();

        void setup() override;
        void step(bool setup_ok) override;

    private:

        // Create state variables
        StateVar<float>                cryo_temp_sv;
        StateVar<OperationalState>     ops_state_sv;
        StateVar<SimulationMode>       sim_mode_sv;
        StateVar<ControlMode>          control_mode_sv;

        // input port declaration
        isample_temp_measurements temperatures;

        // output port declaration
        HeartBeatEvent       heartbeat_out;

        // Define alarms for port and state_var health conditions

        // Base class shall be able to initialize state_var based on ports?
};

} // namespace gmt

#endif   // _isample_temp_ctrl_h_
