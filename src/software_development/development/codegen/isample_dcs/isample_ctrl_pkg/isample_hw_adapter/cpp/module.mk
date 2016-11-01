
PRODS += run_isample_hw_adapter
run_isample_hw_adapter_CXXFLAGS += 
run_isample_hw_adapter_SRCS += isample_hw_adapter.cpp
run_isample_hw_adapter_SRCS += isample_hw_adapter_setup.cpp
run_isample_hw_adapter_SRCS += isample_hw_adapter_step.cpp
run_isample_hw_adapter_SRCS += isample_hw_adapter_run.cpp
run_isample_hw_adapter_LDFLAGS += -lnanomsg $(shell pkg-config --libs msgpack) -lpthread -L${GMT_ROOT}/usr/lib64/ -lgmt_core_fwk -lgmt_io_fwk -lgmt_ctrl_fwk

