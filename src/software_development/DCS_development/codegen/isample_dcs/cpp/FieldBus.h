#include <msgpack.hpp>
#include <string>
#include "data_object_config.h"
#include "field_bus_domain.h"
#include "iomodule.h"
#include "field_bus_master.h"

struct FieldBus {
     std::vector<struct FieldBusMaster> master;
     std::vector<struct IOModule> modules;
     std::vector<struct FieldBusDomain> domains;
     std::vector<struct DataObjectConfig> data_objects;
     std::string protocol;
     MSGPACK_DEFINE_MAP(master, modules, domains, data_objects, protocol)
};

