function Q=RMSElam(Q,y0)
n=Q.n;
h=Q.h;
L=Q.L;
LP=Q.LP;

Lin=Q.Lin;

Ninitcond=Q.Ninitcond;
Nlam=Q.lamNlsz;
deltaX=Q.deltaX;
rmsel=zeros(Ninitcond,Nlam);        

for iLam=1:Nlam
    Q.iLam=iLam;
    lam=Q.lamNl(iLam);    
    Q.lam=lam;
    disp1=['   iLam =' num2str(iLam) ', max iLam =' num2str(Nlam)];
    disp(disp1)
for icond=1:Ninitcond
disp0=['icond =' num2str(icond) ', max icond =' num2str(Ninitcond)];
disp(disp0)
Lin=Lin+(icond-1)*deltaX;
Q.icond=icond;
Q.Lin=Lin;
    
[X0,Y0,Z0]=Roessler_signal(h,Lin,y0,Q);
y0=[X0(end),Y0(end),Z0(end)].';
[~,Y0,~]=Roessler_signal(h,L+LP-1,y0,Q);
Q=predict(Y0,Q);
U=Q.U;
XP=Q.XP;
j0=Q.j0;
% Computing the rms error for n*tau delay 
% std - Standard deviation
stdp=std(U);
Ntau=Q.Ntau;
deln=XP(j0:LP-n*Ntau,n)-U(j0+n*Ntau:LP);
%disp('rmse error for n*tau prediction time')
rmselam0=sqrt(mean(deln.^2))/stdp;
rmsel(icond,iLam)=rmselam0;        
end % icond
end %iLam        
Q.rmsel=rmsel;
end