function Q=Read_lam_icond(Q)
% LamIcond.mat: lam, icond
s=load("Structure\LamIcond.mat");
Q.lam=s.LamIcond(1).f;
Q.icond=s.LamIcond(2).f;
end