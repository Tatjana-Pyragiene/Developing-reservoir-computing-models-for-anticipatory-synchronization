function  Main1_Lorenz_Y_RMSEj_Files(Q,y0)
% Creating ramsej.mat (double) and RMSE.mat (structure) files.
Lin=Q.Lin;
% ----------------------
h=Q.h;
Ndel=Q.Ndel;
Ntau=Q.Ntau;
degree=Q.degree;
L=Q.L;
LP=Q.LP;

 [X0,Y0,Z0]=Lorenz_signal(h,Lin,y0,Q);
  y0=[X0(end),Y0(end),Z0(end)].';
  [Y0,~,~]=Lorenz_signal(h,L+LP-1,y0,Q);

Z=Y0(1:L).';
%Zmn=min(Z);
%Zmx=max(Z);
%am=2/(Zmx-Zmn);
%Z=am*(Z-Zmn)-1;

%M=max(max(Y0),-min(Y0));
%disp(M)
M=19.3667; % max paskaiciuotas is labai ilgo (T=10000) intervalo
Q.M=M;
Z=Z/M;

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
Q.D=D;
R=ones(LL,1);
for nd=1:2:degree
    R1=R;% My
    R2=generateChebyshevs(XX,nd);% My
    R=horzcat(R1,R2); % My
 %    R=[R,generateChebyshevs(XX,nd)];
end
R=R.';
LengthW=size(R,1);
Q.LengthW=LengthW;
DR=zeros(LengthW,1);
sm=1;
for nd=1:2:degree
    DRnd=generateChebyshevsDiffLyap(XX,nd);
    ld=length(DRnd);
    DR(sm+1:sm+ld)=DRnd;
    sm=sm+ld;
end
% -----------------
Q.R=R;
Q.DR=DR;
Q=predict0(Y0,Q);      
Write_rmsej(Q); 
end

 
