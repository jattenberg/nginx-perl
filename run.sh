#!/bin/bash

echo "starting fcgiwrap";

/etc/init.d/fcgiwrap start;

echo "starting nginx";

nginx -g 'daemon off;';

echo "now running nginx";
