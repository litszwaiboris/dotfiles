#! /bin/bash

checkupdates | awk 'END{print NR}'
