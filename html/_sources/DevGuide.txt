.. _DevGuide:

Developer's Guide
=================

DCSS is the Device Control System Startup. It is a python interpreter
extended with C++ bindings to the IO Framework library.


Invoking DCSS
-------------

.. code-block:: bash
  
  dcss [file]


**dcss** takes an optional json file with the description of the IO fieldbuses.
If no file is provided, **dcss** will automatically scan the first ethercat master it encounters.

A sample definition file for the hardware development kit can be found
`here <https://github.com/mdcb-gmt/gmtx/blob/refactoring/gmt_iofwk/examples/hdk/hdk.json>`_.

Hardware Development Kit (HDK) example
--------------------------------------

**dcss** provides a number of globally scoped variable for convenience.
*fb\<n\>* is a handle to the n-th fieldbus. *fb* is a handle to the fieldbus.
Typically there will be only one fieldbus attached to your system, hence allows
you to use the *fb* shortcut.

Obtaining information about the hdk fieldbus:

.. code-block:: python

  >>> fb
  <gmt.ecx.ecxx.IghFieldbus object at 0x7f6551449830>

IghFieldbus have an EtherCAT master:

.. code-block:: python

  >>> fb.master
  <gmt.ecx.ecxx.EcatMaster object at 0x7f6551449fa0>

Obtaining information about the hdk fieldbus nodes:

.. code-block:: python

  >>> pprint([(x.uri,type(x)) for x in fb.nodes])
  [('bh_ek1100_00', <class 'gmt.ecx.ecxx.EcatSlave'>),
   ('bh_el1809_01', <class 'gmt.ecx.ecxx.IO_EL1809_00100000'>),
   ('bh_el2809_02', <class 'gmt.ecx.ecxx.IO_EL2809'>),
   ('bh_el3002_03', <class 'gmt.ecx.ecxx.IO_EL3002_00140000'>),
   ('bh_el3202_04', <class 'gmt.ecx.ecxx.IO_EL3202_0011000a'>),
   ('bh_el4032_05', <class 'gmt.ecx.ecxx.IO_EL4032_00130000'>),
   ('bh_el7041_06', <class 'gmt.ecx.ecxx.IO_EL7041_00170000'>),
   ('bh_ek1110_07', <class 'gmt.ecx.ecxx.EcatSlave'>)]

Fieldbuses provides their nodes as locally scoped variable for convenience.
Those are named after the nodes' URI. Hence the following handles on HDK:
fb.bh_el1809_01, 
fb.bh_el2809_02, 
fb.bh_el3002_03, 
fb.bh_el3202_04, 
fb.bh_el4032_05, 
fb.bh_el7041_06

For example:

.. code-block:: python

  >>> fb.bh_el7041_06
  <gmt.ecx.ecxx.IO_EL7041_00170000 object at 0x7f6551449b40>

Using DCSS interactively
------------------------

All the Component in the IO framework have a report() method.
The output is in json, readily consummable for scripting. A
pretty print report method ppr() is provided to help interactivity:


