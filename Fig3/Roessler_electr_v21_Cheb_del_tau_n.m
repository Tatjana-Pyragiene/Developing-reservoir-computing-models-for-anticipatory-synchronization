% Prediction v2 variable of the electronic Roessler oscillator by synchronization with a
% recunstructed model
% Arbitrary numer (n) in series coupled predicting models (prediction time is n*tau)
close all
clearvars
n=12; % number in series coupled prediction models
lam=-0.5; % desired conditional Lyapunov exponent
h=1; % sampling time
Ntau=7; % Numer of points in embedding time interval

load('v21.mat'); % loading data file
%sz2=size(v21)
Lv2=length(v21);
disp('Total length of the experimental signal');
disp(Lv2); % Total number of points in the experimental signal
Lv2=length(v21);
%ur=pr
L=10000; % Number of ponts in the learning interval
LP=10000; % Number of points in the prediction interval
bet=1e-4; % ridge regression parameter
degree=7; % degree of nonlinearity
Ndel=5; % number of delays
m=Ndel+1; % embedding dimension
Y0=v21(1:L,1).'; % time series of original system in the learning interval
Zmn=min(v21);
Zmx=max(v21);
am=2/(Zmx-Zmn);
Z=am*(Y0-Zmn)-1; % renormalizing the time series; (-1<=Z<=1)

