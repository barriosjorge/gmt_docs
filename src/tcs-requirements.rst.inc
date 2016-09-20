
.. _tcs-requirements:

Requirements on TCS, Pointing, Tracking & Guiding
-------------------------------------------------

The requirements governing the TCS and telescope motion control flow several
levels down from the System Level to the SWCS level(s).  Broadly, the
requirements of the TCS address: initial blind pointing accuracy, pointing
accuracy, tracking modes, continuous scan, pointing offsets, acquisition and
reacquisition and, finally, special requirements on the active optics, with
details to follow below.

**Blind pointing** relies entirely on the mechanical positional accuracy of the
telescope encoder systems on the telescope axes and lookup tables to slew the
telescope to the desired sky [α, δ] or mount [Az, El] coordinates. Blind
pointing occurs in open loop (active optics and adaptive optics), and is used to
position the telescope to within the capture range of the AGWS in the GIR, with
which to achieve higher accuracy pointing and guiding on targets. Typically, an
initial blind pointing is performed once in the beginning of the night to remove
systematic errors due to temperature and flexure, so as to establish a nominal
pointing origin, and fine-tune the initial pointing model for the night.
Subsequent blind pointing checks may be required throughout the night to achieve
the higher precision.

After the telescope positions a target to within the capture range of the AGWS
via blind pointing, the four probes of the GIR will reposition to acquire guide
stars in the telescope focal plane, which improves the pointing to sub-arcsecond
accuracy. The fine pointing accuracy requirements are referenced to, and
measured at, the center of the field of view delivered to the science
instruments located at either the direct Gregorian or folded ports, under
natural seeing. To meet the requirements for fine pointing, it is necessary to
correct for the physical offsets and differential flexure between the science
instrument and the telescope via the pointing model.

**Telescope tracking** keeps a celestial coordinate position fixed in the field
of view, by rotating the telescope elevation, azimuth, and GIR axes. Tracking
uses look-up tables that account for mount errors and relative flexure between
the telescope structure and the instrument.

**Fine guiding** operates in closed loop, using the positions of guide stars on
the AGWS or On-Instrument Wavefront Sensor (OIWFS) to make slight adjustments to
maintain much more accurate telescope positions, removing the effects of wind
buffeting, mechanical errors, time-dependent flexures, or other perturbations.
Guiding adjustments are small corrections on top of the telescope sky-tracking
rate. GMT will use four guide-probes in the AGWS to sense pointing and guiding
errors in three axes (elevation, azimuth, and rotation in GIR).

Several tracking modes will be implemented: Sidereal, non-sidereal, GIR fixed
rotator, GIR field, GIR parallactic, and GIR fixed pupil. Non-sidereal tracking
is used for scanning or for solar system targets where the AGWS and the OIWS
track at the sidereal rate while the telescope mount guides on the science
target to maintain its position fixed in the science detector reference frame.

**Drift scanning** is an observing technique to obtain imaging or spectroscopy
data over an area of the sky by allowing the telescope pointing to drift at a
constant rate relative to the sky motion. During scanning, depending on the
science goal, the science detectors may be synchronized and read out
continuously to minimize image smearing, or they may stay in continuous
integration. In continuous scanning mode, the AGWS continuously tracks guide
stars to maintain mirror figure and pointing accuracy.  However, as the guide
stars may move outside the guider field during integration, the pointing kernel
is responsible for finding and reacquiring guide stars somewhere in the field
seamlessly and automatically.

**Pointing offsets** are used during observing to reposition the science
detector relative to the pointing origin of the telescope. Offsetting is used
for many purposes, such as to obtain sky observations, to position objects onto
a slit or aperture, to create mosaic observations, etc.

The **telescope pointing kernel**, in cooperation with the WFCS system, performs
telescope pointing, tracking, acquisition, and guiding. There are requirements
for the different observing modes (natural seeing, LTAO, NGSAO).  In the event
that the active optics system is disabled, the pointing kernel is required to
continue telescope guiding and tracking.
