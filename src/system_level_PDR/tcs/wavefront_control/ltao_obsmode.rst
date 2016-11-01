.. _tcs-ltao_obsmode:

*Laser Tomographic Adaptive Optics (LTAO)*
..........................................

A simplified block diagram of the LTAO WFC is presented in :numref:`Figure %s
<ltao_wfcs_block_diagram>`. There are strong similarities to the NGSAO WFC, with
the LTWS taking the place of the NGWS. The LTAO Wavefront Controller has three
additional outputs controlling the OIWFS DM, the LTWS focus stage, and the LGSF
steering mirrors.  At this level of detail, the additional NGS tip-tilt and
focus control loops and the details of the pseudo open-loop tomographic control
are hidden within the LTAO Wavefront Controller. The Phasing Controller in the
LTAO mode has additional inputs from the OIWFS, Phasing Camera, and M1 and M2
Edge Sensors.  The operation of the Active Optics Wavefront Controller is
identical to the NGSAO mode.

.. _ltao_wfcs_block_diagram:

.. figure:: _static/ltao_wfcs_block_diagram.png
    :scale: 100%

Thirteen wavefront control loops operate simultaneously in the LTAO mode, a
number similar to that of present-generation state-of-the art AO system (e.g.,
Gemini GEMS). Eight are implemented by the LTAO Wavefront Controller based on
measurements made by the LTWS and OIWFS. These are:

  1. High-order on-axis wavefront error, compensated with the ASM

  2. High-order off-axis wavefront error, compensated with the OIWFS DM

  3. Tip-tilt, compensated with the ASM

  4. Focus, compensated with the ASM

  5. Dynamic calibration, compensated with the ASM

  6. OIWFS dynamic calibration, compensated with the OIWFS DM

  7. Laser tip-tilt, compensated with LGSF steering mirrors

  8. Laser focus, used to optimize the axial position of the LTWS.

The remaining five control loops are:

  1. The M1 and M2 Edge Sensors, which control the relative positions of the M1
     and M2 outer segments with respect to the center segments.

  2. The Phasing Controller, which updates the M1 edge sensor setpoints based on
     OIWFS and/or Phasing Camera measurements.

  3. The Phasing Controller, which feeds forward edge sensor segment piston
     measurements to the ASM via the LTAO Wavefront Controller.

  4. The Active Optics Wavefront Controller, which controls field-dependent
     aberrations based on AGWS measurements.

  5. The Pupil Motion Controller, which adjusts the tilt of M3 to maintain the
     pupil centered on the instrument.

This list does not include control loops internal to AO subsystems, such as the
tip-tilt dithering on the IOPS sensor of the OIWFS. As in the NGSAO mode, there
are also many offloads between controllers, some of which are described in the
next section.


**Component Descriptions**

    :numref:`Figure %s <ltao_wfcs_block_diagram_detailed>` is a more detailed
    block diagram of the LTAO WFC, with all of the real-time components
    currently envisioned. A list of the components is provided in Table 10-27
    [TBA].  A description of the most critical components is given below,
    followed by an identification of the connections between them.

    .. _ltao_wfcs_block_diagram_detailed:
    
    .. figure:: _static/ltao_wfcs_block_diagram_detailed.png
        :scale: 100%
