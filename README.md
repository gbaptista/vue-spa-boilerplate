# Boilerplate for VueJS Single-page application

## Compile

```bash
yarn install

./build.sh compile all dev
./build.sh compile all prod

./build.sh compile html dev
./build.sh compile css dev
./build.sh compile js dev

./build.sh compile html prod
./build.sh compile css prod
./build.sh compile js prod
```

### Watcher

The watcher automatic compiles the changed files:

```bash
./build.sh watch all dev
./build.sh watch all prod
```

## HTTP Server
```bash
python http-server.py
# Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

## Linters
```bash
yarn install
./javascript-linter.sh

pip install -r requirements-dev.txt
./python-linter.sh
```
