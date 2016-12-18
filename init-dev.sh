#redis-server &
#while inotifywait -e close_write Client/js/libs/*.js; do cat Client/js/libs/chart-utils.js Client/js/libs/graph.js > Client/js/loader.js &
coffee -w --output Client/js/libs/ Client/js/libs-coffee/ #&
#python Server/server.py &
