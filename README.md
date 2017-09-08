# container-image-template

[![Build Status](https://travis-ci.org/container-images/systemtap.svg?branch=master)](https://travis-ci.org/container-images/systemtap)

SystemTap running in a container.


## Usage

You can use atomic command to run systemtap container:

```
$ atomic run modularitycontainers/systemtap
```

Once you are in the shell, you can try some simple systemtap scripts:

1. "hello world" with systemtap:
  ```
  $ stap -e 'probe begin { println("hello world"); }'
  hello world
  ^C
  ```

2. script to print backtrace from a selected kernel function:
  ```
  [root@3fe0ab87451e /]# stap -e 'probe kernel.function("generic_make_request") { prinbacktrace() }'
   0xffffffff9b3dd2f0 : generic_make_request+0x0/0x2d0 [kernel]
   0x0 (inexact)
   0xffffffff9b3dd2f0 : generic_make_request+0x0/0x2d0 [kernel]
   0x0 (inexact)
  ```

For complete guide to this container, please see the [help page](https://github.com/container-images/systemtap/blob/master/help/help.md).
