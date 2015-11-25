author: Matthew Thomas McCoy
        EMAIL: mmccoy37@gatech.edu
        GTID#: 903178186
        PHONE: 678-822-8901
date: 26 Nov 2015
README.txt

How to Run Part A:
==================
- "RUNA.m" is the script need to be run. It pulls data for
   matrix A from 'testa.dat' and vector from 'testb.dat'.

   the vector v which is used as an initial guess for matrix A
   NEEDS to be in vertical form. meaning:
   x1
   x2
   x3
   rather than [x1 x2 x3]. This is because if we transform it inside of the function
   it will alter dimmensions every loop and throw an error at iteration 1 or 2.

How to Run Part B/C:
===================

- "RUNB.m" is the script need to be run. It will randomly generate 1000 2x2 matrices,
   then run them through the power method and graph them.

Explanation of Graph:
=====================
- saved as pdf called "graph-explanation.pdf" in this directory


Explanation of Files in Directory:
=====================================
-"RUNA.m" script: for part A
-"RUNB.m" script: for part b/c
-"power_method.m" function: power method for a matrix
-"inverse." function: inverse a matrix
-"generate_matrices.m" function: create 1000 random matrices
    over the interval [-2, 2]
-"createfigure(2).m" functions: build scatter plot for data
-"testa/b.dat" supplied .dat file examples for program.

further explanations are available within files in the form
of file headers and commments.



Questions? Comments? Concerns?
Email and contact info @ README file header