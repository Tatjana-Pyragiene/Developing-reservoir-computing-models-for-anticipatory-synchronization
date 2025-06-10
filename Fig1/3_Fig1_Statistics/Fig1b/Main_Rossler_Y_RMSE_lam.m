function Main_Rossler_Y_RMSE_lam()
%        Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3);  y(1)+a*y(2);  b+y(3)*(y(1)-c)];
%     Y = y(2)
% Prediction Y(t)   variables of the Roessler system 
% by synchronization with a  reconstructed mode
% Arbitrary number (n) in series coupled predicting models (prediction time is n*tau)

close all
clearvars


% RS.mat, Param1.mat,  Param2.mat,  Param3.mat
    Q=set_parameters();
  % RS.mat: Roessler parameters:  a, b, c 
  % Param1_d.mat: n, h, tau, Ntau, Ndel, m, j0,degree
  % Param2.mat: TL, L, TP, LP, bet
  % Param3.mat: Tin, Lin, Ninitcond, deltaX
    Q.n=25;
    Q.Ninitcond=100;
    Q.deltaX=2000;
    Q=set_lam(Q);
    Q.lamNlsz=length(Q.lamNl);
    
    % Initial conditions for Roessler system
    y0=[-4.520140972669869   1.626348273059146   0.020136376909945]'; 
    % Dynamics
    Q=RMSElam(Q,y0);
    Write_rmse(Q);    
close all;
clearvars
disp('FIN')
end


 
 
