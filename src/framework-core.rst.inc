
.. _core_framework:

Core Framework
--------------

The GMT SWCS architecture is based on a distributed component design.
Distributed Components have been used in the design of different telescope
projects like GTC, ALMA, ATST49 and is considered by next generation projects50.
In the past, this architecture has been implemented using object-oriented
middleware, most commonly based on the OMG CORBA51 standard. Although CORBA
provides several benefits, it also has some limitations, especially when trying
to implement robust communication patterns other than Remote Procedure Calls
(RPC). Still, a distributed component model is valid and provides high-level
entities that can be mapped into object-oriented designs.

Components are the basic building blocks in the SWCS architecture. Components
are used to represent the main elements of a system and the relations between
them. A Component* is specified and defined by a set of Features (Table 10-60).

The semantics of the Component Features (see example in Table 10-49) are
specified in Model Definition Files (MDF). MDFs use the same syntax as the SDFs,
but their intent is to define the concrete semantics of model elements. The
Features of a Component define the component interface as they express the
external view of the Component. See section 10.5.2.3 for a description of MDFs
and SDFs.

Section 10.3.4 introduces the Observatory Services as a set of `cross-cutting
concerns <http://en.wikipedia.org/wiki/Cross-cutting_concern>`_. The BaseComponent
class injects cross-cutting concerns with the use features that provide an
interface to the service adapters. When a new component extends the
BaseComponent class it gains access to all the observatory services through a
small set of inherited methods.


.. code-block:: coffeescript

  MKlass "Property",
      extends:    ["Port"]
      abstract:   false
      desc:       "Properties are the basic unit for component configuration"
      features:
          units:
          kind:   "reference"
          lower:  -1
          upper:  1
          type:   "UnitType"
          desc:   "Units"
      type:
          kind:   "attribute"
          lower:  1
          upper:  1
          type:   "BaseDataType"
          desc:   "Type of the Property"
      min:
          kind:   "attribute"
          lower:  -1
          upper:  1
          type:   "ValueType"
          desc:   "Minimum value of the property"
      max:
          kind:   "attribute"
          lower:  -1
          upper:  1
          type:   "ValueType"
          kind:   "Maximum value of the property"
      default:
          kind:   "attribute"
          lower:  1
          upper:  1
          type:   "ValueType"
          desc:   "Default value of the property"
