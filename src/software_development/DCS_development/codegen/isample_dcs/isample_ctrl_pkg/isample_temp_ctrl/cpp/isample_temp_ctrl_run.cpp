#include "isample_temp_ctrl.h"
#include "log/log_adapter.h"

using namespace std;
using namespace gmt;

void run() {
    try {
        debug("isample_temp_ctrl application starts","IsampleTempCtrl");

        // create instances
        IsampleTempCtrl isample_cryo_internal_temp_ctrl("gmt://default/isample_cryo_internal_temp_ctrl:8000", 1000);
        IsampleTempCtrl isample_cryo_external_temp_ctrl("gmt://default/isample_cryo_external_temp_ctrl:8000", 1000);

        // start instances
        isample_cryo_internal_temp_ctrl.start();
        isample_cryo_external_temp_ctrl.start();

        // wait until components finish
        isample_cryo_internal_temp_ctrl.wait();
        isample_cryo_external_temp_ctrl.wait();
    }
    catch(std::runtime_error& e) { error(e.what(),"IsampleTempCtrl");            }
    catch(std::exception& e)     { error(e.what(),"IsampleTempCtrl");            }
    catch(...)                   { error("unknown exception","IsampleTempCtrl"); }
}

int main() {
    run();
    return(0);
}
