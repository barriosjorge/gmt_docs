#include "../isample_ctrl_super/cpp/isample_ctrl_super.h"
#include "../isample_temp_ctrl/cpp/isample_temp_ctrl.h"
#include "../isample_focus_ctrl/cpp/isample_focus_ctrl.h"
#include "../isample_filter_wheel_ctrl/cpp/isample_filter_wheel_ctrl.h"
#include "../isample_hw_adapter/cpp/isample_hw_adapter.h"
#include "log/log_adapter.h"

using namespace std;
using namespace gmt;

void run() {
    try {
        debug("isample_ctrl_pkg application starts","IsampleCtrlPkg");

        // create isample_ctrl_super instances
        IsampleCtrlSuper isample_ctrl_super("gmt://default/isample_ctrl_super:8000", 1000);

        // create isample_temp_ctrl instances
        IsampleTempCtrl isample_cryo_internal_temp_ctrl("gmt://default/isample_cryo_internal_temp_ctrl:8000", 1000);
        IsampleTempCtrl isample_cryo_external_temp_ctrl("gmt://default/isample_cryo_external_temp_ctrl:8000", 1000);

        // create isample_focus_ctrl instances
        IsampleFocusCtrl isample_focus_ctrl("gmt://default/isample_focus_ctrl:8000", 1000);

        // create isample_filter_wheel_ctrl instances
        IsampleFilterWheelCtrl isample_fw1_ctrl("gmt://default/isample_fw1_ctrl:8000", 1000);
        IsampleFilterWheelCtrl isample_fw2_ctrl("gmt://default/isample_fw2_ctrl:8000", 1000);

        // create isample_hw_adapter instances
        IsampleHwAdapter isample_hw_adapter("gmt://default/isample_hw_adapter:8000", 1000);


        // start isample_ctrl_super instances
        isample_ctrl_super.start();

        // start isample_temp_ctrl instances
        isample_cryo_internal_temp_ctrl.start();
        isample_cryo_external_temp_ctrl.start();

        // start isample_focus_ctrl instances
        isample_focus_ctrl.start();

        // start isample_filter_wheel_ctrl instances
        isample_fw1_ctrl.start();
        isample_fw2_ctrl.start();

        // start isample_hw_adapter instances
        isample_hw_adapter.start();


        // wait until components finish
        isample_ctrl_super.wait();
        isample_cryo_internal_temp_ctrl.wait();
        isample_cryo_external_temp_ctrl.wait();
        isample_focus_ctrl.wait();
        isample_fw1_ctrl.wait();
        isample_fw2_ctrl.wait();
        isample_hw_adapter.wait();
    }
    catch(std::runtime_error& e) { error(e.what(),"IsampleCtrlPkg");            }
    catch(std::exception& e)     { error(e.what(),"IsampleCtrlPkg");            }
    catch(...)                   { error("unknown exception","IsampleCtrlPkg"); }
}

int main() {
    run();
    return(0);
}
