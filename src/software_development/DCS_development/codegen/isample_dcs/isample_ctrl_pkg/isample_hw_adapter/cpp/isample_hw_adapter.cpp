#include "isample_hw_adapter.h"

using namespace gmt;

IsampleHwAdapter::IsampleHwAdapter(std::string uri, uint32_t rate)
    : EthercatAdapter(uri, rate)
    , ops_state_sv("ops_state_sv", OperationalState::OFF, true)
    {

    log_info("creating controller");
}

IsampleHwAdapter::~IsampleHwAdapter() {
}

