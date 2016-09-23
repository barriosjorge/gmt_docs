
.. _networking:

Networking
----------

Telescope Control Systems span a large dynamic range in bandwidth and latency
requirements. Most systems have fairly relaxed requirements on bandwidth and
latency, e.g., the telescope main axis require few parameters to update at
nominally 20 Hz, which is easily handled by off-the-shelf Ethernet components. A
few other systems such as wavefront control and Adaptive Optics run at kHz
regime, shuffling orders of magnitude larger data volume in real time to read
out telemetry and WFS, computing wavefront slopes, commanding ASMs, etc.

The global trend in High Performance Computing and Ethernet communications
drives rapid developments in the industry, somewhat comparable to CPUs (Moore's
law) seen in the previous decade. The emphasis on inter-connected cloud
computing, and the ever-growing bandwidth and low latency requirements, continue
to drive the technology today. Recent trends from high performance computing
community, coupled with cost-benefit components, point to Infiniband* as a safe
choice in the present and for future growth.
