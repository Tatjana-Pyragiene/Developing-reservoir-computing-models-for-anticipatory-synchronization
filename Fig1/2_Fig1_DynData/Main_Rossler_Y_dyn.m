function Main_Rossler_Y_dyn()
% 2025.04.28
% Creates  dyn. files for figures Fig1 (c) and Fig1 (d)
%        Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3); 
%             y(1)+a*y(2); 
%             b+y(3)*(y(1)-c)];
%  Observed variable:   Y = y(2)

close all
fclose all;
clearvars

% RS.mat, Param1.mat,  Param2.mat, Param3.mat
  % RS.mat: Roessler parameters:  a, b, c 
  % Param1.mat: n, h, tau, Ntau, Ndel, m, j0,degree
  % Param2.mat: TL, L, TP, LP, bet
  % Param3.mat: Tin, Lin, Ninitcond, deltaX  
   Q=ReadParametersRS();

    Q=Read_lam_icond(Q);   
    
% Initial conditions for the Roessler system
    y0=[-4.520140972669869   1.626348273059146   0.020136376909945]'; 
    Q=DynFiles(Q,y0);
    WriteFiles(Q);
close all;
clearvars
disp('FIN')
end


 
 
