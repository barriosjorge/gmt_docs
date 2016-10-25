#include <msgpack.hpp>
#include <string>

struct isample_sdo_data {
    uint16_t         sensor_type_1;           // sensor #1 tech
    uint16_t         sensor_type_2;           // sensor #2 tech
    MSGPACK_DEFINE_MAP(sensor_type_1, sensor_type_2)
};

