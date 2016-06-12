#!/usr/bin/env bash
g++ -o bin/add_program add_program.cpp
./xc -v -o bin/lab7 -I../root/lib lab7.c
./xc -v -o bin/lab7_user -I../root/lib lab7_user.c
./bin/add_program bin/lab7 bin/lab7_user
./xem bin/lab7