function Q=Read_lam_icond(Q)
% 2025.04.24
% lamIcond.mat: lamIcond=[lam, icond]
%load('ParamDouble/lamIcond.mat');
%Q.lam=lamIcond(1,1);
%Q.icond=lamIcond(1,2);

% LamIcond.mat: LamIcond=[lam, icond]
s=load('ParamStructure/LamIcond.mat');
Q.lam=s.LamIcond(1).f;
Q.icond=s.LamIcond(2).f;
end