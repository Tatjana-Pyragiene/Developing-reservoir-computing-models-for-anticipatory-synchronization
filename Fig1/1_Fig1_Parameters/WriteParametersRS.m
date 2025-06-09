function  WriteParametersRS(Q)
% 2025.04.28
% Roessler system
% Y = [y(1); y(2); y(3)]
% dY/dt=[-y(2)-y(3); y(1)+a*y(2); b+y(3)*(y(1)-c)];
% RS.mat: Roessler parameters  a, b, c
rs=[Q.a,Q.b,Q.c];
save('ParamDouble/rs.mat','rs');

B=cell_mas(rs);    
RS = struct('f',B); % RS(1).f=B{1,1},   RS(2).f=B{1,2}, ..
save('ParamStructure/RS.mat','RS');

% Param1.mat: n,  h, tau, Ntau, Ndel, m, j0, degree
% j0=imn-Ntau = (Ndel-1)*Ntau+1
param1=[Q.n, Q.h, Q.tau, Q.Ntau, Q.Ndel, Q.m,Q.j0, Q.degree];
save('ParamDouble/param1.mat','param1');
B=cell_mas(param1);    
Param1 = struct('f',B); % Param1(1).f=B{1,1},   Param1(2).f=B{1,2}, ..
save('ParamStructure/Param1.mat','Param1');

% Param2.mat: TL, L, TP, LP, bet 
param2=[Q.TL, Q.L, Q.TP, Q.LP, Q.bet];
save('ParamDouble/param2.mat','param2');
B=cell_mas(param2);    
Param2 = struct('f',B); 
save('ParamStructure/Param2.mat','Param2');

% Param3.mat: Tin, Lin, Ninitcond, deltaX 
param3=[Q.Tin, Q.Lin, Q.Ninitcond, Q.deltaX];
save('ParamDouble/param3.mat','param3');
B=cell_mas(param3);    
Param3 = struct('f',B); 
save('ParamStructure/Param3.mat','Param3');

% lamNj -> LamNj.mat, for Fig1(a)
lamNj=Q.lamNj;
B=cell_mas(lamNj);    
LamNj = struct('f',B); 
save("ParamStructure/LamNj.mat","LamNj");  
save("ParamDouble/lamNj.mat","lamNj"); % Double

% lamNl -> LamNl.mat, for Fig1(b)
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