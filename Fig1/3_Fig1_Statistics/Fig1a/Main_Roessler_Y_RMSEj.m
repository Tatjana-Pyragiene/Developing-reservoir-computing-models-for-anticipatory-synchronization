function Main_Roessler_Y_RMSEj()
% For Fig1 (a),     creating  RMSEj.mat (RMSEj  vs  j for  different lam)
%        Roessler system  (RS)
% X = [x; y; z]
% dX/dt=[-y-z; 
%               x+a*y; 
%               b+z*(x-c)];

% X = [y(1); y(2); y(3)]
% dX/dt=[-y(2)-y(3); 
%               y(1)+a*y(2); 
%               b+y(3)*(y(1)-c)];
%  Observed variable:   Y =  y(2);

close all
clearvars
n=50; % number in series coupled prediction models

lamN=[-15 -14 -10 -5 -2 -1 -.7 -.6];  %desired minimal conditional Lyapunov exponent
Nlam=length(lamN);
RMSEj=zeros(n,Nlam);

h=0.05; % sampling time
tau=1.5;  % embedding time
Ntau=round(tau/h); % must be integer
TL=2000; % Lerning interval
L=round(TL/h); % A number of points in the lerning interval
TP=2000; % Prediction interval
LP=round(TP/h); % Number of points in the prediction interval
%TP=LP*h; 
bet=1e-8; % ridge regression parameter
degree=13; % degree of nonlinearity
Ndel=3; % number of delays
m=Ndel+1; % embedding dimension
y0=[-4.520140972669869   1.626348273059146   0.020136376909945]'; % initial cinditions
Tin=1000; % Change of initial cinditions on the strange attractor
Lin=round(Tin/h);
[X0,Y0,Z0]=Roessler_signal(h,Lin,y0);
y0=[X0(end),Y0(end),Z0(end)].';
[~,Y0,~]=Roessler_signal(h,L+LP-1,y0);

Z=Y0(1:L).';
Zmn=min(Z);
Zmx=max(Z);
am=2/(Zmx-Zmn);
Z=am*(Z-Zmn)-1;

XX=Z(Ndel*Ntau+1:L-1).';
for nd=1:Ndel
    %XX=[XX, Z((Ndel-nd)*Ntau+1:L-nd*Ntau-1).'];
     XX1=XX; 
    XX2=Z((Ndel-nd)*Ntau+1:L-nd*Ntau-1).'; 
    XX=horzcat(XX1,XX2); 
end
LL=size(XX,1);

D=(Z(Ndel*Ntau+2:L)-Z(Ndel*Ntau+1:L-1))/h;

R=ones(LL,1);
for nd=1:degree
    %R=[R,generateChebyshevs(XX,nd)];
    R1=R;
    R2=generateChebyshevs(XX,nd);
    R=horzcat(R1,R2); 
end
R=R.';
LengthW=size(R,1);

DR=zeros(LengthW,1);
sm=1;
for nd=1:degree
    DRnd=generateChebyshevsDiffLyap(XX,nd);
    ld=length(DRnd);
    DR(sm+1:sm+ld)=DRnd;
    sm=sm+ld;
end

for jlam=1:Nlam
    lam=lamN(jlam);
RR=R*R.';
 %A=[RR,DR];
 %A=[A;[DR.',0]];
A1=horzcat(RR,DR); 
A2=horzcat(DR.',0); 
A=vertcat(A1,A2); 

d=size(A,1);
A=A+bet*eye(d);
B1=[R*D.';lam];
W1 = (A\B1).';
%W1 = (pinv(A)*B1).';
%disp('Lagrange multiplier')
%disp(W1(end));
W=W1(1:end-1);
%Error=sqrt(mean((D-W*R).^2))/std(D);
%disp('Fitting Error')
%disp(Error);
%disp('Condtional Lyapunov')
%disp(W*DR);

%disp(W)

% Prediction after learning 
%Tpr=linspace(0,TP,LP); 
% XP=zeros(LP,1);
% XP2=zeros(LP,1);
XP=zeros(LP,n);
U=am*(Y0(L:L+LP-1)-Zmn)-1;
j0=(Ndel-1)*Ntau+1; % initial point for itteration of the forrecusting model
for jn=1:n
    XP(j0,jn)=U(j0+jn*Ntau);
end
generate_all_exp_matrices(m,degree);
%load("matr.mat");
S=load("matr.mat"); %  S.matr(1).f, S.matr(2).f ...
xx=zeros(1,m);

tic
for j=j0:LP-1
  for jn=1:n
    if(jn<=m)
    xx(1:jn)=fliplr(XP(j,1:jn));
    for jm=jn+1:m
      xx(jm)=U(j-(jm-jn-1)*Ntau);
    end
    else
      xx(1:m)=fliplr(XP(j,jn-m+1:jn));
    end
    r=ones(LengthW,1);
    sm=1;
      for nd=1:degree
      %matrnd=matr(nd).f;      
      rn=generateCheb_feat_vect(xx,S.matr(nd).f, nd); 

      ln=length(rn);
      r(sm+1:sm+ln)=rn;
      sm=sm+ln;
      end
    XP(j+1,jn)=XP(j,jn)+h*(W*r);
        if(abs(XP(j+1,jn))>1)
        XP(j+1,jn)=sign(XP(j,jn));       
        end
   end
end
toc

% Computing the rms error for differen j
stdp=std(U);
for j=1:n
delj=XP(j0:LP-j*Ntau,j)-U(j0+j*Ntau:LP);
RMSEj(j,jlam)=sqrt(mean(delj.^2))/stdp;
end
end

save("Double1/lamN.mat","lamN");
B=cell_mas(lamN);    
lamNs = struct('f',B);
save("Structure1/lamNs.mat","lamNs");

save("Double1/RMSEj.mat","RMSEj");
B=cell_mas1(RMSEj);    
RMSEjs = struct('f',B);
save("Structure1/RMSEjs.mat","RMSEjs");

close all;
clearvars
disp('FIN')
end
