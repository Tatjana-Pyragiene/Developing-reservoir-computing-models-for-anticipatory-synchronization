function Main_Lorenz_Y_RMSEj()
% For Fig2 (a),     creating  RMSEj.mat (RMSE  vs  j  by different lam)
%           Lorenz system  (LS)
% X = [y(1); y(2); y(3)]
% dX/dt=[-sig*(y(1)-y(2)); 
%             r*y(1) - y(2) -y(1)*y(3); 
%             y(1)*y(2) - b*y(3)];

% Prediction of variable Y = y(1) of the Lorenz system
% by synchronization with the reconstructed model.
%     Prediction time is j*tau
%  j - the number of sequentially connected predictive models
%  j = 1, 2, ..,n, 
%  n - the maximum j

close all
fclose all;
clearvars


Q=ReadParametersLS();
Q.Tin=200;
Q.Lin=round(Q.Tin/Q.h);
Q.Tin=Q.Lin*Q.h;
 y0=[-6.924443285060142 -12.968332920785745  10.820682533915615]';   
 Main1_Lorenz_Y_RMSEj_Files(Q,y0);
   
close all;
fclose all;
clearvars
disp('FIN')
end
 
 
