#ifndef _isample_hw_adapter_h_
#define _isample_hw_adapter_h_

#include "../../../cpp/isample_dcs_port_types.h"
#include "core.h"
#include "ethercat_adapter.h"

namespace gmt
{

class IsampleHwAdapter : public EthercatAdapter
{
    public:
        IsampleHwAdapter(std::string uri, uint32_t rate);
        virtual ~IsampleHwAdapter();

        void setup() override;
        void step(bool setup_ok) override;

    private:

        // Create state variables
        StateVar<OperationalState>     ops_state_sv;

        // input port declaration
        isample_hmi_leds     operator_leds;
        isample_motor_control focus_motor_control;
        isample_motor_control fw1_motor_control;
        isample_motor_control fw2_motor_control;
        isample_sdo_data     sdo_in;
        FieldBus             ecat_bus;

        // output port declaration
        isample_hmi_buttons  operator_buttons;
        isample_temp_measurements cryo_internal_temp;
        isample_temp_measurements cryo_external_temp;
        isample_motor_status focus_motor_status;
        isample_motor_status fw1_motor_status;
        isample_motor_status fw2_motor_status;
        isample_sdo_data     sdo_out;
        HeartBeatEvent       heartbeat_out;

        // Define alarms for port and state_var health conditions

        // Base class shall be able to initialize state_var based on ports?
};

} // namespace gmt

#endif   // _isample_hw_adapter_h_
