#include <msgpack.hpp>
#include <string>

struct isample_hmi_leds {
    bool             pilot;                   // Pilot Light
    bool             emergency_light;         // Emergency Light
    bool             heartbeat;               // Heartbeat
    uint8_t          counter;                 // Counter
    MSGPACK_DEFINE_MAP(pilot, emergency_light, heartbeat, counter)
};

