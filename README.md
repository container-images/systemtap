# container-image-template

[![Build Status](https://travis-ci.org/container-images/container-image-template.svg?branch=master)](https://travis-ci.org/container-images/container-image-template)

This is a template of a git repository which is a source for building container images.


There are two templates within this repository on two different branches:

 1. `master` — template for images with multiple versions

 2. `single` — image with only one single version


## Description

 * `help` - a directory containing `help.md` file. This serves as a base for container help page. It can be templated on per-version and per-os\_variant bases. On executing `make doc` in a `<version>/<os_variant>/` directory, it will search for `<version>/root/help.values` and `<version>/<os_variant>/root/help.values`, source these two scripts (if they exist) and run `envsubst` (environment variable substitution) to obtain `help.md` specific to the currently `make`-ed image.
 * `LICENSE` — pick the right license
 * `Makefile` — so it's easy to build, run, test
 * `openshift-template.yml` - general OpenShift template. A postfix template https://github.com/container-images/postfix/blob/master/openshift-template.yml
  * update it. It includes several commands what to update
 * `README.md` — global documentation for the whole service
  * what is it, how to build, how to use
 * `tests/` — these tests should verify that the image works

### Image specific files and directories

 * `Dockerfile` — default Dockerfile, should be based on Fedora now (will likely change in future)
 * `Makefile` - so it's easy to build, run, test and convert help file
 * `examples/` — directory with examples that demonstrate the image functionality:
   * these examples should be ideally present in a form of documentation
   * code samples are welcome too
 * `files/` — this is the place where you should store configuration, helper scripts, etc.
 * `README.md` — version specific documentation
 * `root/` - place for help files
   * `help.md` - Container manual page. Use the ```go-md2man``` command to convert it : `go-md2man -in=help.md -out=help.1`
   * `help.1` - Generated manual page.
