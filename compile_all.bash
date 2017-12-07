#!/bin/bash

rm -f ebin/*.beam
erlc -o ebin/ src/*.erl test/*.erl
