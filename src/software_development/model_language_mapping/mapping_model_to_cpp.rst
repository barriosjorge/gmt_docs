.. _mapping_model_to_cpp:

Mapping between the Model Definition Files and C++ source code
---------------------------------------------------------------

.. _map-cpp-file-tree:

C++ source code file tree structure
...................................

The C++ generated source files are located under the ``<MODULE_DIR>/src/cpp``
directory, which has the following structure::

   <MODULE_DIR>/
      |-- ...
      |-- src/
            |-- ...
            |-- cpp/
                  |-- build/
                  |-- include/
                  |-- <pk_1_pkg>/
                  |-- ...
                  |-- <pk_n_pkg>/
                  |
                  |-- Makefile


Makefile
    The ```Makefile``` file contains the directives to include the system wide
    make rules that are defined in ``$GMT_GLOBAL``. Users can modify it to add
    the specific Makefile definitions that are needed for the module, but the
    recommended way is to use the ```module.mk``` file of each package.

build/
    The ```build/``` directory is the place where the compilation products will
    be generated

include/
    The ```include/``` directory contains the generated include files which must
    be part of the module external interface. In general, the contents of the
    this directory are the include files for the
    module-defined data types. In addition, in the ```include/```` directory there
    is one convenience header file (```<module>_port_types.h```) that contains
    the includes to all of the module
    headers.

<pk_i_pkg>/
    One directory is created for each package defined in the DCS definition
    file of the model. The name of the directory is exactly the same name
    that was given to the package *(note: the suffix of the name should be
    `_pkg`; see the Model Specification Guide document for more details)*.

The structure inside the package directories is as follows::

    <pk_i_pkg>/
        |
        |-- module.mk
        |
        |-- <comp_1>/
        |-- ...
        |-- <comp_n>/
        |
        |-- <a_1>_app.cpp
        |-- ...
        |-- <a_n>_app.cpp

<comp_i>/
    For each component there is a directory where all its source files are
    placed. The name of the directory is the same as the component. See :numref:`map-cpp-map-component` for more details.

<a_i>_app.cpp
    For each application defined in the model for the current package there
    is a C++ file which contains the source of the application. See :numref:`map-cpp-map-application` for more details.

module.mk
    The ```module.mk``` file contains all the directives that are needed
    to compile and link the current package. See :numref:`map-cpp-map-makefiles` for
    more details.

Data types mapping
..................

Primitive types
^^^^^^^^^^^^^^^

The mapping from the model primitive types to the corresponding C++ types can be
found in the following table

   ==============   ===========================
     Model Type       C++ type
   ==============   ===========================
   Integer          int
   String           std::string
   Boolean          bool
   Date             struct tm
   TimeStamp        struct timeval
   TimeInterval     struct timeval
   void             void
   bool             bool
   byte             uint8_t
   char             char
   uchar            unsigned char
   int              int
   int8             int8_t
   int16            int16_t
   int32            int32_t
   int64            int64_t
   uint             unsigned int
   uint8            uint8_t
   uint16           uint16_t
   uint32           uint32_t
   uint64           uint64_t
   float            float
   float32          float
   float64          double
   float128         long double
   string           std::string
   complex          std::complex<float>
   complex64        std::complex<double>
   complex128       std::complex<long double>
   TimeValue_ns     struct timespec
   TimeValue_us     struct timeval
   TimeValue_Date   struct tm
   ==============   ===========================


Struct types
^^^^^^^^^^^^^

The data types defined in the model files as ```StructType``` are
mapped to C++ struct types. The C++ definition is generated to a
header file inside the ```include/``` directory, with its name
equal to the user-defined type name.

For example, one structured type defined in the model as

.. code-block:: coffeescript

    StructType "my_struct",
        desc: "Struct type example"
        elements:
            data_field1: {type: "String", desc: "This is field 1"}
            data_field2: {type: "Integer", desc: "This is field 2"}
            data_field3: {type: "my_other_struct", desc: "This is field 3"}
            data_field4: {type: "float[4]", desc: "This is field 4"}

will have its C++ representation in the ```include/my_struct.h``` file,
with the following contents:

.. code-block:: cpp

    #pragma once
    #include <msgpack.hpp>
    #include <string>
    #include <array>
    #include <vector>

    struct my_struct {
        std::string          data_field1;    // This is field 1
        int                  data_field2;    // This is field 2
        my_other_struct      data_field3;    // This is field 3
        std::array<float,4>  data_field4;    // This is field 4

        MSGPACK_DEFINE_MAP(data_field1, data_field2, data_field3)
    };

As it can be seen in the example, the types of the fields can either be
primitive types, user-defined types and arrays or sequences.

The ```MSGPACK_DEFINE_MAP``` directive allows the C++ instances of this
type to be serialized automatically by the `msgpack library <https://msgpack.org/>`_.

Enumerated types
^^^^^^^^^^^^^^^^

