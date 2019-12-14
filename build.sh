#!/usr/bin/env bash

set -o errexit

command=$1
context=$2
environment=$3

if [[ $command == "compile" ]]; then
  rm -rf public/assets/vendor
  mkdir -p public/assets/vendor
  cp vendor/* public/assets/vendor

  if [[ $context == "js" ]] || [[ $context == "all" ]]; then

    yarn run eslint --ext .js,.vue javascripts --fix

    if [[ $environment == "dev" ]]; then

      yarn run webpack \
        --env.NODE_ENV=development \
        --env.DEV_TOOL=inline-source-map

    elif [[ $environment == "prod" ]]; then

      yarn run webpack \
        --env.NODE_ENV=production \
        --env.DEV_TOOL=

    fi
  fi

  if [[ $context == "css" ]] || [[ $context == "all" ]]; then
    if [[ $environment == "dev" ]]; then

      rm -rf public/assets/stylesheets
      mkdir -p public/assets/stylesheets/

      yarn run sass \
        stylesheets/app.scss \
        public/assets/stylesheets/app.css

    elif [[ $environment == "prod" ]]; then

      yarn run sass \
        stylesheets/app.scss \
        public/assets/stylesheets/app.css \
        --style compressed \
        --no-source-map

    fi
  fi

  if [[ $context == "html" ]] || [[ $context == "all" ]]; then

    yarn run eslint --ext .html views --fix

    rm -rf public/*.html
    cp views/index.html public/index.html

  fi

  if test -f "public/index.html"; then
    sed -i "s/v=.*\"/v=$(date +%s)\"/g" public/index.html
  fi
fi


if [[ $command == "watch" ]]; then

  inotifywait -e close_write -r ./ |
  while read -r directory events filename; do
    clear;
    printf "\nUpdating $directory$filename\n\n"

    if [[ $filename == *".css"* ]]; then
      ./build.sh compile "css" $environment
      printf "\n"; ./build.sh watch $context $environment
    elif [[ $filename == *".scss"* ]]; then
      ./build.sh compile "css" $environment
      printf "\n"; ./build.sh watch $context $environment
    elif [[ $filename == *".js"* ]]; then
      ./build.sh compile "js" $environment
      printf "\n"; ./build.sh watch $context $environment
    elif [[ $filename == *".vue"* ]]; then
      ./build.sh compile "js" $environment
      printf "\n"; ./build.sh watch $context $environment
    elif [[ $filename == *".html"* ]]; then
      ./build.sh compile "html" $environment
      printf "\n"; ./build.sh watch $context $environment
    fi
  done

fi
