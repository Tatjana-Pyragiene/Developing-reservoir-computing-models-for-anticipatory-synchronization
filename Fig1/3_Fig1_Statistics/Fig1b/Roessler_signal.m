function  [X,Y,Z]=Roessler_signal(hT,NT,y0,Q)
% Generating time series of X,Y,Z of the Roessler system
% hT time step
% NT number of points (length of the signal)
% y0 intial condition 

% Rossler parameters
P.a=Q.a; 
P.b=Q.b;
P.c=Q.c; 
opts = odeset('RelTol',1e-7,'AbsTol',1e-10);
T=linspace(0,hT*(NT-1),NT);
[~,Y1] = ode45(@(t,y) sistema(t,y,P), T,y0,opts);

X=(Y1(:,1));
Y=(Y1(:,2));
Z=(Y1(:,3));
end

function yp = sistema(~,y,P)
% Roessler system
yp=[-y(2)-y(3);
    y(1)+P.a*y(2);
    P.b+y(3)*(y(1)-P.c)];
end

   