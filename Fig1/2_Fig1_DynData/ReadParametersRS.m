function  Q=ReadParametersRS(Q)
% Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3); y(1)+a*y(2); b+y(3)*(y(1)-c)];
% Roessler parameters:  a, b, c
s=load("ParamStructure\RS.mat");
Q.a=s.RS(1).f;
Q.b=s.RS(2).f;
Q.c=s.RS(3).f;

% Parameters
% n, h, tau, Ntau, Ndel, m, j0,degree
s=load("ParamStructure\Param1.mat");
Q.n=s.Param1(1).f;
Q.h=s.Param1(2).f;
Q.tau=s.Param1(3).f;
Q.Ntau=s.Param1(4).f;
Q.Ndel=s.Param1(5).f;
Q.m=s.Param1(6).f;
Q.j0=s.Param1(7).f;
Q.degree=s.Param1(8).f;

% Param2: TL, L, TP, LP, bet
s=load("ParamStructure\Param2.mat");
Q.TL=s.Param2(1).f;
Q.L=s.Param2(2).f;
Q.TP=s.Param2(3).f;
Q.LP=s.Param2(4).f;
Q.bet=s.Param2(5).f;

% Tin, Lin, Ninitcond,deltaX
s=load("ParamStructure\Param3.mat");
Q.Tin=s.Param3(1).f;
Q.Lin=s.Param3(2).f;
Q.Ninitcond=s.Param3(3).f;
Q.deltaX=s.Param3(4).f;
end