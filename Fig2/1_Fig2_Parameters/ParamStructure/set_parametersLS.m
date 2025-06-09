function  Q=set_parametersLS()
% 2025.04.25
%  Lorenz system (LS)
%  (x',y',z') = -sig*(x-y);
%                   r*x - y -x*z;
%                   x*y -b*z 

% LS parameters: 
%  LS.mat:      sig, r, b 
format long
Q.sig=10; 
Q.r=28;
Q.b=8/3; 

%      Model parameters
% Param1.mat: n,  h, tau, Ntau, Ndel, m, j0, degree
%            j0=imn-Ntau = (Ndel-1)*Ntau+1
n=30; %  default
Q.n=n; % number in series coupled prediction models
h=0.005; % sampling time
Q.h=h;
tau=0.15;  % embedding time
Ntau=round(tau/h); % must be integer
Q.Ntau=Ntau;
tau=Ntau*h; 
Q.tau=tau;

Ndel=7; % number of delays
Q.Ndel=Ndel;
m=Ndel+1; % embedding dimension
Q.m=m;
% imn = (m-1)*Ntau+1,  m=Ndel+1 ->
% imn = Ndel*Ntau+1
% j0=imn-Ntau = (Ndel-1)*Ntau+1
Q.j0=(Q.Ndel-1)*Q.Ntau+1;  
degree=7; % degree of nonlinearity
Q.degree=degree;

% Param2.mat: TL, L, TP, LP, bet
TL=300; % Learning interval
L=round(TL/h); % A number of points in the learning interval
Q.L=L;
TL=L*h;
Q.TL=TL;

TP=300; % Prediction interval
LP=round(TP/h); % Number of points in the prediction interval
Q.LP=LP;
TP=LP*h; 
Q.TP=TP;

bet=1e-7; % ridge regression parameter
Q.bet=bet;

% Param3.mat: Tin, Lin, Ninitcond, deltaX
Tin=150; % Change of initial conditions on the strange attractor
Lin=round(Tin/h);
Q.Lin=Lin;
Tin=Lin*h;
Q.Tin=Tin;

Ninitcond=1; % number of initial conditions
Q.Ninitcond=Ninitcond;
deltaX=300; % For Fig2 (b)
Q.deltaX=deltaX;

%LamNj.mat:  lamNj(1,lamNjsz)  for Fig2 (a)
%lamNj=[-100  -50  -40 -30 -20 -10 -5 -1];
lamNj=[-100  -50  -30 -20 -10]; % 2025.04.25
Q.lamNj=lamNj;
lamNjsz=length(lamNj);
Q.lamNjsz=lamNjsz;

% lamNl -> LamNl.mat, for Fig2 (b);
%lamNl=[-100 -50 -30 -20 -10 -5];
lamNl=[-100  -50  -30 -20 -10]; % 2025.04.25
Q.lamNl=lamNl;
lamNlsz=length(lamNl);
Q.lamNlsz=lamNlsz;

% LamNsz.mat : lamNjlsz=[lamNjsz lamNlsz]
lamNjlsz=[lamNjsz lamNlsz];
Q.lamNjlsz=lamNjlsz;
end