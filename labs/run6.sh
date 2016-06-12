#!/usr/bin/env bash
g++ -o bin/add_program add_program.cpp
./xc -v -o bin/lab6 -I../root/lib lab6.c
./xc -v -o bin/lab6_user -I../root/lib lab6_user.c
./bin/add_program bin/lab6 bin/lab6_user
./xem bin/lab6
