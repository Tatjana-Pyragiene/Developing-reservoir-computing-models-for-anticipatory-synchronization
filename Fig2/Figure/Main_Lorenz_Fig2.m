function Main_Lorenz_Fig2()
% Lorenz system
% (x',y',z') = -sig*(x-y);
%                  r*x - y -x*z;
 %                 x*y -b*z 
%       or
% X = [y(1); y(2); y(3)]
%	dX/dy = -sig*(y(1)-y(2));
%                   r*y(1) - y(2) -y(1)*y(3);
%                   y(1)*y(2) -b*y(3) 

%   Observed variable:   Y = x = y(1)

% Prediction Y variable of the Lorenz system 
% by synchronization with a  reconstructed model
%  For an arbitrary number, n, in series coupled predicting models, 
%  prediction time is n*tau.

close all
clearvars
Q=ReadParameters();
wd=17;
hd=9.5;

figure (1)
set(gcf,'Units','centimeters')
set(gcf, 'PaperSize', [wd hd]);
set(gcf,'Position',[1,1,wd,hd])
t = tiledlayout(7,2,'TileSpacing','Compact');
t.Padding = 'compact';

%----  Fig2 (a)
nexttile([4,1]);
Lorenz_Fig2a;
box on

%----  Fig2 (b)
nexttile([4 1])
Lorenz_Fig2b
box on

%----  Fig2 (c)
nexttile([3,2])
Q.Ninitcond=1;
Q.n=30;
   Lorenz_Fig2c(Q);
ax=gca;
ax.TickLength = [0.005, 0.005];
box on

savefig("Fig2.fig")
saveas(gcf,'Fig2','epsc')
 close all
 disp("FIN")
end