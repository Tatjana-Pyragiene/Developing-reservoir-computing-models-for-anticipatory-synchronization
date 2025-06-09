function Roessler_Fig1d()
%  Dynamics of synchronization error, del
% del=XP2-U2
% XP2=Y_predict(t) - predicted dynamics 
% U2 = Y(t+n*tau)

%     Y = y(2)
% Prediction Y variables of the Roessler system 
% by synchronization with a  reconstructed mode
% Arbitrary number (n) in series coupled predicting models (prediction time is n*tau)
%        Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3);
%             y(1)+a*y(2);
%            b+y(3)*(y(1)-c)];

Q=ReadParameters(); 
Q=Read_lam_icond(Q);
Q=ReadFiles(Q);
n=Q.n;
Ntau=Q.Ntau;
h=Q.h;
fnt=11;

t1=Q.t1;
t2=Q.t2;

U1=Q.U1;
U2=Q.U2;
XP2=Q.XP2;

dT=8.7;
[~,ind1]=max(U1);
[~,ind2]=max(U1(ind1+2:end));
[~,ind3]=max(U1(ind2+2:end));

tm2=t1(ind2+ind3);
tm1=tm2-n*Ntau*h;
lim1=tm1-2*dT;
lim2=tm2+dT;
del=XP2-U2;
plot(t2,del,'-k',LineWidth=0.5);
xlim([lim1 lim2])
xlabel('time','FontSize', fnt) 
ylabel('$\varepsilon(t)$', 'Interpreter','latex','FontSize', fnt) 
ny1=-7*10^(-6);
ny2=6*10^(-6);
ylim([ny1 ny2]);
text(3640, 4.2*10^(-6), '(d)', 'FontSize',fnt)
end

 
 
