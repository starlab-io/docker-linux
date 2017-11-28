#!/bin/sh -eux

mkdir artifacts

fakeroot debian/rules clean

fakeroot debian/rules binary-headers binary-generic binary-perarch skipdbg=false

cp ../*.deb artifacts
