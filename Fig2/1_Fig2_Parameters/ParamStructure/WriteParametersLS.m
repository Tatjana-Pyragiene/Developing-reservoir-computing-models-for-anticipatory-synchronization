function  WriteParametersLS(Q)
% Lorenz system
% Y = [y(1); y(2); y(3)]
% dY/dt = [-sig*(x-y);
%           r*x - y -x*z;
%           x*y -b*z] 
% LS.mat:  Lorenz system parameters sig, r, b
sig=Q.sig;
r=Q.r;
b=Q.b;
ls=[sig, r, b];
B=cell_mas(ls);    
LS = struct('f',B); % LS(1).f=B{1,1},   LS(2).f=B{1,2}, ..
save("ParamStructure/LS.mat","LS");
save("ParamDouble/ls.mat","ls"); % Double

% Param1.mat: n,  h, tau, Ntau, Ndel, m, j0, degree
param1=[Q.n, Q.h, Q.tau, Q.Ntau, Q.Ndel, Q.m, Q.j0, Q.degree];
B=cell_mas(param1);    
Param1 = struct('f',B); % Param1(1).f=B{1,1},   Param1(2).f=B{1,2}, ..
save("ParamStructure/Param1.mat","Param1");
save("ParamDouble/param1.mat","param1"); % Double

% Param2.mat: TL, L, TP, LP, bet 
param2=[Q.TL, Q.L, Q.TP, Q.LP, Q.bet];
B=cell_mas(param2);    
Param2 = struct('f',B); 
save("ParamStructure/Param2.mat","Param2");
save("ParamDouble/param2.mat","param2"); % Double

% Param3.mat: Tin, Lin, Ninitcond, deltaX 
param3=[Q.Tin, Q.Lin, Q.Ninitcond, Q.deltaX];
B=cell_mas(param3);    
Param3 = struct('f',B); 
save("ParamStructure/Param3.mat","Param3");
save("ParamDouble/param3.mat","param3"); % Double

% lamNj -> LamNj.mat, for Fig2(a)
lamNj=Q.lamNj;
B=cell_mas(lamNj);    
LamNj = struct('f',B); 
save("ParamStructure/LamNj.mat","LamNj");  
save("ParamDouble/lamNj.mat","lamNj"); % Double

% lamNl -> LamNl.mat, for Fig2(b)
lamNl=Q.lamNl;
B=cell_mas(lamNl);    
LamNl = struct('f',B); 
save("ParamStructure/LamNl.mat","LamNl");  
save("ParamDouble/lamNl.mat","lamNl"); % Double

% LamNsz.mat: lamNjlsz = [lamNjsz, lamNlsz]
lamNjlsz=Q.lamNjlsz; 
B=cell_mas(lamNjlsz);    
LamNsz = struct('f',B); % Njlsz(1).f=B{1,1},   Njlsz(2).f=B{1,2}
save("ParamStructure/LamNsz.mat","LamNsz");
save("ParamDouble/lamNjlsz.mat","lamNjlsz"); % Double
end