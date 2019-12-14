#!/usr/bin/env bash

set -o errexit

pycodestyle *.py
pylint *.py
