#!/bin/bash

if ! command -v npm; then
  echo "npm is required to run the script"
  exit 1
fi

npm init -y
devDependencies="
babel-core
babel-loader
babel-polyfill
babel-preset-env
cache-loader
copy-webpack-plugin
extract-text-webpack-plugin
file-loader
html-loader
html-webpack-plugin
i18n-webpack-plugin
js-yaml
rimraf
stylus
stylus-loader
webpack
webpack-dev-server
"

npm install --save-dev $devDependencies

mkdir -p src/styles
mkdir -p src/scripts
mkdir -p src/templates
mkdir -p src/assets/i18n
mkdir -p src/assets/images
mkdir -p src/assets/fonts
mkdir -p public

curl -L -s "https://www.gitignore.io/api/macos,linux,node" > .gitignore

curl -L -s "https://raw.githubusercontent.com/Allajah/static-website-scaffold/master/lib/index.html" > src/templates/index.html

curl -L -s "https://raw.githubusercontent.com/Allajah/static-website-scaffold/master/lib/index.js" > src/scripts/index.js

curl -L -s "https://raw.githubusercontent.com/Allajah/static-website-scaffold/master/lib/main.styl" > src/styles/main.styl

curl -L -s "https://raw.githubusercontent.com/Allajah/static-website-scaffold/master/lib/webpack.config.js" > webpack.config.js

curl -L -s "https://raw.githubusercontent.com/Allajah/static-website-scaffold/master/lib/ja.yml" > src/assets/i18n/ja.yml

curl -o src/assets/images/michelle.gif "https://raw.githubusercontent.com/Allajah/static-website-scaffold/master/lib/michelle.gif"

npm install add-npm-scripts
./node_modules/.bin/add-npm-scripts start "webpack-dev-server"
./node_modules/.bin/add-npm-scripts build "rimraf dist && webpack"
npm uninstall add-npm-scripts