XX=Z(1,Ndel*Ntau+1:L-1).'; % current orginal time series v2(t)
% Constructing embedding delayed space:
% [v2(t-tau),v2(t-2*tau),..,v2(t-Ndel*tau)]
% see Eq.(2);
disp('Composing array XX:');
tic;
for nd=1:Ndel
    XX=[XX, Z((Ndel-nd)*Ntau+1:L-nd*Ntau-1).'];
end
toc;
LL=size(XX,1);

D=(Z(1,Ndel*Ntau+2:L)-Z(1,Ndel*Ntau+1:L-1))/h; % dynamics of time derivative dv2/dt
% see Eq.(11);

R=ones(LL,1);
disp('Composing array R:');
tic;
% Composing matrix, Eq.(12):
for nd=1:degree
    R=[R,generateChebyshevs(XX,nd)];
end
toc;
R=R.'; % This matrix will be used for optimization;
% see Eq.(12);
LengthW=size(R,1);

DR=zeros(LengthW,1);
% DR(1,1)=0.0 % since derivative of 1 is zero; (!!!)
disp('Composing array DRnd:');
% DR is vector C in Eqs. (32), (33);
tic;
sm=1;
for nd=1:degree
    DRnd=generateChebyshevsDiffLyap(XX,nd);
    ld=length(DRnd);
    DR(sm+1:sm+ld)=DRnd;
    sm=sm+ld;
end
toc;
RR=R*R.'; % Composing the matrices for optimization problem;
% A=[RR,DR];
% A=[A;[DR.',0]];
A=[RR, DR;
   DR.', 0.0]; % see Eq.(32)
d=size(A,1);
A=A+bet*eye(d);
B1=[R*D.';lam]; % see Eqs.(34), (16);
W1 = (A\B1).'; % the answer; row-vector;
disp('Lagrange multiplier')
disp(W1(end))
W=W1(1:end-1); % optimal output vector;
% it will be used for integration of NGRC system;
Error=sqrt(mean((D-W*R).^2))/std(D);
disp('Fitting Error')
disp(Error)
disp('Condtional Lyapunov Exponent')
disp(W*DR)

% Prediction after learning %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tpr=0:h:(LP-1)*h; % LP is the number of points in the prediction interval
Y1=v21(L:L+LP-1,1); % experimental time series;
XP=zeros(LP,n); % array for the NGRC time series in the prediction interval;
U=am*(Y1-Zmn)-1; % renormalized original signal
j0=(Ndel-1)*Ntau+1; % initial point for iteration of the forrecusting model

for jn=1:n
    XP(j0,jn)=U(j0+jn*Ntau,1); % initial condition for NGRC system;
end

generate_all_exp_matreces(m,degree); % generating the exponents matrices;
load("matr.mat");
xx=zeros(1,m);
tic
countv=0;
% Integration of the NGRC system:
disp('Integration of the NGRC system:');
for j=j0:LP-1
    countv=countv+1;
    if countv==1000
        toc;
        countv=0;
        j_v=j
        tic;
    end
  for jn=1:n
    if(jn<=m)
    xx(1,1:jn)=fliplr(XP(j,1:jn));
    for jm=jn+1:m
      xx(1,jm)=U(j-(jm-jn-1)*Ntau,1);
    end      
    else
      xx(1,1:m)=fliplr(XP(j,jn-m+1:jn));
    end
    r=ones(LengthW,1); % array for the total feature vector;
    sm=1;
    % Composing the feature vector:
    for nd=1:degree
    matrnd=matr(nd).f;
    % Composing a feature sub-vector of a given order (nd) of nonlinearity:
    rn=generateCheb_feat_vect(xx,matrnd,nd);
    ln=length(rn);
    % composing array for the total feature vector:
    r(sm+1:sm+ln,1)=rn; 
    sm=sm+ln;
    end
 XP(j+1,jn)=XP(j,jn)+h*(W*r); % numerical integration of system Eq. (38);
        % Restriction:
        if(abs(XP(j+1,jn))>1)
        XP(j+1,jn)=sign(XP(j,jn));       
        end
  end
end
toc

TL=L*h; %learning time
disp('Plotting results:');
tic;
figure
subplot(1,2,1)
plot(U(j0:LP,1),XP(j0:LP,1)) % exact time series vs NGRC series in the prediction interval
xlabel('y(t)') 
ylabel('y_{pr}(t)')
subplot(1,2,2)
% exact time series vs delayed by h*Ntau NGRC series in the prediction
% interval;
% NGRC is anticipating the exact time series by h*Ntau;
plot(U((Ndel)*Ntau+1:LP,1),XP(1+(Ndel-1)*Ntau:LP-Ntau,1))
xlabel('y(t+\tau)') 
ylabel('y_{pr}(t)')
title('Roessler Electronic, n=1')

ua=U(j0:LP,1); % exact time series in the prediction interval;
nua=XP(j0:LP,1); % time series of NGRC system in the prediction interval;
ub=U((Ndel)*Ntau+1:LP,1); % current (not-delayed) exact time series in the prediction interval;
%----------------------------------------------------------------------------
% NOTE!----------------------------------------------------------------------
% NGRC is predicting the exact time series; therefore we compare the
% delayed NGRC time series with the current exact time series;
%----------------------------------------------------------------------------
nub=XP(1+(Ndel-1)*Ntau:LP-Ntau,1); % delayed time series of NGRC in the prediction interval;

figure
subplot(1,2,1)
% exact time series vs NGRC series in the prediction interval:
plot(U(j0:LP,1),XP(j0:LP,n))
xlabel('y(t)') 
ylabel('y_{pr}(t)')
subplot(1,2,2)
% Here exact time series is shifted forwars by n*h*Ntau; it has to 
% approximate NGRC time series;
plot(U((Ndel+n-1)*Ntau+1:LP,1),XP(1+(Ndel-1)*Ntau:LP-n*Ntau,n))
xlabel('y(t+n\tau)') 
ylabel('y_{pr}(t)')
title(strcat('Roessler Electronic, n=',int2str(n)))

uc=U(j0:LP,1); % exact time series in the prediction interval;
nuc=XP(j0:LP,n); % time series (for prediction time h*n*Ntau) of NGRC system in the prediction interval;
ud=U((Ndel+n-1)*Ntau+1:LP); % exact time series shifted by n*Ntau*h;
nud=XP(1+(Ndel-1)*Ntau:LP-n*Ntau,n); % NGRC time series;
% Here ud is the exact time series shifted forward by h*n*Ntau; it must approximate the NGRC
% n-th time series;

figure
subplot(2,1,1)
hold on
plot(TL+Tpr(1,j0:end),U(j0:end,1),'-b') % dynamics of original time series;
plot(TL+Tpr(1,j0:LP),XP(j0:end,n),'-r') % dynamics of NGRC, which is predicting by h*n*Ntau; 
plot(TL+Tpr(1,j0:LP-n*Ntau),U(j0+n*Ntau:LP,1),'--b') % exact dynamics, shifted by h*n*Ntau forward;
 ylim([-1 1])
legend('y(t)','y_{pr}(t)','y(t+n\tau)')
ylabel('y(t),y_{pr}(t)') 
title(strcat('Roessler Electronic, n=',int2str(n)))
 subplot(2,1,2)
 % Difference between the n*tau firwarded exact time series and
 % NGRC current (n*tau predicted) time series;
del=U(j0+n*Ntau:LP,1)-(XP(j0:LP-n*Ntau,n));
plot(TL+Tpr(1,j0+n*Ntau:LP),del)
xlabel('time') 
ylabel('y(t+n\tau)-y_{pr}(t)')

toc;

T1=TL+Tpr(1,j0:end); % time array in the whole time interval;
UT1=U(j0:end,1); % exact time series in the whole time interval;
T2=TL+Tpr(1,j0:LP); % time array in the prediction interval;
XPT2=XP(j0:end,n); % NGRC time series in the whole time interval;
T3=TL+Tpr(1,j0:LP-n*Ntau); % time array in the prediction interval; (anticipating time n*h*Ntau excluded)
UT3=U(j0+n*Ntau:LP,1); % exact time series in the prediction interval; (the start is shifted forward by n*h*Ntau);


% Computing the rms error for differen j
rmsj=zeros(n,1);
nj=1:n;
stdp=std(U);
% Computing errors for differnt times of anticipation:
for j=1:n
delj=U(j0+j*Ntau:LP,1)-(XP(j0:LP-j*Ntau,j));
rmsj(j,1)=sqrt(mean(delj.^2))/stdp;
end

% Saving the results of computations:
save Fig3dat.mat ua nua ub nub uc nuc ud nud T1 UT1 T2 XPT2 T3 UT3

disp('RMSE error for tau prediction time')
disp(rmsj(1));
disp('RMSE error for n*tau prediction time')
disp(rmsj(n));
disp('Plotting errors vs prediction time');
figure
plot(nj,rmsj,'-*')
xlabel('Predictive moel #') 
ylabel('Prediction RMSE') 
title('Roessler Electronic') 


