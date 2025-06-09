function Roessler_Fig1c()
%  Dynamics prediction
%     Y = y(2)
% Prediction Y variables of the Roessler system 
% by synchronization with a  reconstructed mode
% Arbitrary number (n) in series coupled predicting models (prediction time is n*tau)
%        Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3); y(1)+a*y(2); b+y(3)*(y(1)-c)];

fnt=11;
Q=ReadParameters(); 
Q=Read_lam_icond(Q); % From LamIcond.mat    
Q=ReadFiles(Q);
n=Q.n;
Ntau=Q.Ntau;
h=Q.h;

t1=Q.t1;
t2=Q.t2;

U1=Q.U1;
U2=Q.U2;
XP1=Q.XP1;

dT=8.7;
[~,ind1]=max(U1);
[~,ind2]=max(U1(ind1+2:end));
[~,ind3]=max(U1(ind2+2:end));

tm2=t1(ind2+ind3);
tm1=tm2-n*Ntau*h;
tm0=(tm2-tm1)/2;
lim1=tm1-2*dT;
lim2=tm2+dT;


lim0=1.15;
sz=3; % marker size

len0=length(U2);
kk=1:5:len0; 
len=kk(end);
hold on
p(1)=plot(t1,U1,'-k',LineWidth=1);
%p(2)=plot(t2,U2, 'o', MarkerSize=sz, MarkerFaceColor='k',MarkerEdgeColor='k', MarkerIndices=1:30:len);
p(2)=plot(t2,U2, '-r',LineWidth=0.5);
p(3)=plot(t1,XP1,'o', MarkerSize=sz, MarkerFaceColor='none',MarkerEdgeColor='k', MarkerIndices=1:30:len);
p(4)=plot([tm1 tm2],[lim0 lim0],'k',Marker='|', MarkerSize=sz, MarkerFace='k');
%p(5)=plot([tm1+0.01 tm1+0.01],[lim0 lim0],Marker='<', MarkerSize=sz, MarkerFace='k');
%p(6)=plot([tm2+0.01 tm2+0.01],[lim0 lim0],Marker='>', MarkerSize=sz, MarkerFace='k');
text(tm1+tm0,lim0+0.3,'$50\tau$' , 'Interpreter','latex','FontSize', fnt)
ylim([-1.8 1.8])
xlim([lim1 lim2])
%xlabel('time','Interpreter','latex','FontSize', fnt) 
xlabel('time','FontSize', fnt) 
ylabel(['$u$, ', '$\nu_{50}$'],'Interpreter','latex','FontSize', fnt) 
%set(gca,"xticklabels"," ")

Legend={'$u(t)$','$\nu_{50}(t)$','$u(t+50 \tau)$'};
legend(p([1,2,3]),Legend, 'Orientation','horizontal',...
'Position',[0.1476  0.31 0.4268 0.0442],...    
'Interpreter','latex', 'FontSize', fnt);
legend('boxoff')
text(3640,1.5, '(c)', 'FontSize',fnt)
end


 
 
