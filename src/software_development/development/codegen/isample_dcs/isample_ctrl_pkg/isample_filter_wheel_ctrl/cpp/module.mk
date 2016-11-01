
PRODS += run_isample_filter_wheel_ctrl
run_isample_filter_wheel_ctrl_CXXFLAGS += 
run_isample_filter_wheel_ctrl_SRCS += isample_filter_wheel_ctrl.cpp
run_isample_filter_wheel_ctrl_SRCS += isample_filter_wheel_ctrl_setup.cpp
run_isample_filter_wheel_ctrl_SRCS += isample_filter_wheel_ctrl_step.cpp
run_isample_filter_wheel_ctrl_SRCS += isample_filter_wheel_ctrl_run.cpp
run_isample_filter_wheel_ctrl_LDFLAGS += -lnanomsg $(shell pkg-config --libs msgpack) -lpthread -L${GMT_ROOT}/usr/lib64/ -lgmt_core_fwk -lgmt_io_fwk -lgmt_ctrl_fwk

