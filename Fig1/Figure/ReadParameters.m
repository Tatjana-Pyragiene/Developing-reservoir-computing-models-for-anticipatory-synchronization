function  Q=ReadParameters()
% Reading  parameters from  *.mat files
 
% Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3);  
%             y(1)+a*y(2);
%             b+y(3)*(y(1)-c)];
% Roessler system parameters:  a, b, c
s=load("Structure\RS.mat");
Q.a=s.RS(1).f;
Q.b=s.RS(2).f;
Q.c=s.RS(3).f;

%Param1= [ n, h, tau, Ntau, Ndel, m, j0,degree]
s=load("Structure\Param1.mat");
% n is a number in series coupled prediction models.
Q.n=s.Param1(1).f;

Q.h=s.Param1(2).f;     % h is a sampling time
Q.tau=s.Param1(3).f;  % tau is the embedding delay time

% Ntau  is the number of time steps  
% between successive time-delayed observations 
Q.Ntau=s.Param1(4).f;  % must be an integer, Ntau=tau/h

Q.Ndel=s.Param1(5).f;  %  Ndel is a  number of delays
Q.m=s.Param1(6).f;    % m is  embedding dimension  (m=Ndel+1)

% j0 is an important parameter often used in calculations
Q.j0=s.Param1(7).f;   % j0= (Ndel-1)*Ntau+1

Q.degree=s.Param1(8).f; %  degree is  a degree of non-linearity

% Param2 = [TL, L, TP, LP, bet]
s=load("Structure\Param2.mat");
Q.TL=s.Param2(1).f; % TL  is a duration of the training phase

% L is a number of points in the training interval
Q.L=s.Param2(2).f;   %  must be an integer, L=TL/h

% TP is a duration of the prediction phase
Q.TP=s.Param2(3).f;

% LP is a number of points in the prediction interval
Q.LP=s.Param2(4).f; %    must be an integer, LP=TP/h
Q.bet=s.Param2(5).f; % bet is a ridge regression parameter

% Param3=[Tin, Lin, Ninitcond,deltaX]
s=load("Structure\Param3.mat");
% Tin  is a duration of the transition time interval
Q.Tin=s.Param3(1).f;

% Lin is the number of points in the Tin interval 
Q.Lin=s.Param3(2).f; % must be an integer, Lin=Tin/h 

% Ninitcond is a number of initial conditions
% for the learning phase.
% Here, Ninitcond = 1. This value is used for Fig1 (a), (c), (d).
%    Ninitcond is modified just before creating 
%    the dynamic data files for Fig.1(b).
Q.Ninitcond=s.Param3(3).f;

% deltaX means the time interval , 
% which is added to the  last value of the transition interval
% in order to change the initial conditions for the training phase of
% calculations.
Q.deltaX=s.Param3(4).f;
end