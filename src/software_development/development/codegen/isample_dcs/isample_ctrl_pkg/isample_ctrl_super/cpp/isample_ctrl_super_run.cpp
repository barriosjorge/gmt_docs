#include "isample_ctrl_super.h"
#include "log/log_adapter.h"

using namespace std;
using namespace gmt;

void run() {
    try {
        debug("isample_ctrl_super application starts","IsampleCtrlSuper");

        // create instances
        IsampleCtrlSuper isample_ctrl_super("gmt://default/isample_ctrl_super:8000", 1000);

        // start instances
        isample_ctrl_super.start();

        // wait until components finish
        isample_ctrl_super.wait();
    }
    catch(std::runtime_error& e) { error(e.what(),"IsampleCtrlSuper");            }
    catch(std::exception& e)     { error(e.what(),"IsampleCtrlSuper");            }
    catch(...)                   { error("unknown exception","IsampleCtrlSuper"); }
}

int main() {
    run();
    return(0);
}
