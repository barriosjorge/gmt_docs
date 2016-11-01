#include "isample_focus_ctrl.h"

using namespace gmt;

IsampleFocusCtrl::IsampleFocusCtrl(std::string uri, uint32_t rate)
    : BaseController(uri, rate)
    , position_sv("position_sv", 20, 40, 5, true)
    , ops_state_sv("ops_state_sv", OperationalState::OFF, true)
    , sim_mode_sv("sim_mode_sv", SimulationMode::ON_LINE, true)
    , control_mode_sv("control_mode_sv", ControlMode::STANDALONE, true)
    {

    log_info("creating controller");
}

IsampleFocusCtrl::~IsampleFocusCtrl() {
}