.. code-block:: python

  >>> pprint([(k,v['definition']['desc']) \
             for k,v in fb.bh_el7041_06.report()['pdos'].iteritems()])

  [('1A03601003', 'STM Status: Status__Warning'),
   ('1A01600005', 'ENC Status: Status__Counter overflow'),
   ('1A01600004', 'ENC Status: Status__Counter underflow'),
   ('1A01600003', 'ENC Status: Status__Set counter done'),
   ('1A01600002', 'ENC Status: Status__Latch extern valid'),
   ('1A01600001', 'ENC Status: Status__Latch C valid'),
   ('1A0360100D', 'STM Status: Status__Digital input 2'),
   ('1A0360100E', 'STM Status: Status__Sync error'),
   ('1A0360100C', 'STM Status: Status__Digital input 1'),
   ('1A01600009', 'ENC Status: Status__Status of input A'),
   ('1A01600008', 'ENC Status: Status__Extrapolation stall'),
   ('1A06602011', 'POS Status: Actual position'),
   ('1606702021', 'POS Control: Velocity'),
   ('1606702022', 'POS Control: Start type'),
   ('1606702023', 'POS Control: Acceleration'),
   ('1606702024', 'POS Control: Deceleration'),
   ('1A03601010', 'STM Status: Status__TxPDO Toggle'),
   ('1606702002', 'POS Control: Control__Emergency stop'),
   ('1A06602004', 'POS Status: Status__Error'),
   ('1606702001', 'POS Control: Control__Execute'),
   ('1A06602021', 'POS Status: Actual velocity'),
   ('1601700011', 'ENC Control: Set counter value'),
   ('1A06602003', 'POS Status: Status__Warning'),
   ('1602701003', 'STM Control: Control__Reduce torque'),
   ('1602701002', 'STM Control: Control__Reset'),
   ('1602701001', 'STM Control: Control__Enable'),
   ('1A06602001', 'POS Status: Status__Busy'),
   ('1A06602005', 'POS Status: Status__Calibrated'),
   ('1A06602022', 'POS Status: Actual drive time'),
   ('1A06602007', 'POS Status: Status__Decelerate'),
   ('1A06602002', 'POS Status: Status__In-Target'),
   ('1A01600010', 'ENC Status: Status__TxPDO Toggle'),
   ('1A0160000E', 'ENC Status: Status__Sync error'),
   ('1A0160000D', 'ENC Status: Status__Status of extern latch'),
   ('1A06602006', 'POS Status: Status__Accelerate'),
   ('1A0160000B', 'ENC Status: Status__Status of input C'),
   ('1A0160000A', 'ENC Status: Status__Status of input B'),
   ('1A01600011', 'ENC Status: Counter value'),
   ('1A03601006', 'STM Status: Status__Moving negative'),
   ('1A03601007', 'STM Status: Status__Torque reduced'),
   ('1A03601004', 'STM Status: Status__Error'),
   ('1A03601005', 'STM Status: Status__Moving positive'),
   ('1A03601002', 'STM Status: Status__Ready'),
   ('1A01600012', 'ENC Status: Latch value'),
   ('1A03601001', 'STM Status: Status__Ready to enable'),
   ('1601700003', 'ENC Control: Control__Set counter'),
   ('1601700002', 'ENC Control: Control__Enable latch extern on positive edge'),
   ('1601700001', 'ENC Control: Control__Enable latch C'),
   ('1606702011', 'POS Control: Target position'),
   ('1601700004', 'ENC Control: Control__Enable latch extern on negative edge')]




.. code-block:: python

  >>> fb.bh_el1809_01.ppr()
  {'class': 'IO_EL1809',
   'desc': 'auto-scanned',
   'inp_sz': 2L,
   'mapped': True,
   'modef': {'dtype': 'bh_el1809',
             'file_name': 'bh_el1809_00100000',
             'inp_sz': 2L,
             'out_sz': 0L,
             'product_code': 118566994L,
             'revision_number': 1048576L,
             'vendor_id': 2L},
   'mst_id': 0L,
   'out_sz': 0L,
   'pdos': {'1A00600001': {'bit_position': 0L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 1: Input',
                                          'dir': 2L,
                                          'index': 24576L,
                                          'pdo': 6656L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A01601001': {'bit_position': 1L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 2: Input',
                                          'dir': 2L,
                                          'index': 24592L,
                                          'pdo': 6657L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A02602001': {'bit_position': 2L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 3: Input',
                                            'dir': 2L,
                                            'index': 24608L,
                                            'pdo': 6658L,
                                            'subindex': 1L,
                                            'typ': 'BOOL'},
                             'offset': 0L,
                             'value': True},
            '1A03603001': {'bit_position': 3L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 4: Input',
                                          'dir': 2L,
                                          'index': 24624L,
                                          'pdo': 6659L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A04604001': {'bit_position': 4L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 5: Input',
                                          'dir': 2L,
                                          'index': 24640L,
                                          'pdo': 6660L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A05605001': {'bit_position': 5L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 6: Input',
                                          'dir': 2L,
                                          'index': 24656L,
                                          'pdo': 6661L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A06606001': {'bit_position': 6L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 7: Input',
                                          'dir': 2L,
                                          'index': 24672L,
                                          'pdo': 6662L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A07607001': {'bit_position': 7L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 8: Input',
                                          'dir': 2L,
                                          'index': 24688L,
                                          'pdo': 6663L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 0L,
                           'value': False},
            '1A08608001': {'bit_position': 0L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 9: Input',
                                          'dir': 2L,
                                          'index': 24704L,
                                          'pdo': 6664L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A09609001': {'bit_position': 1L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 10: Input',
                                          'dir': 2L,
                                          'index': 24720L,
                                          'pdo': 6665L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A0A60A001': {'bit_position': 2L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 11: Input',
                                          'dir': 2L,
                                          'index': 24736L,
                                          'pdo': 6666L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A0B60B001': {'bit_position': 3L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 12: Input',
                                          'dir': 2L,
                                          'index': 24752L,
                                          'pdo': 6667L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A0C60C001': {'bit_position': 4L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 13: Input',
                                          'dir': 2L,
                                          'index': 24768L,
                                          'pdo': 6668L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A0D60D001': {'bit_position': 5L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 14: Input',
                                          'dir': 2L,
                                          'index': 24784L,
                                          'pdo': 6669L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A0E60E001': {'bit_position': 6L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 15: Input',
                                          'dir': 2L,
                                          'index': 24800L,
                                          'pdo': 6670L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False},
            '1A0F60F001': {'bit_position': 7L,
                           'definition': {'bit_length': 1L,
                                          'desc': 'Channel 16: Input',
                                          'dir': 2L,
                                          'index': 24816L,
                                          'pdo': 6671L,
                                          'subindex': 1L,
                                          'typ': 'BOOL'},
                           'offset': 1L,
                           'value': False}},
     'slave_position': 1L,
     'slave_pvt': {'slave_config_state': {'al_state': 8L,
                                          'changes': {'al_state': 0L,
                                                      'online': 0L,
                                                      'operational': 0L},
                                          'online': 1L,
                                          'operational': 1L}},
     'syncunit_id': 0L,
     'uri': 'bh_el1809_01'}



