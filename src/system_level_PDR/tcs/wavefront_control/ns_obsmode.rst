.. _tcs-ns_obsmode:

*Natural Seeing Observing Mode*
...............................

The simplest observing mode is natural seeing. A simplified control block
diagram of the Natural Seeing (NS) WFC is shown in the Figure below. Software
components associated with sensors are shown in orange, WFC components in grey,
and those associated with optical compensators in blue. Arrows indicate data
flow, color-coded by the type of data: Orange for WFC inputs, gray for internal
data flow between WFC components, and blue for WFC outputs. The WFC includes two
types of controllers: Wavefront controllers, which convert sensor measurements
to residual wavefront, and optics controllers which convert those wavefronts to
mechanical degrees of freedom.

.. figure:: _static/natural_seeing_wcs_block_diagram.png

    Natural Seeing wavefront control system simplified block diagram

The NS wavefront control functionality is split between two controllers: The NS
Fast Guiding controller and the Active Optics Wavefront Controller. The Active
Optics Wavefront Controller is common to all observing modes, though its
reconstructor matrix changes. It provides updates to the mount pointing, M1 and
M2 segment positioning, and M1 segment figure based on the wavefront slopes sent
by the AGWS Slope Processor, and optionally an On-Instrument Wavefront Sensor
(OIWFS, typically measuring tip-tilt or tip-tilt-focus). The NS Fast Guiding
Controller converts AGWS guider signal to fast tip-tilt commands for either the
FSM or ASM, and offloads the average FSM/ASM tilt to telescope pointing (not
shown).

**Overview**

    Four main control loops operate simultaneously in the natural seeing mode:

    * The Slow Guiding control loop updates the pointing kernel guiding offsets
      based on low- pass filtered AGWS average wavefront tilt measurements.

    * The Fast Guiding control loop updates the tip-tilt of the FSM (or ASM)
      based on full-rate AGWS segment tilt measurements.

    * The Active Optics control loop updates the positions of the M1 and M2
      segments, and the figure of M1, based on AGWS wavefront sensor measurements.

    * The Flexure control loop updates the position of the AGWS probes based on
      On- Instrument Wavefront Sensor measurements.

    The natural seeing mode fast and slow guiding control loops, and their
    expected performances, as well as the Active Optics control loop and its
    performance are detailed in Sections 10 and 11 of [Bouc13]_, and Section
    12.2 of the System Level PDR. In addition to these main feedback loops,
    there is also an offload between the fast guiding controller and the
    pointing kernel to avoid saturation of the FSM or ASM tip-tilt actuators.

**Component Descriptions**

    The Figure below shows a detailed block diagram of the natural seeing WFC,
    including all of the real-time software components currently envisioned.
    External components with interfaces to the WFC (e.g., sensor slope
    processors and mirror controllers) are also represented. Ports are
    identified with the input of output data type, and data flow with arrows.
    Telemetry is not explicitly shown, as it is provided as a system service to
    every component.

    A list of natural seeing WFC components is provided in Table 10-17. A
    description of the most critical components is given below, followed by an
    identification of the connections between them. Note that wavefront
    aberrations have been identified using the following nomenclature:

        * Global aberrations are defined over the full GMT pupil, while segment
          aberrations are defined over each segment.

        * System aberrations represent a measurement of the full telescope
          optical system, while M1, ASM, etc., aberrations represent only the
          contribution of one optical surface.

        * Temporal averages of an aberration are identified as aberration_av.

    .. table:: Natural Seeing Wavefront Control System Components

       +-----------------------+---------------------------------------+------------------+
       | Component Name        | Description                           | Software Package |
       +=======================+=======================================+==================+
       | wfc_fast_guide_ctrl   | Fast Guiding Controller               | wfc_ns_pkg       |
       +-----------------------+---------------------------------------+------------------+
       | wfc_aco_ctrl          | Active Optics Controller              | wfc_common_pkg   |
       +-----------------------+---------------------------------------+------------------+
       | wfc_aco_recon_srv     | Active Optics Reconstructor Server    | wfc_common_pkg   |
       +-----------------------+---------------------------------------+------------------+
       | m1_optics_ctrl        | M1 Optics Controller                  | wfc_common_pkg   |
       +-----------------------+---------------------------------------+------------------+
       | m2_optics_ctrl        | M2 Optics Controller                  | wfc_common_pkg   |
       +-----------------------+---------------------------------------+------------------+

    At the present time, all aberrations except the M1 bending modes are defined
    using Zernike polynomials [Noll76]_.

    .. figure:: _static/natural_seeing_wcs_block_diagram_detailed.png
       :scale: 100%

