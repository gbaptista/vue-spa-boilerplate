#!/usr/bin/env bash

yarn run eslint --ext .js,.vue javascripts --fix
yarn run eslint --ext .html views --fix
