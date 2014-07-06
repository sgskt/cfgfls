#!/bin/bash
for f in $(ls | grep -v '\.sh'); do
    ln -f -s $PWD/$f $HOME/.$f
done
