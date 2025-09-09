% Fig4 
% data ate generatted by Roessler_electr_v21_Cheb_del_tau_n.m
close all
clearvars
load('data.mat')
%----------------------------------------------------------------
% Here we list the parameters, at which the computaions were
% performed in program [QIF_Cheb_del_tau_n.m]:
%----------------------------------------------------------------
% n=8; % number in series coupled prediction models
% lam=-7; % desired conditional Lyapunov exponent
% h=0.02; % sampling time
% Ntau=50; % Numer of points in embedding time interval
% 
% 
% load QIF_netw_ODE4_h01_3_2.mat;
% 
% 
% v2=QIF(1:2:end,2);
% 
% 
% Lv2=length(v2);
 % L=200000; % Number of ponts in the learning interval
 % LP=250000; % Number of points in the prediction interval
% bet=1e-4; % ridge regression parameter
% degree=7; % degree of nonlinearity
% Ndel=8; % number of delays
% 
% m=Ndel+1; % embedding dimension
%----------------------------------------------------------------

% % Prediction after learning %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Tpr=0:h:(LP-1)*h; % the whole time interval during prediction;
 j0=(Ndel-1)*Ntau+1; % initial point for itteration of the forrecusting model


TL=L*h; %learning time



% Calculate the histogram of prediction times
U0=U(j0:end); % exact time series of QIF neuron system;
TF0=islocalmax(U0);
T0=Tpr(j0:end);
% points of local maxima in the exact QIF time series:
T0m=T0(TF0);
U0m=U0(TF0);
%U0m1=Um(U0m>0);
T0m1=T0m(U0m>0);
XP0=XP(j0:end,n);
TFP=islocalmax(XP0);
% points of local maxima in the NGRC time series during prediction:
TPm=T0(TFP);
XP0m=XP0(TFP);
TPm1=TPm(XP0m>0.5);

 
% Computing the rms error for differen j
rmsj=zeros(n,1);
nj=1:n;
stdp=std(U);
for j=1:n
delj=XP(j0:LP-j*Ntau,j)-U(j0+j*Ntau:LP);
rmsj(j)=sqrt(mean(delj.^2))/stdp;
end

disp('RMSE error for tau prediction time')
disp(rmsj(1));
disp('RMSE error for n*tau prediction time')
disp(rmsj(n));


% Computing maxima of the original signal
TT=0:h:h*(length(U)-1);
TF=islocalmax(U);
Tm=TT(TF);
Um=U(TF);
Um1=Um(Um>0);
Tm1=Tm(Um>0);


fnt=10;
fnt1=11;
xt=-0.97;
yt=0.89;

figure(1)
t = tiledlayout(3,2,'TileSpacing','Compact','Padding','compact');

% Tile 1
nexttile([1,1])
% Plotting map of t_{i+1}=f(t_{i}); Here t_{i} is the i-th interval between
% two subsequent maxima;
plot(Tm1(2:end-1)-Tm1(1:end-2),Tm1(3:end)-Tm1(2:end-1),'.b','MarkerSize',4)
xlim([20,65])
ylim([20,65])
xlabel('$t_i^\mathrm{int}\, \mathrm{[ms]}$','Interpreter','latex', 'FontSize',fnt1) 
ylabel('$t_{i+1}^\mathrm{int}\, \mathrm{[ms]}$','Interpreter','latex', 'FontSize',fnt1)
text(20.5,63, '(a)', 'FontSize',fnt)
% xlabel('$u(t)$','Interpreter','latex')
% ylabel('$\nu_1(t)$','Interpreter','latex')

% tile 2
nexttile([1 1])
% Plotting anticipated (by tau) original signal vs current NGRC signal;
plot(U((Ndel+1-1)*Ntau+1:LP),XP(1+(Ndel-1)*Ntau:LP-1*Ntau,1))
xlabel('$u(t+\tau)$','Interpreter','latex', 'FontSize',fnt1) 
ylabel('$\nu_1(t)$','Interpreter','latex', 'FontSize',fnt1)
 text(xt,yt, '(b)', 'FontSize',fnt)
% xlabel('$u(t+\tau)$','Interpreter','latex')
% ylabel('$\nu_1(t)$','Interpreter','latex')

% Tile 3
nexttile([1,1])
% Plotting anticipated (by n*tau) original signal vs current NGRC signal;
plot(U((Ndel+n-1)*Ntau+1:LP),XP(1+(Ndel-1)*Ntau:LP-n*Ntau,n))
xlabel('$u(t+8\tau)$','Interpreter','latex', 'FontSize',fnt1) 
ylabel('$\nu_8(t)$','Interpreter','latex', 'FontSize',fnt1)
 text(xt,yt, '(c)', 'FontSize',fnt)
% xlabel('$u(t)$','Interpreter','latex')
% ylabel('$\nu_{12}(t)$','Interpreter','latex')

% tile 4
nexttile([1 1])
edges = [7.93 7.95 7.97 7.99 8.01 8.03 8.05 8.07];
% Plotting the histogram of frequency of differences between spikes
% of the current original ant n*tau (n=8) anticipated NGRC sytem:
histogram(T0m1-TPm1,edges)
xlabel('$\Delta t_{i}\, \mathrm{[ms]}$','Interpreter','latex', 'FontSize',fnt1)
ylabel('Frequency', 'FontSize',fnt)
 text(7.925,57, '(d)', 'FontSize',fnt)


% Tile 5
nexttile([1,2])
hold on
% Plotting dynamics of current original and NGRC time series,
% that anticipates the latter by n*tau (n=8):
plot(TL+Tpr(j0:end),U(j0:end),'-k',LineWidth=1)
plot(TL+Tpr(j0:end),XP(j0:end,n),'-r',LineWidth=0.5)
%plot(TL+Tpr(j0:LP-n*Ntau),U(j0+n*Ntau:LP),'--b')
% leg=legend('u(t)','\nu(t)');
% leg.Box = 'off';
leg=legend('$u(t)$','$\nu_{8}(t)$','Orientation','horizontal', ...
'Position',[0.33  0.26 0.7 0.0442],...    
'Interpreter','latex', 'FontSize', fnt1);
leg.Box = 'off';
xlim([5990 6410])
ylim([-1.1 1.4])
%xlabel('time [ms]') 
xlabel('time [ms]','FontSize', fnt)
ylabel('$u,\, \nu_8$','Interpreter','latex', 'FontSize',fnt1) 
box on
 text(6000,1.2, '(e)', 'FontSize',fnt)
% xlabel('time, ms')
% ylabel('$u$, $\nu_{12}$','Interpreter','latex')

wd=9;
hd=12;
%figure (1)
set(gcf,'Units','centimeters')
set(gcf, 'PaperSize', [wd hd]);
set(gcf,'Position',[2,2,wd,hd]);
savefig("Fig4.fig")
saveas(gcf,'Fig4','epsc')