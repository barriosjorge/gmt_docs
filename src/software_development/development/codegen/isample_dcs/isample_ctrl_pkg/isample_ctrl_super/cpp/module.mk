
PRODS += run_isample_ctrl_super
run_isample_ctrl_super_CXXFLAGS += 
run_isample_ctrl_super_SRCS += isample_ctrl_super.cpp
run_isample_ctrl_super_SRCS += isample_ctrl_super_setup.cpp
run_isample_ctrl_super_SRCS += isample_ctrl_super_step.cpp
run_isample_ctrl_super_SRCS += isample_ctrl_super_run.cpp
run_isample_ctrl_super_LDFLAGS += -lnanomsg $(shell pkg-config --libs msgpack) -lpthread -L${GMT_ROOT}/usr/lib64/ -lgmt_core_fwk -lgmt_io_fwk -lgmt_ctrl_fwk

