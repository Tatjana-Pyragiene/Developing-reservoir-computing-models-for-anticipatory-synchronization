function Q=predict0(Y0,Q)
R=Q.R;
DR=Q.DR;
D=Q.D;
M=Q.M;
LengthW=Q.LengthW;

n=Q.n; % number in series coupled prediction models
h=Q.h;
Ndel=Q.Ndel;
Ntau=Q.Ntau;
%icond=Q.icond;
L=Q.L;
%Lin=Q.Lin;
degree=Q.degree;
bet=Q.bet;
LP=Q.LP;
m=Q.m;

Nlam =Q.lamNjsz;
lams=Q.lamNj;
 % lams=[-100 -50 -30 -20 -10];

rmsej=zeros(n,Nlam);        
%----------------
for jlam=1:Nlam
        lam=lams(jlam);
        Q.jlam=jlam;        
        disp1=['lam =' num2str(lam) ',   jlam =' num2str(jlam)  ',  max(jlam) =' num2str(Nlam)];
        disp(disp1)
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

%disp('Lagrange multiplier') % Debug
%Lagr=W1(end);
%disp(Lagr);
%Q.Lagr=Lagr;

W=W1(1:end-1);
%Error=sqrt(mean((D-W*R).^2))/std(D); 
%Q.Error=Error;
%disp('Fitting Error') %   Debug
%disp(Error);

%disp('Conditional Lyapunov') % Debug
%LyapCond=W*DR;
%disp(LyapCond);
%Q.LyapCond=LyapCond;

% Prediction after learning 
%Tpr=linspace(0,TP,LP);  
XP=zeros(LP,n);
%U=am*(Y0(L:L+LP-1)-Zmn)-1;
U=Y0(L:L+LP-1)/M; % tikslus sprendinys
Q.U=U;
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
for j=j0:LP-1 %j
  for jn=1:n %jn
    if(jn<=m)
    xx(1:jn)=fliplr(XP(j,1:jn));
    for jm=jn+1:m
      xx(jm)=U(j-(jm-jn-1)*Ntau);
    end
    else % jn<=m
      xx(1:m)=fliplr(XP(j,jn-m+1:jn));
    end % jn<=m
    r=ones(LengthW,1);
    sm=1;
      for nd=1:2:degree
      %matrnd=matr(nd).f;       
      rn=generateCheb_feat_vect(xx,S.matr(nd).f, nd); % My
      ln0=length(rn);
      r(sm+1:sm+ln0)=rn;
      sm=sm+ln0;
      end % nd
    XP(j+1,jn)=XP(j,jn)+h*(W*r);
        if(abs(XP(j+1,jn))>1)
        XP(j+1,jn)=sign(XP(j,jn));       
        end
  end %jn
end %j
toc
Q.XP=XP;
      j0=Q.j0;
% Computing the  root mean square (rms) error for different j    
stdp=std(U);
Ntau=Q.Ntau;
    for j=1:n
        delj=XP(j0:LP-j*Ntau,j)-U(j0+j*Ntau:LP);
        rmsej(j, jlam)=sqrt(mean(delj.^2))/stdp;
    end
end %jlam

Q.rmsej=rmsej;
end
