#!/usr/bin/env bash

for i in bin/*; do
    cp "$i" ~/.local/"$i"
done
