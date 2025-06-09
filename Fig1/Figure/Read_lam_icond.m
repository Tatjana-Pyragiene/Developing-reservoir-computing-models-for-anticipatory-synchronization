function Q=Read_lam_icond(Q)
% Reading the fields of the a.mat file  LamIcond.mat
% LamIcond.mat: [lam, icond]

s=load("Structure\LamIcond.mat");
Q.lam=s.LamIcond(1).f;    % The Lypunov exponent

% icond is an actual number of the initial condition, icond = 1 
% for the learning phase
Q.icond=s.LamIcond(2).f; 
end