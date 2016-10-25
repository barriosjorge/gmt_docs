
#make variables for package components:
run_isample_ctrl_pkg_SRCS += ../isample_ctrl_super/cpp/isample_ctrl_super.cpp
run_isample_ctrl_pkg_SRCS += ../isample_ctrl_super/cpp/isample_ctrl_super_setup.cpp
run_isample_ctrl_pkg_SRCS += ../isample_ctrl_super/cpp/isample_ctrl_super_step.cpp

run_isample_ctrl_pkg_SRCS += ../isample_temp_ctrl/cpp/isample_temp_ctrl.cpp
run_isample_ctrl_pkg_SRCS += ../isample_temp_ctrl/cpp/isample_temp_ctrl_setup.cpp
run_isample_ctrl_pkg_SRCS += ../isample_temp_ctrl/cpp/isample_temp_ctrl_step.cpp

run_isample_ctrl_pkg_SRCS += ../isample_focus_ctrl/cpp/isample_focus_ctrl.cpp
run_isample_ctrl_pkg_SRCS += ../isample_focus_ctrl/cpp/isample_focus_ctrl_setup.cpp
run_isample_ctrl_pkg_SRCS += ../isample_focus_ctrl/cpp/isample_focus_ctrl_step.cpp

run_isample_ctrl_pkg_SRCS += ../isample_filter_wheel_ctrl/cpp/isample_filter_wheel_ctrl.cpp
run_isample_ctrl_pkg_SRCS += ../isample_filter_wheel_ctrl/cpp/isample_filter_wheel_ctrl_setup.cpp
run_isample_ctrl_pkg_SRCS += ../isample_filter_wheel_ctrl/cpp/isample_filter_wheel_ctrl_step.cpp

run_isample_ctrl_pkg_SRCS += ../isample_hw_adapter/cpp/isample_hw_adapter.cpp
run_isample_ctrl_pkg_SRCS += ../isample_hw_adapter/cpp/isample_hw_adapter_setup.cpp
run_isample_ctrl_pkg_SRCS += ../isample_hw_adapter/cpp/isample_hw_adapter_step.cpp


#make variables for package apps:
PRODS += run_isample_ctrl_pkg_main
run_isample_ctrl_pkg_main_CXXFLAGS += 
run_isample_ctrl_pkg_main_SRCS     += ${run_isample_ctrl_pkg_SRCS}
run_isample_ctrl_pkg_main_SRCS     += isample_ctrl_pkg_main_run.cpp
run_isample_ctrl_pkg_main_LDFLAGS  += -lnanomsg $(shell pkg-config --libs msgpack) -lpthread -L${GMT_ROOT}/usr/lib64/ -lgmt_core_fwk -lgmt_io_fwk -lgmt_ctrl_fwk


