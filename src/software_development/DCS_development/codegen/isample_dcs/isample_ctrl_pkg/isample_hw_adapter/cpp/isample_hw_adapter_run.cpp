#include "isample_hw_adapter.h"
#include "log/log_adapter.h"

using namespace std;
using namespace gmt;

void run() {
    try {
        debug("isample_hw_adapter application starts","IsampleHwAdapter");

        // create instances
        IsampleHwAdapter isample_hw_adapter("gmt://default/isample_hw_adapter:8000", 1000);

        // start instances
        isample_hw_adapter.start();

        // wait until components finish
        isample_hw_adapter.wait();
    }
    catch(std::runtime_error& e) { error(e.what(),"IsampleHwAdapter");            }
    catch(std::exception& e)     { error(e.what(),"IsampleHwAdapter");            }
    catch(...)                   { error("unknown exception","IsampleHwAdapter"); }
}

int main() {
    run();
    return(0);
}
