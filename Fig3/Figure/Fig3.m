% Fig3 
% data ate generatted by Roessler_electr_v21_Cheb_del_tau_n.m

%--------------------------------------------------------------------------
% The data were computed at these parameters:
%--------------------------------------------------------------------------
% n=12; % number in series coupled prediction models
% lam=-0.5; % desired conditional Lyapunov exponent
% h=1; % sampling time
% Ntau=7; % Numer of points in embedding time interval
% load('v21.mat'); % loading data file
% %sz2=size(v21)
% Lv2=length(v21);
% disp('Total length of the experimental signal');
% disp(Lv2); % Total number of points in the experimental signal
% Lv2=length(v21);
% %ur=pr
% L=10000; % Number od ponts in the learning interval
% LP=10000; % Number of points in the prediction interval
% bet=1e-4; % ridge regression parameter
% degree=7; % degree of nonlinearity
% Ndel=5; % number of delays
%--------------------------------------------------------------------------

% data file; it was computed by [Roessler_electr_v21_Cheb_del_tau_n.m]
load Fig3dat.mat 
h=1/30; % sampling time (ms)
fnt=10;
fnt1=11;
lim0=1.15;
sz=3; % marker size
tm1=14.052*10^3*h;
tm2=14.136*10^3*h;
xt=-0.98;
yt=0.90;
tn=1000:3000;
t = tiledlayout(3,2,'TileSpacing','Compact','Padding','compact');

% Tile 1
nexttile([1,1])
% Plotting NGRC current dynamics (1-st slave variable) vs original system dynamics:
plot(ua(tn),nua(tn),LineWidth=0.1);
text(xt,yt, '(a)', 'FontSize',fnt)
xlabel('$u(t)$','Interpreter','latex','FontSize', fnt1)
ylabel('$\nu_1(t)$','Interpreter','latex','FontSize', fnt1)

% tile 2
nexttile([1 1])
% Plotting NGRC dynamics (1-st slave variable) vs tau-anticipated original system dynamics:
plot(ub,nub,LineWidth=0.1)
text(xt,yt, '(b)', 'FontSize',fnt)
xlabel('$u(t+\tau)$','Interpreter','latex','FontSize', fnt1)
ylabel('$\nu_1(t)$','Interpreter','latex','FontSize', fnt1)

% Tile 3
nexttile([1,1])
% Plotting NGRC current dynamics (12-th slave variable) vs original system dynamics:
plot(uc(tn),nuc(tn),LineWidth=0.1);
text(xt,yt, '(c)', 'FontSize',fnt)
xlabel('$u(t)$','Interpreter','latex','FontSize', fnt1)
ylabel('$\nu_{12}(t)$','Interpreter','latex','FontSize', fnt1)

% tile 4
nexttile([1 1])
% Plotting NGRC dynamics (12-th slave variable) vs n*tau-anticipated (n=12) 
% original system dynamics:
plot(ud,nud,LineWidth=0.1)
text(xt,yt, '(d)', 'FontSize',fnt)
xlabel('$u(t+12\tau)$','Interpreter','latex','FontSize', fnt1)
ylabel('$\nu_{12}(t)$','Interpreter','latex','FontSize', fnt1)


% Tile 5
nexttile([1,2])
% Plotting current original (black line), 12-th slave variable (red line), and the
% n*tau (n=12) anticipated original signal (black circles):
hold on
p(1)=plot(h*T1,UT1,'-k',LineWidth=1);
p(2)=plot(h*T2,XPT2, '-r',LineWidth=0.5);
p(3)=plot(h*T3(1:5:end),UT3(1:5:end),'o', MarkerSize=sz, MarkerFaceColor='none',MarkerEdgeColor='k');
p(4)=plot([tm1 tm2],[lim0 lim0],'k',Marker='|', MarkerSize=sz, MarkerFace='k');
text(tm1+0.9*(tm2-tm1)/2,lim0+0.2,'$12\tau$' , 'Interpreter','latex','FontSize', fnt)
%xlim([14 14.2]*10^3*h)
xlim([466 474])
ylim([-1.6 1.6])
hold off
box on
Legend={'$u(t)$','$\nu_{12}(t)$','$u(t+12 \tau)$'};
legend(p([1,2,3]),Legend, 'Orientation','horizontal',...
'Position',[0.15  0.085 0.7 0.0442],...    
'Interpreter','latex', 'FontSize', fnt1);
legend('boxoff')
text(466.1,1.4, '(e)', 'FontSize',fnt)
xlabel('time [ms]','FontSize', fnt)
ylabel('$u$, $\nu_{12}$','Interpreter','latex','FontSize', fnt1)

wd=9;
hd=12;
%figure (1)
set(gcf,'Units','centimeters')
set(gcf, 'PaperSize', [wd hd]);
set(gcf,'Position',[2,2,wd,hd]);
savefig("Fig3.fig")
saveas(gcf,'Fig3','epsc')