A Simple Program
----------------

The following script illustrate a simple program that will toggle the digital ouput
on the el2809 IO module. Look at the leds on the box for confirmation

.. code-block:: python

  >>> import time
  >>> do = 0
  >>> while True:
         fb.bh_el2809_02.set_value(do % 0xf)
         do += 1
         time.sleep(0.1)


Another Simple Example
----------------------

The following script will match the digital input signal on the digital output channel:
Press the buttons on the HDK and check the state of the leds.

.. code-block:: python

  >>> import time
  >>> while True:
         fb.bh_el2809_02.set_value(fb.bh_el1809_01.get_value())
         time.sleep(0.1)


Motion Control Example
----------------------

The following script will init and move the HDK motor.

.. code-block:: python

  >>> fb.bh_el7041_06.init()
  >>> while True:
         fb.bh_el7041_06.move(3000,{'velocity': 2000})
         print 'POS Status: Actual position', fb.bh_el7041_06.pdo_read(0x1A06602011)
         fb.bh_el7041_06.move(0,{'velocity': 4000, 'relative': False})
         print 'POS Status: Actual position', fb.bh_el7041_06.pdo_read(0x1A06602011)


Asynchronous Motion Control Example
-----------------------------------

The following script will move the HDK motor and invoke a callback asyncronously

.. code-block:: python

  >>> def when_done(done, status, node):
         """called asynchronously while the motion progresses"""
         print done, status, node

  >>> fb.bh_el7041_06.move(0,{},when_done)
  0

  >>> 
  False, 0, <gmt.ecx.ecxx.IO_EL7041_00170000 object at 0x7f3c3c7b3fa0>
  False, 0, <gmt.ecx.ecxx.IO_EL7041_00170000 object at 0x7f3c3c7b3fa0>
  ...
  False, 0, <gmt.ecx.ecxx.IO_EL7041_00170000 object at 0x7f3c3c7b3fa0>
  True, 0, <gmt.ecx.ecxx.IO_EL7041_00170000 object at 0x7f3c3c7b3fa0>



Finding Out More
----------------

The python interpreter comes with command completion enabled. You can find more
about objects using introspection, and of course refer to the C++ definition
for the reference implementation.

.. code-block:: python

  >>> fb.bh_el7041_06.<TAB>
  fb.bh_el7041_06.datum(
  fb.bh_el7041_06.desc
  fb.bh_el7041_06.syncunit_id
  fb.bh_el7041_06.uri
  fb.bh_el7041_06.estop(
  fb.bh_el7041_06.init(
  fb.bh_el7041_06.inp_sz
  fb.bh_el7041_06.master
  fb.bh_el7041_06.modef
  fb.bh_el7041_06.move(
  fb.bh_el7041_06.out_sz
  fb.bh_el7041_06.pdo_dump(
  fb.bh_el7041_06.pdo_read(
  fb.bh_el7041_06.pdo_write(
  fb.bh_el7041_06.pdp(
  fb.bh_el7041_06.pds(
  fb.bh_el7041_06.ppr(
  fb.bh_el7041_06.report(
  fb.bh_el7041_06.sdo_dump(
  fb.bh_el7041_06.sdo_read(
  fb.bh_el7041_06.sdo_write(
  fb.bh_el7041_06.slave_position


:ref:`[back to top] <DevGuide>`



