% Prediction v2 variable of the QIF neuron oscillator by synchronization with a
% recunstructed model
% Arbitrary numer (n) in series coupled predicting models (prediction time is n*tau)
close all
clearvars
n=8; % number in series coupled prediction models
lam=-7; % desired conditional Lyapunov exponent
h=0.02; % sampling time
Ntau=50; % Numer of points in embedding time interval

%load QIF_netw_3_2.mat;
load QIF_netw_ODE4_h01_3_2.mat;
%load QIF_netw_macro_3_2.mat;

v2=QIF(1:2:end,2);


Lv2=length(v2);
L=200000; % Number of ponts in the learning interval
LP=250000; % Number of points in the prediction interval
bet=1e-4; % ridge regression parameter
degree=7; % degree of nonlinearity
Ndel=8; % number of delays

m=Ndel+1; % embedding dimension
Y0=v2(1:L,1).';

Zmn=min(v2);
Zmx=max(v2);
am=2/(Zmx-Zmn);
Z=am*(Y0-Zmn)-1;  % renormalizing the time series; (-1<=Z<=1)

XX=Z(1,Ndel*Ntau+1:L-1).'; % current orginal time series;
tic;
% Constructing embedding delayed space:
% [u(t-tau),u(t-2*tau),..,u(t-Ndel*tau)]
% see Eq.(2);
disp('Composing XX array:');
for nd=1:Ndel
    XX=[XX, Z(1,(Ndel-nd)*Ntau+1:L-nd*Ntau-1).'];
end
toc;
LL=size(XX,1);

D=(Z(1,Ndel*Ntau+2:L)-Z(1,Ndel*Ntau+1:L-1))/h;
% see Eq.(11);

R=ones(LL,1);
tic;
disp('Composing R array:');
% Composing matrix, Eq.(12):
for nd=1:degree
    toc;
    nd_v=nd
    tic;
    R=[R,generateChebyshevs(XX,nd)];    
end
toc;
R=R.'; % This matrix will be used for optimization;
% see Eq.(12);
LengthW=size(R,1);

DR=zeros(LengthW,1);
% DR(1,1)=0.0 % since derivative of 1 is zero; (!!!)
tic;
disp('Composing DRnd array:');
% DR is vector C in Eqs. (32), (33);
sm=1;
for nd=1:degree
    toc;
    nd_v=nd  
    tic;
    DRnd=generateChebyshevsDiffLyap(XX,nd);
    ld=length(DRnd);
    DR(sm+1:sm+ld,1)=DRnd;
    sm=sm+ld;    
end
toc;

RR=R*R.'; % Composing the matrices for optimization problem;
tic;
disp('Solving optimization problem:');
A=[RR, DR;
   DR.', 0.0]; % see Eq.(32)
d=size(A,1);
A=A+bet*eye(d);
B1=[R*D.'; lam]; % see Eqs.(34), (16);
W1=(A\B1).'; % the answer; row-vector;
disp('Lagrange multiplier')
disp(W1(end))
W=W1(1:end-1); % optimal output vector;
% it will be used for integration of NGRC system;
toc;
Error=sqrt(mean((D-W*R).^2))/std(D);
disp('Fitting Error')
disp(Error)
disp('Condtional Lyapunov Exponent:')
disp(W*DR)

% Prediction after learning %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tpr=0:h:(LP-1)*h; % LP is the number of points in the prediction interval
%Npr=length(Tpr); % Length of prediction array
Y1=v2(L:L+LP-1,1); % array of original signal in the interval of prediction;
XP=zeros(LP,n); % array of NGRC signal in interval of prediction;
U0=am*(v2(L:L+LP-1,1).'-Zmn)-1; % original signal
U=am*(Y1-Zmn)-1; % filtered signal
j0=(Ndel-1)*Ntau+1; % initial point for itteration of the forrecusting model

for jn=1:n
    XP(j0,jn)=U(j0+jn*Ntau,1); % initial condition for NGRC system;
end
generate_all_exp_matreces(m,degree);
load("matr.mat");
xx=zeros(1,m);
countv=0;
tic;
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
toc;

TL=L*h; %learning time

% Saving the results of computations:
save('data.mat','L','LP','Ndel','Ntau','U','XP','h','n');

figure
subplot(1,2,1)
% projection of origunal current time series vs NGRC time series:
plot(U(j0:LP,1),XP(j0:LP,n)) 
xlabel('y(t)') 
ylabel('y_{pr}(t)')
subplot(1,2,2)
% Original time series anticipated (by n*tau) by the NGRC time series:
plot(U((Ndel+n-1)*Ntau+1:LP,1),XP(1+(Ndel-1)*Ntau:LP-n*Ntau,n))
xlabel('y(t+n\tau)') 
ylabel('y_{pr}(t)')
title(strcat('QIF, n=',int2str(n)))

figure
subplot(2,1,1)
hold on
% dynamics of original time series:
plot(TL+Tpr(1,j0:end),U(j0:end,1),'-b')
% dynamics of NGRC time series:
plot(TL+Tpr(1,j0:end),XP(j0:end,n),'-r')
%plot(TL+Tpr(j0:LP-n*Ntau),U(j0+n*Ntau:LP),'--b')
legend('original','predicted')
 ylim([-1 1])
ylabel('y(t),y_{pr}(t)') 
title(strcat('QIF, n=',int2str(n)))
 subplot(2,1,2)
% time series of error of prediction (by prediction time n*tau):
del=U(j0+n*Ntau:LP,1)-(XP(j0:LP-n*Ntau,n));
% dynamics of error of prediction of the original time series by NGRC:
plot(TL+Tpr(1,j0+n*Ntau:LP),del)
xlabel('time') 
ylabel('y(t+n\tau)-y_{pr}(t)') 

% Computing the rms error for differen j
rmsj=zeros(n,1);
nj=1:n;
stdp=std(U);
% Computing RMSE error for j*tau (j=1:n) prediction time:
for j=1:n
delj=XP(j0:LP-j*Ntau,j)-U(j0+j*Ntau:LP,1);
rmsj(j)=sqrt(mean(delj.^2))/stdp;
end

disp('RMSE error for tau prediction time')
disp(rmsj(1));
disp('RMSE error for n*tau prediction time')
disp(rmsj(n));

figure(32)
plot(nj,rmsj,'-*')
xlabel('Predictive model #') 
ylabel('Prediction RMSE') 
title('QIF_Netw') 


