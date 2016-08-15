.. _Contribute:

Contribute
==========

Code
----
        
1. Create a user account on github
2. Contact GMTO staff to be be granted access to our repositories
3. Fork
4. Clone a local copy

.. code-block:: bash

   man git 


Documentation
-------------

The documentation is build using Sphinx.
Github uses the branch `gh-pages` to serves the documentation.
Get the `python3-sphinx` package to build the documentation.

.. note::
   Please submit changes to the gh-pages in two steps:

   * First, commit your changes to `src`
   * Then, commit the generated pages from `make`


.. code-block:: bash

   git checkout -b gh-pages
   git pull origin gh-pages

   git commit src
   make
   git commit -a

 

