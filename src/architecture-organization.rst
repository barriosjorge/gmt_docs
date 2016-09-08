

Organization
------------

The first phase of the SWCS development starts with the domain engineering
process (clause 7.3.1 of ISO12207) that allows one to identify the main
architectural components of the SWCS and to group them into uniform categories
of: subsystems, packages and components, following the criteria of internal
affinity, rate of change propagation and interface size.

.. _swcs-organization:

.. figure:: _static/swcs-organization.png

   SWCS Organization

The above figure illustrates the organization hierarchy using the Unified
Modeling Language (UML) diagram.  System, Domain, Subsystem and Packages are
aggregations that make up the hierarchy of the GMT software and control
Components, meaning that a system contains multiple domains, a domain contains
multiple subsystems, and so forth. The Classifier class provides basic naming
and description attributes. The Configuration Item class extends Product
Breakdown Element (PBE) and Work Breakdown Element (WBE) classes to enable
mapping of the SWCS structure to the GMT project Product Breakdown Structure and
Work Breakdown Structure.

