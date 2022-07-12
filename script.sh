#!/bin/bash

if [[ -f ./project/package.json ]]; then
    cd project
    npm install
    npm start
else
    npx -y create-react-app my-app --template typescript

    cp -r my-app/. project/.
    rm -r my-app

    cd project
    chown -R node:node /project/node_modules
    chown -R node:node /project/public
    chown -R node:node /project/src
    chown -R node:node /project/package.json
    chown -R node:node /project/package-lock.json
    chown -R node:node /project/tsconfig.json
    npm install
    npm start
fi
