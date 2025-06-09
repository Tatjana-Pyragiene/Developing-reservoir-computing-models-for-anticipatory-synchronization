function Main_Rossler_Parameters()
% Creates  parameter files for figure Fig. 1
%        Roessler system  (RS)
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3); 
%               y(1)+a*y(2); 
%               b+y(3)*(y(1)-c)];
%  Observed variable:   Y = y(2)

close all
fclose all;
clearvars

% Desired conditional Lyapunov exponent
 Q.lam=-5; % Optimal lam      
 Q.icond=1; %  Number of init. cond 
% LamIcond.mat: lam, icond:
 Write_lam_icond(Q); 

 Q=set_parametersRS();       

 WriteParametersRS(Q);
 % rs.mat, param1.mat,  param2.mat, param3.mat
 % rs.mat: Roessler parameters:  a, b, c 
 % param1.mat: n, h, tau, Ntau, Ndel, m, j0,degree
 % param2.mat: TL, L, TP, LP, bet
 % param3.mat: Tin, Lin, Ninitcond, deltaX  

 % Dynamics
 % Initial conditions for the Roessler system
 %   y0=[-4.520140972669869   1.626348273059146   0.020136376909945].'; 

 clearvars

close all;
clearvars
disp('FIN')
end