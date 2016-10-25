#include <msgpack.hpp>
#include <string>

struct isample_motor_status {
    bool             ready;                   // Axis Ready
    bool             enabled;                 // Axis Enabled
    bool             warning;                 // Axis Warning
    bool             error;                   // Axis Error
    bool             moving_positive;         // Axis Moving +
    bool             moving_negative;         // Axis Moving -
    MSGPACK_DEFINE_MAP(ready, enabled, warning, error, moving_positive, moving_negative)
};

