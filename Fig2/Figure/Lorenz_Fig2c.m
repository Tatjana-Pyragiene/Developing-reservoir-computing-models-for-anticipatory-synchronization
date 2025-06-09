function Lorenz_Fig2c(Q)
%        Lorenz system
% X = [y(1); y(2); y(3)]
%	dX/dy = -sig*(y(1)-y(2));
%                   r*y(1) - y(2) -y(1)*y(3);
%                   y(1)*y(2) -b*y(3) 
%   Observed variable:   Y = y(1)

 % Prediction Y variables of the  Lorenz system 
% by synchronization with a  reconstructed mode
% Arbitrary number (n) in series coupled predicting models (prediction time is n*tau)

fnt=11;
Q=Read_lam_icond(Q); % From LamIcond.mat    
Q=ReadFiles(Q);

t1=Q.t1;
t2=Q.t2;

U1=Q.U1;
U2=Q.U2;
XP1=Q.XP1;
tm1=426.262;
tm2=430.757;
tm0=(tm2-tm1)/2;

lim1=416;
lim2=436;
lim0=1.15;
sz=3; % marker size

len0=length(U2);
kk=1:5:len0; 
len=kk(end);
hold on
p(1)=plot(t1,U1,'-k',LineWidth=1);
p(2)=plot(t2,U2, '-r',LineWidth=0.5);
p(3)=plot(t1,XP1,'o', MarkerSize=sz, MarkerFaceColor='none',MarkerEdgeColor='k', MarkerIndices=1:30:len);
p(4)=plot([tm1 tm2],[lim0 lim0],'k',Marker='|', MarkerSize=sz, MarkerFace='k');
text(tm1+0.85*tm0,lim0+0.3,'$30  \tau$' , 'Interpreter','latex','FontSize', fnt)
xlim([lim1 lim2])
ylim([-1.8 1.8])
xlabel('time','FontSize', fnt) 
ylabel(['$u$, ', '$\nu_{30}$'],'Interpreter','latex','FontSize', fnt)
Legend={'$u(t)$','$\nu_{30}(t)$','$u(t+30 \tau)$'};
legend(p([1,2,3]),Legend, 'Orientation','horizontal',...
 'Position',[0.1476  0.12 0.4268 0.0442],...    
'Interpreter','latex', 'FontSize', fnt);    
legend('boxoff')
text(416.3,1.55, '(c)', 'FontSize',fnt)
end


 
 
