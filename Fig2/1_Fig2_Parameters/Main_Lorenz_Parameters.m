function Main_Lorenz_Parameters()
% Creates  parameter files for figure Fig2
%     Y = y(1)
% Prediction Y variables of the Lorenz system 
% by synchronization with a  reconstructed mode
% Arbitrary number (n) in series coupled predicting models (prediction time is n*tau)
%       Lorenz system  (LS)
% X = [y(1); y(2); y(3)]
% dX/dt=[-sig*(y(1)-y(2)); 
%             r*y(1) - y(2) -y(1)*y(3); 
%             y(1)*y(2) - b*y(3)];

close all
fclose all;
clearvars

% desired conditional Lyapunov exponent
 Q.lam= -100; % Optimal lam      
 Q.icond=1; %  Number of init. cond 
 % LamIcond.mat:  [lam, icond]
  Write_lam_icond(Q); 

 Q=set_parametersLS();       

 WriteParametersLS(Q);
 % LS.mat, Param1.mat,  Param2.mat, Param3.mat
 % LS.mat: Roessler parameters:  a, b, c 
 % Param1.mat: n, h, tau, Ntau, Ndel, m, j0,degree
 % Param2.mat: TL, L, TP, LP, bet
 % Param3.mat: Tin, Lin, Ninitcond, deltaX  

close all;
clearvars
disp('FIN')
end