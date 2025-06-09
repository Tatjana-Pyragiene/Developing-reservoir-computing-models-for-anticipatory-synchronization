function Write_lam_icond(Q)
% LamIcond.mat: lam, icond 
lam=Q.lam;
icond=Q.icond;
lamIcond=[lam,icond];
save('ParamDouble/lamIcond.mat','lamIcond');
B=cell_mas(lamIcond);    
LamIcond = struct('f',B); % LamIcond(1).f=B{1,1},..
save('ParamStructure/LamIcond.mat','LamIcond');
end