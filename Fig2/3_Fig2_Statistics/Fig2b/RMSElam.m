function RMSElam(Q,y0)
n=Q.n;
h=Q.h;
L=Q.L;
LP=Q.LP;
Lin=Q.Lin;

Ninitcond=Q.Ninitcond;
Nlam=Q.lamNlsz-1;
%Nlam=2; % Debug
deltaX=Q.deltaX;
rmsel=zeros(Nlam,Ninitcond);        
y0_mem=y0;
Lin0=Lin;

for iLam=1:Nlam
    Q.iLam=iLam;
    lam=Q.lamNl(iLam);    
    Q.lam=lam;
    disp1=['   iLam =' num2str(iLam) ', max iLam =' num2str(Nlam)];     
for icond=1:Ninitcond
    disp(disp1)
    disp0=['icond =' num2str(icond) ', max icond =' num2str(Ninitcond)];
    disp(disp0)
        y0=y0_mem;
        Lin=Lin0+(icond-1)*deltaX;
        Q.icond=icond;
        Q.Lin=Lin;            
        [X0,Y0,Z0]=Lorenz_signal(h,Lin,y0);
        y0=[X0(end),Y0(end),Z0(end)].';
        [Y0,~,~]=Lorenz_signal(h,L+LP-1,y0);
        Q=predict(Y0,Q);
        U=Q.U;
        XP=Q.XP;
        j0=Q.j0;
% Computing the rms error for n*tau delay 
% icond and lam=Q.lamNl(iLam)
% std - Standard deviation
stdp=std(U);
Ntau=Q.Ntau;
deln=XP(j0:LP-n*Ntau,n)-U(j0+n*Ntau:LP);
%disp('rmsest error for n*tau prediction time')
rmselam0=sqrt(mean(deln.^2))/stdp;
rmsel(iLam,icond)=rmselam0;        
end % icond
end % iLam

Q.rmsel=rmsel;
Write_rmse(Q); 
end