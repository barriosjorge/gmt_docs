#include <msgpack.hpp>
#include <string>

struct isample_motor_control {
    bool             enable;                  // Axis Enable
    bool             reset;                   // Axis Reset
    int16_t          velocity;                // Velocity
    MSGPACK_DEFINE_MAP(enable, reset, velocity)
};

