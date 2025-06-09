function  Q=set_parametersRS()
% 2025.04.28
% Roessler  system (RS)
%     RS  parameters
% RS.mat:       a, b, c 
Q.a=0.2; 
Q.b=0.2;
Q.c=5.7; 
%      Model parameters
% Param1.mat: n,  h, tau, Ntau, Ndel, m, j0, degree
%            j0=imn-Ntau = (Ndel-1)*Ntau+1
n=50; % number in series coupled prediction models
Q.n=n; % number in series coupled prediction models. Debug
h=0.05; % sampling time
Q.h=h;
tau=1.5;  % embedding time
Ntau=round(tau/h); % must be integer
Q.Ntau=Ntau;
tau=Ntau*h; 
Q.tau=tau;
Ndel=3; % number of delays
Q.Ndel=Ndel;
m=Ndel+1; % embedding dimension
Q.m=m;
% imn = (m-1)*Ntau+1,  m=Ndel+1 ->
% imn = Ndel*Ntau+1
% j0=imn-Ntau = (Ndel-1)*Ntau+1
Q.j0=(Q.Ndel-1)*Q.Ntau+1;  
degree=13; % degree of nonlinearity
Q.degree=degree;

% Param2.mat: TL, L, TP, LP, bet
TL=2000; % Learning interval
L=round(TL/h); % A number of points in the learning interval
TL=L*h; % My 
Q.TL=TL;
Q.L=L;
TP=2000; % Prediction interval
LP=round(TP/h); % Number of points in the prediction interval
Q.LP=LP;
TP=LP*h; 
Q.TP=TP;
bet=1e-8; % ridge regression parameter
Q.bet=bet;

% Param3.mat: Tin, Lin, Ninitcond, deltaX
Tin=1000; % Change of initial conditions on the strange attractor
Lin=round(Tin/h);
Q.Lin=Lin;
Tin=Lin*h;
Q.Tin=Tin;
Ninitcond=1;
Q.Ninitcond=Ninitcond;
deltaX=100; 
Q.deltaX=deltaX;
% !!
%LamNj.mat:  lamNj(1,lamNjsz)  for Fig1 (a)
lamNj=[-10  -5  -1 -0.7 -0.6];
Q.lamNj=lamNj;
lamNjsz=length(lamNj);
%LamNl.mat:  lamNl(1,lamNlsz)  for Fig1 (b)
lamNl=[-10  -5  -1 -0.7 -0.6]; % 2025.04.28
Q.lamNl=lamNl;
lamNlsz=length(lamNl);
Q.lamNlsz=lamNlsz;
% LamNsz.mat : lamNjlsz=[lamNjsz lamNlsz]
lamNjlsz=[lamNjsz lamNlsz];
Q.lamNjlsz=lamNjlsz;
end