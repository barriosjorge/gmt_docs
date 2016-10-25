#include <msgpack.hpp>
#include <string>

struct HeartBeatEvent {
    uint64_t         timestamp;               // Time stamp
    MSGPACK_DEFINE_MAP(timestamp)
};

