#!/bin/bash

echo Exercise 1
echo -----------------------------------------------------------------
./main -g -i ../examples/ex01.cfg -o g.txt && ./main -b -i ../examples/ex01.cfg -o b.txt
meld g.txt b.txt
echo -----------------------------------------------------------------
echo

echo Exercise 2
echo -----------------------------------------------------------------
./main -g -i ../examples/ex02.cfg -o g.txt && ./main -b -i ../examples/ex02.cfg -o b.txt
meld g.txt b.txt
echo -----------------------------------------------------------------
echo

echo Exercise 3
echo -----------------------------------------------------------------
./main -g -i ../examples/ex03.cfg -o g.txt && ./main -b -i ../examples/ex03.cfg -o b.txt
meld g.txt b.txt
echo -----------------------------------------------------------------
echo

echo Exercise 4
echo -----------------------------------------------------------------
./main -g -i ../examples/ex04.cfg -o g.txt && ./main -b -i ../examples/ex04.cfg -o b.txt
meld g.txt b.txt
echo -----------------------------------------------------------------
echo

echo Exercise 5
echo -----------------------------------------------------------------
./main -g -i ../examples/ex05.cfg -o g.txt && ./main -b -i ../examples/ex05.cfg -o b.txt
meld g.txt b.txt
echo -----------------------------------------------------------------
echo