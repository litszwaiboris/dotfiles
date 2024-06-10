#! /bin/bash

join -j1 \
    <(dnf repoquery --quiet --installed --queryformat '%{name}.%{arch} %{evr}' | sort) \
    <(dnf repoquery --quiet --upgrades --queryformat '%{name}.%{arch} %{evr}' | sort) \
    | column -t | awk 'END{print NR}'
