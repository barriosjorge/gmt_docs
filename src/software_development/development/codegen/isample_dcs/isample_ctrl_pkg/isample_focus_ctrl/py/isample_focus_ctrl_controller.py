#! /usr/bin/env python3

from component import Controller

class IsampleFocusCtrl(Controller):

    def setup(self):
        print('IsampleFocusCtrl setup')

        # Input ports
        self.hmi_inputs      = self.new_input_port(0, 'hmi_inputs')
        self.motor_state     = self.new_input_port(1, 'motor_state')

        # Output ports
        self.hmi_outputs     = self.new_output_port(0,'hmi_outputs')
        self.motor_ctrl      = self.new_output_port(1,'motor_ctrl')
        self.heartbeat_out   = self.new_output_port(2,'heartbeat_out')

    def step(self):
        if self.setup_ok:
            # Add code here

from os import environ as env; env['PYTHONINSPECT']='True'
app = IsampleFocusCtrl('gmt://default/isample_focus_ctrl:7000', 1e6)
app.start()
