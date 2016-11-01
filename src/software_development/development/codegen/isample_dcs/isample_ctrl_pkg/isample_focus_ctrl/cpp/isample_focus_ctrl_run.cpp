#include "isample_focus_ctrl.h"
#include "log/log_adapter.h"

using namespace std;
using namespace gmt;

void run() {
    try {
        debug("isample_focus_ctrl application starts","IsampleFocusCtrl");

        // create instances
        IsampleFocusCtrl isample_focus_ctrl("gmt://default/isample_focus_ctrl:8000", 1000);

        // start instances
        isample_focus_ctrl.start();

        // wait until components finish
        isample_focus_ctrl.wait();
    }
    catch(std::runtime_error& e) { error(e.what(),"IsampleFocusCtrl");            }
    catch(std::exception& e)     { error(e.what(),"IsampleFocusCtrl");            }
    catch(...)                   { error("unknown exception","IsampleFocusCtrl"); }
}

int main() {
    run();
    return(0);
}
