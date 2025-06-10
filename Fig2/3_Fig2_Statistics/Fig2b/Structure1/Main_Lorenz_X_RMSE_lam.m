function Main_Lorenz_X_RMSE_lam()
% Creates  file RMSEls.mat for figure Fig2 (b)
%        Lorenz system
%	 (x',y',z') = -sig*(x-y);
%                   r*x - y -x*z;
%                   x*y -b*z 
%     Observed variable  Y = x
close all
clearvars

% Reading  parameters:   
%  Param1.mat:  n,  h, tau, Ntau, Ndel, m, j0, degree
%  Param2.mat: TL, L, TP, LP, bet
%  Param3.mat: Tin, Lin, Ninitcond, deltaX
%  LS.mat: sig, r, b  -  Lorenz system parameters  
%   Q.lamNl=[-100 -50 -30 -20 -10 -5]
%   Q.lamNlsz = 6

Q=ReadParameters(); 
Q.n=15;
Q.Ninitcond=100;

Q.lamNlsz=Q.lamNlsz-1;
lamNjsz=Q.lamNjsz;
lamNlsz=Q.lamNlsz;
Q.lamNjlsz=[lamNjsz lamNlsz];

 % Initial conditions for Lorenz system
    y0=[-6.924443285060142 -12.968332920785745  10.820682533915615]';         
RMSElam(Q,y0);
close all;
clearvars
disp('FIN')
end


 
 
