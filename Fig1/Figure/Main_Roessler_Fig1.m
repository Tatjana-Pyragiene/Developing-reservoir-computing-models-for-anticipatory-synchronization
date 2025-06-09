function Main_Roessler_Fig1()
% Roessler system
% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3);  
%             y(1)+a*y(2);
%             b+y(3)*(y(1)-c)];
%  Y = y(2) -  observable signal
%  Prediction Y  variable of the Roessler system 
%  by synchronization with a  reconstructed model.
%  For an arbitrary number, n, in series coupled predicting models, 
%  prediction time is n*tau.

close all
clearvars

wd=17;
hd=12;

figure (1)
set(gcf,'Units','centimeters')
set(gcf, 'PaperSize', [wd hd]);
set(gcf,'Position',[1,1,wd,hd])
t = tiledlayout(9,2,'TileSpacing','Compact');
t.Padding = 'compact';
% Fig1 (a)
nexttile([4,1]);
hold on
Roessler_Fig1a(); % RMSE vs j
box on

%------ Fig1 (b)
nexttile([4 1])
hold on
Roessler_Fig1b(); %  rmsel vs lam
box on

%------ Fig1 (c)
nexttile([3,2])
hold on
Roessler_Fig1c(); %  Dynamics prediction
ax=gca;
ax.TickLength = [0.005, 0.005];
box on
%------ Fig1 (d)
nexttile([2,2])
hold on
Roessler_Fig1d();
ax=gca;
ax.TickLength = [0.005, 0.005];
box on

savefig("Fig1.fig")
saveas(gcf,'Fig1','epsc')
close all
disp("FIN")
end