#!/usr/bin/env bash
./xc -o ../root/bin/c -I../root/lib ../root/bin/c.c
./xc -v -o bin/lab8 -I../root/lib lab8.c
./xmkfs sfs.img ../root
mv sfs.img ../root/etc/.
./xmkfs fs.img ../root
./xem -f fs.img bin/lab8