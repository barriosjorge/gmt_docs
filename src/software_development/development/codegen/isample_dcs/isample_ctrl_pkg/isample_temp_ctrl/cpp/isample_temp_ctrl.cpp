#include "isample_temp_ctrl.h"

using namespace gmt;

IsampleTempCtrl::IsampleTempCtrl(std::string uri, uint32_t rate)
    : BaseController(uri, rate)
    , cryo_temp_sv("cryo_temp_sv", 20, 40, 5, true)
    , ops_state_sv("ops_state_sv", OperationalState::OFF, true)
    , sim_mode_sv("sim_mode_sv", SimulationMode::ON_LINE, true)
    , control_mode_sv("control_mode_sv", ControlMode::STANDALONE, true)
    {

    log_info("creating controller");
}

IsampleTempCtrl::~IsampleTempCtrl() {
}

