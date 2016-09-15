
.. _BaseLinearAxisController:

.. code-block:: coffeescript

    properties:
        max_torque:
            desc:     "This property shall indicate the configured maximum permissible
                       torque in the motor. The value shall be given per thousand of rated
                       torque."
            type:     "uint16"
            pattern:  "pull"
            max_rate: 1
            default:  1000

        motor_rated_torque:
            desc:     "This property shall indicate the configured motor rated torque.
                       It is taken from the motors nameplate. All relative torque
                       data shall refer to this value. For linear motors, the object
                       name is not changed, but the motor rated force value shall be
                       entered as multiples of mN (milliNewton). The value shall be 
                       given in mNm (milli Newton metre)."
            type:     "uint32"
            pattern:  "pull"
            max_rate: 1
            default:  1000

        motion_profile_type:
            desc:     "This property shall indicate the configured type of motion profile
                       used to perform a profiled motion.

                         Value        | Definition
                         -------------|----------------------------------
                         -32768 to -1 | Manufacturer-specific
                         0            | Linear ramp (trapezoidal profile)
                         1            | Sin2 ramp
                         2            | Jerk-free ramp
                         3            | Jerk-limited ramp
                         4 to 32767   | Reserved"
            type:     "int16"
            pattern:  "pull"
            max_rate: 1
            default:  0

*BaseLinearAxisController Specification File excerpt*
