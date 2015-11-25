author: Min Ho Lee
        EMAIL: mlee432@gatech.edu
        GTID#: 903122265
date: 24 Nov 2015
readme.txt

Matrix A, b, x0, tolerance, and all the inputs have been initialized in script.m.
To modify inputs, modify script.m.
Run script.m to get the results and graph.
In script, 100 different x0 will be made in for loops and passed with matrix A, b, tolerance, x0, 
and M into jacobi_iter and gs_iter.
jacobi_iter.m and gs_iter.m compute and return number of iteration N and Xapprox.
All the small calculation such as average approximation, average N, ratio of Njacobi / Ngs, 
error of approximation will be done in script.m.
