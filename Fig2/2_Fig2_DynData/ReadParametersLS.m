function  Q=ReadParametersLS()
% 2025.04.15
% Lorenz system
% (x',y',z') = -sig*(x-y);
%              r*x - y -x*z;
 %             x*y -b*z 
s=load("ParamStructure/LS.mat");
Q.sig=s.LS(1).f;
Q.r=s.LS(2).f;
Q.b=s.LS(3).f;

% Parameters
% Param1: n, h, tau, Ntau, Ndel, m, j0,degree    
s=load("ParamStructure/Param1.mat");
Q.n=s.Param1(1).f;
Q.h=s.Param1(2).f;
Q.tau=s.Param1(3).f;
Q.Ntau=s.Param1(4).f;
Q.Ndel=s.Param1(5).f;
Q.m=s.Param1(6).f;
Q.j0=s.Param1(7).f;
Q.degree=s.Param1(8).f;

% Param2: TL, L, TP, LP, bet
s=load("ParamStructure/Param2.mat");
Q.TL=s.Param2(1).f;
Q.L=s.Param2(2).f;
Q.TP=s.Param2(3).f;
Q.LP=s.Param2(4).f;
Q.bet=s.Param2(5).f;

% Tin, Lin, Ninitcond,deltaX
s=load("ParamStructure/Param3.mat");
Q.Tin=s.Param3(1).f;
Q.Lin=s.Param3(2).f;
Q.Ninitcond=s.Param3(3).f;
Q.deltaX=s.Param3(4).f;
s=load("ParamStructure/LamNsz.mat");
% LamNsz.mat: lamNjlsz = [lamNjsz, lamNlsz]
Q.lamNjsz = s.LamNsz(1).f;
Q.lamNlsz= s.LamNsz(2).f;
lamNjsz=Q.lamNjsz;
lamNlsz=Q.lamNlsz;
Q.lamNjlsz=[lamNjsz lamNlsz];

%  LamNj.mat - lamNj,  for Fig1c;
    s=load("ParamStructure/LamNj.mat");
    lamNj=zeros(1,lamNjsz); 
    for i0=1:lamNjsz
        lamNj(1,i0)=s.LamNj(i0).f;
    end    
    Q.lamNj=lamNj;

%  LamNl.mat - lamNl,  for Fig1d; 
s=load("ParamStructure/LamNl.mat");
lamNl=zeros(1,lamNlsz);   
    for i0=1:lamNlsz
        lamNl(1,i0)=s.LamNl(i0).f;
    end    
    Q.lamNl=lamNl;    
end