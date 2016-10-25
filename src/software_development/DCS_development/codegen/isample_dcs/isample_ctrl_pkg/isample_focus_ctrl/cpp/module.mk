
PRODS += run_isample_focus_ctrl
run_isample_focus_ctrl_CXXFLAGS += 
run_isample_focus_ctrl_SRCS += isample_focus_ctrl.cpp
run_isample_focus_ctrl_SRCS += isample_focus_ctrl_setup.cpp
run_isample_focus_ctrl_SRCS += isample_focus_ctrl_step.cpp
run_isample_focus_ctrl_SRCS += isample_focus_ctrl_run.cpp
run_isample_focus_ctrl_LDFLAGS += -lnanomsg $(shell pkg-config --libs msgpack) -lpthread -L${GMT_ROOT}/usr/lib64/ -lgmt_core_fwk -lgmt_io_fwk -lgmt_ctrl_fwk

