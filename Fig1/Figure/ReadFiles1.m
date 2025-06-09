function  Q=ReadFiles1()
% Reading files from  *.mat files

s=load("Structure1\lamNs.mat");
sz=size(s.lamNs);
sz2=sz(1,2);
lamN=zeros(1,sz2);
    for i02=1:sz2
        lamN(1,i02)=s.lamNs(1,i02).f;
    end
Q.lamN=lamN; % lamN is an array of the Lypunov exponents

%  RMSEj is an array 
% of root mean squared errors (RMSE) 
% for different j and lam
s=load("Structure1\RMSEjs.mat");
sz1=50;
sz2=8;
RMSEj=zeros(sz1,sz2);
    for i01=1:sz1
        for i02=1:sz2
        RMSEj(i01,i02)=s.RMSEjs(i01,i02).f;
        end    
    end
Q.RMSEj=RMSEj; 
end