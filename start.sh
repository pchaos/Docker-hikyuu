#!/bin/bash
set -e
vpara="-v $(pwd)/hikyuu:/home/fasiondog/hikyuu -v $(pwd)/archives:/tmp/archives"

docker run -i $vpara -t hikyuu:hikyuutest  /bin/bash

echo Bye