**AGWS Slope Processor**

    While the AGWS slope processor is not a component of the WFC, it is
    presented here for completeness. The AGWS slope processor converts the AGWS
    camera images into wavefront slopes, by computing the centroid of star or
    Shack-Hartmann spot images relative to reference pixel positions. The
    component’s input and output ports are listed in the Table below.

    There are four cameras in the AGWS. Each camera may be operated in one of
    four modes: Idle, Guide, TT7 and SH-WFS. The number of positions in the
    reference list will vary from 1 in Guide mode to 7 in TT7 mode, and ~576 in
    SH-WFS mode.  New images may be available as rapidly as 206 Hz in WFS mode,
    402 Hz in TT7 mode, and up to 2 kHz in Guide mode. The operating mode of the
    camera will control the output port to which its wavefront slopes are
    provided.


    .. table:: AGWS Slope Processor Ports

       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | Port Name      | | Description                                   | | Unit    | | Size  | | Rate | | Type   |
       | |                | |                                               | |         | | (kB)  | | (Hz) | |        |
       +==================+=================================================+===========+=========+========+==========+
       | | agws img       | | AGWS detector image streams (4 cameras).      | | count   | | 2048  | | 206  | | Input  |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws bkg       | | AGWS background images.                       | | count   | | 2048  | | 1    | | Input  |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws gain      | | AGWS pixel gain.                              | | N/A     | | 4096  | | 1    | | Input  |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws wf        | | List of [x,y] expected positions of each WFS  | | pixel   | | 18.4  | | 1    | | Input  |
       | | ref            | | subaperture or guider image.                  | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws wf        | | List of [x,y] offsets from the reference      | | mas     | | 18.4  | | 1    | | Input  |
       | | offset         | | positions of each WFS subaperture or guider   | |         | |       | |      | |        |
       | |                | | image.                                        | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | system global  | | Difference between agws_wf_ref and computed   | | mas     | | 0.032 | | 2000 | | Output |
       | | tilt           | | centroid position for cameras in Guide mode,  | |         | |       | |      | |        |
       | |                | | or average of the slopes for cameras in TT7   | |         | |       | |      | |        |
       | |                | | mode, in the probe coordinate system.         | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | system segment | | Difference between agws_wf_ref and computed   | | mas     | | 0.224 | | 402  | | Output |
       | | tilt           | | centroid position for cameras in TT7 mode,    | |         | |       | |      | |        |
       | |                | | in the probe coordinate system.               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws wf slopes | | Difference between agws_wf_ref and computed   | | mas     | | 18.4  | | 206  | | Output |
       | |                | | centroid position for camera in WFS mode,     | |         | |       | |      | |        |
       | |                | | in the probe coordinate system.               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | system global  | | Low-pass filtered system global tilt. If no   | | mas     | | 0.008 | | 20   | | Output |
       | | tilt av        | | probe in Guide mode, derived from probe in    | |         | |       | |      | |        |
       | |                | | TT7 mode.                                     | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws sp flag   | | Quality flag for each slope measurement.      | | boolean | | 9.2   | | 206  | | Output |
       | |                | |                                               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws sp fwhm   | | FWHM of each subaperture image.               | | mas     | | 18.4  | | 206  | | Output |
       | |                | |                                               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws sp snr    | | SNR of each slope measurement.                | | N/A     | | 18.4  | | 206  | | Output |
       | |                | |                                               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws sp flux   | | Integrated flux in each subaperture.          | | count   | | 18.4  | | 206  | | Output |
       | |                | |                                               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws sp bkg    | | Measured background flux in each subaperture. | | count   | | 18.4  | | 206  | | Output |
       | | flux           | |                                               | |         | |       | |      | |        |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+
       | | agws sp cent   | | Raw computed centroid in each subaperture.    | | pixel   | | 18.4  | | 206  | | Output |
       +------------------+-------------------------------------------------+-----------+---------+--------+----------+

    Reference positions are provided by the Active Optics Reconstructor
    Server and may be modified by offsets provided by other components in the
    control system. For example, the AGWS Supervisor component might provide
    open loop calibration offsets dependent on the camera probe location and
    gravity vector, and the telescope control system might provide guide or
    other offsets to affect coordinated dithers or other tracking functions.

    In addition to full-rate centroid data, the AGWS slope processor will
    compute a low-pass filtered average wavefront tilt (from Guide, TT7, or
    WFS mode measurements) and provide this to the pointing kernel for slow
    guiding of the mount. Other parameters such as SNR, FWHM, and flux per
    subaperture will be computed for each camera and sent to the telemetry
    system. These values will be used by the Active Optics Reconstructor
    Server to correctly weight the measurements and verify pupil mapping.

**Fast Guiding Controller**

    The Fast Guiding Controller computes the segment tip-tilt commands that
    will be sent to either the FSM or ASM controller, depending on the M2
    assembly installed. Its data interfaces are listed in the following Table:

    .. table:: Fast Guiding Controller Ports

       +------------------+------------------------------------------------------+--------+---------+--------+----------+
       | | Port Name      | | Description                                        | | Unit | | size  | | Rate | | Type   |
       | |                | |                                                    | |      | | (kB)  | | (Hz) | |        |
       +==================+======================================================+========+=========+========+==========+
       | | system global  | | Global tilt error in the probe coordinate system.  | | mas  | | 0.032 | | 2000 | | Input  |
       | | tilt           | | Used only if system_segment_tilt is not available. | |      | |       | |      | |        |
       +------------------+------------------------------------------------------+--------+---------+--------+----------+
       | | system segment | | Segment tilt error in the AGWS probe coordinate    | | mas  | | 0.224 | | 402  | | Input  |
       | | tilt           | | system.                                            | |      | |       | |      | |        |
       +------------------+------------------------------------------------------+--------+---------+--------+----------+
       | | fast guide     | | Fast guiding reconstructor matrix. Converts Guide  | | n/a  | | 3.1   | | 0.3  | | Input  |
       | | recon          | | or TT7 centroids to system segment tilt in         | |      | |       | |      | |        |
       | |                | | telescope coordinate system.                       | |      | |       | |      | |        |
       +------------------+------------------------------------------------------+--------+---------+--------+----------+
       | | m2 segment     | | Absolute segment tilt commands to each FSM         | | mas  | | 0.056 | | 2000 | | Output |
       | | tilt           | | segment, in the telescope coordinate system.       | |      | |       | |      | |        |
       +------------------+------------------------------------------------------+--------+---------+--------+----------+
       | | m2 segment     | | Time-average segment tilt, to offload to the M2    | | mas  | | 0.056 | | 0.3  | | Output |
       | | tilt av        | | Positioner.                                        | |      | |       | |      | |        |
       +------------------+------------------------------------------------------+--------+---------+--------+----------+
 

 


 