The ```Enum``` types defined in the DCS model files are mapped to C++
as `enum classes <https://en.cppreference.com/w/cpp/language/enum>`_. The
labels of the C++ enum class will be the literals defined in the Enum type
in the model, and in the same order.


A header file will be generated for each ```Enum``` type. These headers
will be named after the type name, and they
will be placed in the ```include/``` directory.

As an example, if we have the following enumerated type in the
```<module_name>_dcs_types.coffee``` model file,

.. code-block:: coffeescript

    Enum "my_enum_type",
    desc: "An enumerated type"
    literals:
        THE_FIRST_LABEL:     {desc: "First label of the enumerate"}
        THE_SECOND_LABEL:    {desc: "First label of the enumerate"}
        THE_THIRD_LABEL:     {desc: "Third label of the enumerate"}

then the generated C++ file will be ```include/my_enum_type.h```, and
its contents will be:

.. code-block:: cpp

    #pragma once

    enum class my_enum_type : std::uint8_t { THE_FIRST_LABEL=0,
                                             THE_SECOND_LABEL=1,
                                             THE_THIRD_LABEL=2};
    MSGPACK_ADD_ENUM(my_enum_type)

As in the Struct Type mapping, the ```MSGPACK_ADD_ENUM``` directive allows
the variables of this type to be automatically serialized by msgpack.

.. _map-cpp-map-component:

Component mapping
.................

Each Component has its own directory in the file tree of the package it
belongs to, as shown in :numref:`map-cpp-file-tree`. The Component
directory will have the following contents::

    <pk_i_pkg>/
       |-- ...
       |-- <component_name>
             |-- <component_name>.h
             |-- <component_name>.cpp
             |-- <component_name>_step.cpp
             |-- <component_name>_setup.cpp
             |-- <component_name>_msgpack.h
             |-- <component_name>_app.cpp

The name of the Component directory and the prefix of all the generated
source files inside it is equal to the Component name.

Component header file
^^^^^^^^^^^^^^^^^^^^^

The C++ class definition of the component is located in the ```<component_name>.h```
file. The name of the class is set as the name defined in the model file, but
in CamelCase. For example, a component named ```my_component``` in the
model files would be mapped as a class named ```MyComponent```.

The generated class will inherit from the C++ version of the superclasses listed
in the ```extends``` list of the component model. In the following table
there is the list of the mapping between the most common model superclasses and
the corresponding C++ base classes:

     =========== =============== ===============
     Model class extends item    C++ class
     =========== =============== ===============
     Component   BaseComponent   Component
     Controller  BaseController  BaseController
     Supervisor  BaseController  BaseController
     Adapter     HwAdapter       HwAdapter
     Adapter     EthercatAdapter EthercatAdapter
     =========== =============== ===============


As an example, if we have the following component in the model definition:

.. code-block:: coffeescript

    Component         'my_component',
        info:          'My Component'
        desc:          'This is an example component'
        extends:       ['BaseComponent']
        abstract:      false
        uses:          ["ocs_core_fwk", "ocs_ctrl_fwk"]

        state_vars:
            my_state1:
                desc:               'One State Var'
                type:               'my_custom_type'
                max_rate:           1000
                blocking_mode:      'async'
                is_controllable:    true

        input_ports:
            my_input_port1:
                desc:            'One input port'
                type:            'Integer'
                protocol:        'pull'
                max_rate:        1000
                blocking_mode:   'async'

        output_ports:
            my_output_port1:
                desc:            'One output port'
                type:            'float64'
                protocol:        'push'
                max_rate:        1000
                blocking_mode:   'async'

        properties:
            my_prop1:  {type: 'float32',  default: 30.0, desc: 'One property'}

then the generated C++ class would be:

.. code-block:: cpp

    #ifndef _my_component_h_
    #define _my_component_h_

    #include "ocs_core_fwk.h"
    #include "ocs_ctrl_fwk.h"
    #include "../../include/my_subsystem_port_types.h"

    class MyComponentSetup;

    namespace gmt
    {

    class MyComponent : public BaseComponent
    {
        public:
            MyComponent(
                const std::string& comp_uri,
                const std::string& comp_name,
                const std::string& comp_host,
                int comp_port,
                const std::string& comp_acl,
                float comp_scan_rate);

            virtual ~MyComponent();

            void setup() override;
            void step(bool setup_ok) override;

        protected:

            typedef MyComponentSetup Setup;

            virtual void create_config() override;

            // Create state variables
            StateVar<my_custom_type> my_state1_sv;

            // Input port declaration
            int   my_input_port1;     // One input port

            // Output port declaration
            float my_output_port1;  // One output port

            // Configuration properties
            double my_prop1;  //One property


    };

    } // namespace gmt

    #endif   // _my_component_h_

As we can see, the contents of the class definition are: the overridden methods from the base class,
the State Variables definition, the Input Ports definition, the Output Ports
definition and the Properties definition.

Supervisor specific mapping
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hardware Adapter specific mapping
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Controller specific mapping
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _map-cpp-map-application:

Applications mapping
....................

.. _map-cpp-map-makefiles:

Makefiles
.........
