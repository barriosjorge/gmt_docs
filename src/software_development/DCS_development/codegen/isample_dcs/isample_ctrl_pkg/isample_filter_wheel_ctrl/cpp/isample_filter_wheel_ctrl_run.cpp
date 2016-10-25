#include "isample_filter_wheel_ctrl.h"
#include "log/log_adapter.h"

using namespace std;
using namespace gmt;

void run() {
    try {
        debug("isample_filter_wheel_ctrl application starts","IsampleFilterWheelCtrl");

        // create instances
        IsampleFilterWheelCtrl isample_fw1_ctrl("gmt://default/isample_fw1_ctrl:8000", 1000);
        IsampleFilterWheelCtrl isample_fw2_ctrl("gmt://default/isample_fw2_ctrl:8000", 1000);

        // start instances
        isample_fw1_ctrl.start();
        isample_fw2_ctrl.start();

        // wait until components finish
        isample_fw1_ctrl.wait();
        isample_fw2_ctrl.wait();
    }
    catch(std::runtime_error& e) { error(e.what(),"IsampleFilterWheelCtrl");            }
    catch(std::exception& e)     { error(e.what(),"IsampleFilterWheelCtrl");            }
    catch(...)                   { error("unknown exception","IsampleFilterWheelCtrl"); }
}

int main() {
    run();
    return(0);
}
