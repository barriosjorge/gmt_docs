#include <msgpack.hpp>
#include <string>

struct isample_hmi_buttons {
    bool             red_push_button;         // RED Push Button
    bool             green_push_button;       // GREEN Push Button
    bool             emergency_button;        // Emergency Button
    MSGPACK_DEFINE_MAP(red_push_button, green_push_button, emergency_button)
};

