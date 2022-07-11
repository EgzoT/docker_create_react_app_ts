#!/bin/bash

if [[ -f ./project_data/package.json ]]; then
    cp project_data/package.json project/package.json
    cp project_data/package-lock.json project/package-lock.json
    cp project_data/tsconfig.json project/tsconfig.json

    cd project

    npm install
    npm start
else
    npx -y create-react-app my-app --template typescript

    cd my-app

    mkdir ../project/public/
    cp -r public/. ../project/public/
    mkdir ../project/src/
    cp -r src/. ../project/src/

    cp package.json ../project/package.json
    cp package.json ../project_data/package.json
    cp package-lock.json ../project/package-lock.json
    cp package-lock.json ../project_data/package-lock.json
    cp tsconfig.json ../project/tsconfig.json
    cp tsconfig.json ../project_data/tsconfig.json
    cp ./.gitignore ../project/.gitignore
    cp ./.gitignore ../project_data/.gitignore

    cd ..
    rm -r my-app

    cd project
    npm install
    npm start
fi
