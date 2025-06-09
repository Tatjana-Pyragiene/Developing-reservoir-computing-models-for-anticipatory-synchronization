function Q=DynFiles(Q,y0)
n=Q.n;
h=Q.h;
L=Q.L;
LP=Q.LP;

Lin=Q.Lin;
icond=Q.icond;
deltaX=Q.deltaX;
Lin=Lin+(icond-1)*deltaX;
[X0,Y0,Z0]=Roessler_signal(h,Lin,y0,Q);
y0=[X0(end),Y0(end),Z0(end)].';
[~,Y0,~]=Roessler_signal(h,L+LP-1,y0,Q);
Q=predict(Y0,Q);
U=Q.U;
XP=Q.XP;

j0=Q.j0;
% Computing the rms error for different j
rmsj=zeros(n,1);
nj=1:n;
stdp=std(U);
Ntau=Q.Ntau;
for j=1:n
delj=XP(j0:LP-j*Ntau,j)-U(j0+j*Ntau:LP);
rmsj(j)=sqrt(mean(delj.^2))/stdp;
end
Q.nj=nj;
Q.rmsj=rmsj;

%disp('RMSE error for tau prediction time')
%disp(rmsj(1));
%disp('RMSE error for n*tau prediction time')
%disp(rmsj(n));

% Param4.mat =[Q.Lagr, Q.Error, Q.LyapCond, Q.rmsj(1),Q.rmsj(n)];
% rmsj(1) - RMSE error for tau prediction time
% rmsj(n) - RMSE error for n*tau prediction time
%WriteParameters1(Q); %  Param4.mat
%disp('Continue - F5') % Debug
%keyboard              % Debug
% --------------
%   Files for figures F2 and Fig3
%Fig2:  Phase portraits(Fig2a,Fig2b) and RMSE(nj) (Fig2c - not here) 
  % Fig2a: plot(U0,XP0)
  % U0    = y(t)
  % XP0   = y_{pr}(t)

U0=U(j0:LP);
Q.U0=U0;

XP0=XP(j0:LP,n);
Q.XP0=XP0;

  % Fig2b: plot(U2,XP2)   
  % U2  = y(t+n*tau)
  % XP2 = y_pr(t)
U2=U(j0+n*Ntau:LP);
Q.U2=U2;
% XP2=XP(1+(Ndel-1)*Ntau:LP-n*Ntau,n)
XP2=XP(j0:LP-n*Ntau,n); 
Q.XP2=XP2;
 
% Time: t1, t2
TP=Q.TP;
LP=Q.LP;
Tpr=linspace(0,TP,LP); 
TL=Q.TL;
t1=TL+Tpr(j0:end);
Q.t1=t1;
t2=TL+Tpr(j0:LP-n*Ntau);
Q.t2=t2;
% Fig3: U1 vs t1, XP1 vs t1, U2 vs t2
%  U1=y(t)
U1=U(j0:end);
Q.U1=U1;
% XP1=Y_{pr}(t)
XP1=XP(j0:end,n);
Q.XP1=XP1;
% Fig2.2: del=y_pr -y(t+n*tau) -> (XP2-U2) vs t2
% del=XP(j0:LP-n*Ntau,n)-U(j0+n*Ntau:LP);
% XP2=Y_{pr}(t)
%XP2=XP(j0:LP-n*Ntau,n); % in Fig2b
%Q.XP2=XP2;
Q.lenU0=length(U0);
Q.lenU1=length(U1);
Q.lenU2=length(U2);
Q.lenXP0=length(XP0);
Q.lenXP1=length(XP1);
Q.lenXP2=length(XP2);
Q.lent1=length(t1);
Q.lent2=length(t2);
end