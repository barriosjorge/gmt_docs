.. _Contribute:

Contribute
==========

Code
----
        
1. Create a user account on github
2. Contact GMTO staff to be be granted access to our private repositories
3. Fork on github
4. Clone a local copy for development

.. code-block:: bash

   man git 


Documentation
-------------

The documentation is built using Sphinx.
Github uses the branch `gh-pages` to serve the documentation pages.
Install the `python3-sphinx` and `python3-sphinx_rtd_theme` packages to build the documentation using `dnf`.

.. code-block:: bash

   sudo dnf install -y python3-sphinx python3-sphinx_rtd_theme


.. note::
   Please make sure to submit changes to the gh-pages in two steps:

   * First, commit your changes to `src`
   * Then, commit the generated pages from `make`


.. code-block:: bash

   git checkout -b gh-pages origin/gh-pages

   # edit src/*
   # make
   # xdg-open html/index.html
   # ... iterate

   # ready for pull-request
   git commit src
   git commit -a -m '- generated content'



 

