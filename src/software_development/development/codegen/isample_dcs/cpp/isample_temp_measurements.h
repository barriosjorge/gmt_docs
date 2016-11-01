#include <msgpack.hpp>
#include <string>

struct isample_temp_measurements {
    uint16_t         temp_sensor1;            // temperature sensor #1
    uint16_t         temp_sensor2;            // temperature sensor #2
    uint16_t         press_sensor1;           // pressure sensor    #1
    MSGPACK_DEFINE_MAP(temp_sensor1, temp_sensor2, press_sensor1)
};

