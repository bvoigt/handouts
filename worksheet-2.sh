#!/bin/sh

## Configure git

git config --global user.name bvoigt
git config --global user.email brian.voigt@uvm.edu

## Change the "origin" remote URL and push
git remote set-url origin git@github.com:bvoigt/handouts.git
git push --all

## Set upstream
git remote add upstream https://github.com/sesync-ci/handouts.git
git pull upstream master
