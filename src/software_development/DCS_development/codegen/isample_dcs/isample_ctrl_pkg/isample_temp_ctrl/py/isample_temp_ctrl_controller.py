#! /usr/bin/env python3

from component import Controller

class IsampleTempCtrl(Controller):

    def setup(self):
        print('IsampleTempCtrl setup')

        # Input ports
        self.temperatures    = self.new_input_port(0, 'temperatures')

        # Output ports
        self.heartbeat_out   = self.new_output_port(0,'heartbeat_out')

    def step(self):
        if self.setup_ok:
            # Add code here

from os import environ as env; env['PYTHONINSPECT']='True'
app = IsampleTempCtrl('gmt://default/isample_temp_ctrl:7000', 1e6)
app.start()
