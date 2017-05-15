This repository contains the project's GitHub Pages located at
https://gmto.github.io/gmt_docs/html/

Software & Controls Documentation
=================================
Over the lifetime of the GMT Project, the SWC team will generate various forms of documentation for various different audiences. We follow [Agile principles](https://www.agilealliance.org/agile101/12-principles-behind-the-agile-manifesto/) and therefore value working code over comprehensive documentation, but we also recognize the power of efficient collaboration, knowledge sharing and transparency. 


## Locations

1. **[DocuShare](https://docushare.gmto.org/docushare/dsweb/View/Collection-7787)**

    This is the primary location for project documentation and archiving.

2. **[GMT Software and Controls Home](https://gmto.github.io/gmt_docs/html/)**

    Online documentation for Software Development teams and other users interacting with the software. The html files are generated from [reStructuredText](http://docutils.sourceforge.net/rst.html) files using [Sphinx](http://www.sphinx-doc.org/en/stable/) and hosted on GitHub. Source files as well as generated HTML files can be found in this repository.
    
    While the website served on GitHub will contain the latest documentation changes, stable documentation related to the current software release can be found on the [AWS Mirror](http://52.52.46.32/).

3. **[Wiki](https://github.com/GMTO/gmt_docs/wiki)**

    The Wiki contains quick links to important locations, meeting notes and other useful tips and tricks. Information that is central to the design, development or maintenance of GMT software or project management should NOT be documented in the wiki, but rather in [DocuShare](https://docushare.gmto.org/docushare/dsweb/View/Collection-7787).

## Building Online Documentation

The `master` branch contains the source files and html files for the project's GitHub Pages, served at
https://GMTO.github.io/gmt_model/html

The html files currently need to be generated manually before being checked in and requires `python3-sphinx` to build.

```
sudo dnf install -y python3-sphinx
make
```

