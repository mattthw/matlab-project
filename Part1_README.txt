Every function in part 1 should be run on Matlab's command window.

To creatine a matrix A, put the entries within a set of brackets. Separate entries on the same row
with commans and use a semicolon to denote a new row. Ex: A=[1,1,1,1;1,2,3,4;1,3,6,10;1,4,10,20] will
be the 4x4 Pascal matrix. Alternatively, A=pascal(n) will set A to the nxn pascal matrix.

To create a vector b, please enter it in its transpose form, because my functions assume
that b will be entered in its transpose form. Ex: Enter b as b=[1,1/2,1/3,1/4] and not b=[1;1/2;1/3;1/4]

1(a) To run the LU decomposition in the command window, set A to an nxn matrix, Then type: [L,U,error]=lu_fact(A).
     My lu_fact function will then print out L, U, and the error from LU-A.
     
1(b)To run the QR decomposition in the command window, set A to an nxn matrix, Then for householder
     reflections, type: [Q,R,error]=qr_fact_househ(A). My qr_fact_househ function will print out Q, R, and the
     error from QR-A. For givens rotations, type [Q,R,error]=qr_fact_givens(A). My qr_fact_givens function will
     print out Q, R, and the error from QR-A.
     
1(c)To run solve_lu_b, define an nxn matrix A, and an nx1 matrix b in its transpose form(see above). Then
     in the command window, type: [x,error]=solve_lu_b(A,b). My solve_lu_b function will then print the resulting 
     vector x, and the error from Ax-b. To run solve_qr_b with matrix A and vector b in its transpose form,
     in the command window, type: [xhouseh,xgivens,househerror,givenserror] = solve_qr_b(A,b). My function will 
     print the resulting x from householder reflections, the resulting x from givens rotations, the householder 
     reflection error, and the givens rotation error.
     
1(d)I have run my programs myself on the n=2...12 pascal matrices and corresponding vectors b and I have 
     recorded the resulting x, error from LU decomposition, error from householder reflections, error for givens
     rotations, and the error from Px-b. I have attached this portion to the written section for part 1.
     
1(e)I plotted the errors as a line graph and attached the chart with the errors for each function as a pdf called
    part1errors.

1(f)The written portion for part 1 contains both part 1d and 1f.

