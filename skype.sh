#!/bin/bash
PULSE_LATENCY_MSEC=60 LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so skype $0
