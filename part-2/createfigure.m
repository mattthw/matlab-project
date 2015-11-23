function createfigure(gs_arr1, gs_arr2, S1, C1, jacobi_arr1, jacobi_arr2, C2)
%CREATEFIGURE(GS_ARR1, GS_ARR2, S1, C1, JACOBI_ARR1, JACOBI_ARR2, C2)
%  GS_ARR1:  scatter x
%  GS_ARR2:  scatter y
%  S1:  scatter s
%  C1:  scatter c
%  JACOBI_ARR1:  scatter x
%  JACOBI_ARR2:  scatter y
%  C2:  scatter c

%  Auto-generated by MATLAB on 22-Nov-2015 17:03:01

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create scatter
scatter(gs_arr1,gs_arr2,S1,C1,'DisplayName','gs_arr(:,2) vs gs_arr(:,1)',...
    'MarkerFaceColor',[0 0 1]);

% Create scatter
scatter(jacobi_arr1,jacobi_arr2,S1,C2,...
    'DisplayName','jacobi_arr(:,2) vs jacobi_arr(:,1)',...
    'MarkerFaceColor',[0 0 0]);

% Create xlabel
xlabel('Initial Errors');

% Create ylabel
ylabel('N');
