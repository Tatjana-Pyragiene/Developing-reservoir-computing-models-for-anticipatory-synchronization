function Main_Lorenz_Y_dyn()
%  Creates dynamic  files for figure Fig2 (c)
%        Lorenz system
%	 (x',y',z') = -sig*(x-y);
%                   r*x - y -x*z;
%                   x*y -b*z 
%  or 
% X = [y(1); y(2); y(3)]
 %	dX/dy = -sig*(y(1)-y(2));
%                   r*y(1) - y(2) -y(1)*y(3);
%                   y(1)*y(2) -b*y(3) 

%     Y = x = y(1)

% Prediction Y variables of the Lorenz system 
% by synchronization with a  reconstructed mode
% Arbitrary number (n) in series coupled predicting models (prediction time is n*tau)

close all
fclose all;
clearvars

Q=ReadParametersLS();
Q=Read_lam_icond(Q);
Q.kfig=0;

% Dynamics
 % Initial conditions for Lorenz system
 y0=[-6.924443285060142 -12.968332920785745  10.820682533915615]';
 Q=DynFiles(Q,y0);
 WriteFiles(Q);

 close all;
clearvars
disp('FIN')
end


 
 
