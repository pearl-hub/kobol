Kobol
=====

|Project Status|Communication|
|:-----------:|:-----------:|
|[![Build status](https://api.travis-ci.org/pearl-hub/kobol.png?branch=master)](https://travis-ci.org/pearl-hub/kobol) | [![Join the gitter chat at https://gitter.im/pearl-hub/kobol](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pearl-hub/kobol?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |

**Table of Contents**
- [Description](#description)
- [Quickstart](#quickstart)
- [Installation](#installation)
- [Troubleshooting](#troubleshooting)

Description
===========

- name: `kobol`
- description: `man` wrapper for reading user manuals from markdown files.
- author: Filippo Squillace
- username: fsquillace
- OS compatibility: linux, osx

Quickstart
==========

- Create the markdown file `mymanual.md` in `$KOBOL_VARDIR/markdown`.

- To view the content of it as a manual (the manual will be generated just before viewing it):

```sh
$ kobol mymanual
```

Every `man` options can be used in `kobol` as well.
For instance for searching according to the keyword *banana* :

```sh
$ kobol -K banana mymanual
```

`kobol` creates the corresponding manual in `$KOBOL_VARDIR/mans` directory.


Installation
============
This package needs to be installed via [Pearl](https://github.com/pearl-core/pearl) system.

```sh
pearl install kobol
```

`kobol` requires the [ronn](https://github.com/rtomayko/ronn)
command to be installed:

```sh
gem install ronn
```

Dependencies
------------
The main dependencies are the following:

- [Pearl](https://github.com/pearl-core/pearl)
- [ronn](https://github.com/rtomayko/ronn)

Troubleshooting
===============
This section has been left blank intentionally.
It will be filled up as soon as troubles come in!
