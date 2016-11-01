#! /usr/bin/env python3

from component import Controller

class IsampleFilterWheelCtrl(Controller):

    def setup(self):
        print('IsampleFilterWheelCtrl setup')

        # Input ports
        self.motor_state     = self.new_input_port(0, 'motor_state')

        # Output ports
        self.motor_ctrl      = self.new_output_port(0,'motor_ctrl')
        self.heartbeat_out   = self.new_output_port(1,'heartbeat_out')

    def step(self):
        if self.setup_ok:
            # Add code here

from os import environ as env; env['PYTHONINSPECT']='True'
app = IsampleFilterWheelCtrl('gmt://default/isample_filter_wheel_ctrl:7000', 1e6)
app.start()
