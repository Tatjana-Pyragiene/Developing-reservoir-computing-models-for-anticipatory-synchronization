function Q=predict(Y0,Q)
% 2025.04.24
n=Q.n; % number in series coupled prediction models
h=Q.h;
Ndel=Q.Ndel;
Ntau=Q.Ntau;
lam=Q.lam;
%icond=Q.icond;
L=Q.L;
%Lin=Q.Lin;
degree=Q.degree;
bet=Q.bet;
LP=Q.LP;
m=Q.m;
%ilam=1;

% icond, ilam
Z=Y0(1:L).';
Zmn=min(Z);
Zmx=max(Z);
am=2/(Zmx-Zmn);
Z=am*(Z-Zmn)-1; % normalized variable

XX=Z(Ndel*Ntau+1:L-1).';
for nd=1:Ndel
    XX1=XX; % My
    XX2=Z((Ndel-nd)*Ntau+1:L-nd*Ntau-1).'; % My
    XX=horzcat(XX1,XX2); % My
%    XX=[XX, Z((Ndel-nd)*Ntau+1:L-nd*Ntau-1).'];
end
% XX(:,1) = Z(t) 
% XX(:,2) = Z(t-tau) 
% XX(:,3) = Z(t-2*tau) 
% ..
% XX(:,Ndel+1) = Z(t-Ndel*tau) 
LL=size(XX,1);

D=(Z(Ndel*Ntau+2:L)-Z(Ndel*Ntau+1:L-1))/h;

R=ones(LL,1);
for nd=1:degree
    R1=R;% My
    R2=generateChebyshevs(XX,nd);% My
    R=horzcat(R1,R2); % My
 %    R=[R,generateChebyshevs(XX,nd)];
end
R=R.';
LengthW=size(R,1);

DR=zeros(LengthW,1);
sum0=1;
for nd=1:degree
    DRnd=generateChebyshevsDiffLyap(XX,nd);
    ld=length(DRnd);
    DR(sum0+1:sum0+ld)=DRnd;
    sum0=sum0+ld;
end

RR=R*R.';
  %A=[RR,DR];
  %A=[A;[DR.',0]];
A1=horzcat(RR,DR); % My 2025.01.29
A2=horzcat(DR.',0); % My 2025.01.29
A=vertcat(A1,A2); % My 2025.01.29

d=size(A,1);
A=A+bet*eye(d);
B1=[R*D.';lam];
W1 = (A\B1).';
%W1 = (pinv(A)*B1).';
%disp('Lagrange multiplier')
Lagr=W1(end);
%disp(Lagr);
Q.Lagr=Lagr;

W=W1(1:end-1);
Error=sqrt(mean((D-W*R).^2))/std(D);
Q.Error=Error;
%disp('Fitting Error')
%disp(Error);

%disp('Conditional Lyapunov')
LyapCond=W*DR;
%disp(LyapCond);
Q.LyapCond=LyapCond;

% Prediction after learning 
%Tpr=linspace(0,TP,LP);  
XP=zeros(LP,n);
U=am*(Y0(L:L+LP-1)-Zmn)-1;
% Initial point for iteration of the forecasting model
j0=(Ndel-1)*Ntau+1; % imn-Ntau
for jn=1:n
    XP(j0,jn)=U(j0+jn*Ntau); % U(imn +(jn-1)*Ntau)
end
generate_all_exp_matrices(m,degree);
%load("matr.mat");
S=load("matr.mat"); %  My; S.matr(1).f, S.matr(2).f ...
xx=zeros(1,m);
Q.j0=j0;

tic
for j=j0:LP-1
  for jn=1:n
    if(jn<=m)
    xx(1:jn)=fliplr(XP(j,1:jn));
    for jm=jn+1:m
      xx(jm)=U(j-(jm-jn-1)*Ntau);
    end
    else % jn<=m
      xx(1:m)=fliplr(XP(j,jn-m+1:jn));
    end % jn<=m
    r=ones(LengthW,1);
    sum0=1;
      for nd=1:degree
      %matrnd=matr(nd).f;       
      rn=generateCheb_feat_vect(xx,S.matr(nd).f, nd); % My
      ln0=length(rn);
      r(sum0+1:sum0+ln0)=rn;
      sum0=sum0+ln0;
      end % nd
    XP(j+1,jn)=XP(j,jn)+h*(W*r);
        if(abs(XP(j+1,jn))>1)
        XP(j+1,jn)=sign(XP(j,jn));       
        end
  end % jn
end % j
toc
Q.U=U;
Q.XP=XP;
end
