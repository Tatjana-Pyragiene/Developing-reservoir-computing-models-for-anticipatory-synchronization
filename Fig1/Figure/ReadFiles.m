function  Q=ReadFiles(Q)
% Reading dynamic data from *.mat

s=load("Structure\LenFile.mat");
sz=8;
Len=zeros(sz);
    for i0=1:sz
        Len(i0)=s.LenFile(i0).f;
    end    
% The length of the files:
%   Lenght of the file U0:    lenU0=length(U0) 
Q.lenU0=Len(1); 

%   Lenght of the file U1:    lenU1=length(U1) 
Q.lenU1=Len(2); 

Q.lenU2=Len(3); 
Q.lenXP0=Len(4); 
Q.lenXP1=Len(5); 
Q.lenXP2=Len(6); 
Q.lent1=Len(7); 
Q.lent2=Len(8); 

s=load("Structure\U0s.mat");
sz=Q.lenU0;
    for i0=1:sz
        Q.U0(i0)=s.U0s(i0).f;
    end
s=load("Structure\U1s.mat");
sz=Q.lenU1;
    for i0=1:sz
        Q.U1(i0)=s.U1s(i0).f;
    end

s=load("Structure\U2s.mat");
sz=Q.lenU2;
    for i0=1:sz
        Q.U2(i0)=s.U2s(i0).f;
    end
s=load("Structure\XP0s.mat");
sz=Q.lenXP0;
    for i0=1:sz
        Q.XP0(i0)=s.XP0s(i0).f;
    end

s=load("Structure\XP1s.mat");
sz=Q.lenXP1;
    for i0=1:sz
        Q.XP1(i0)=s.XP1s(i0).f;
    end

s=load("Structure\XP2s.mat");
sz=Q.lenXP2;
    for i0=1:sz
        Q.XP2(i0)=s.XP2s(i0).f;
    end    

s=load("Structure\t1s.mat");
sz=Q.lent1;
    for i0=1:sz
        Q.t1(i0)=s.t1s(i0).f;
    end    
s=load("Structure\t2s.mat");
sz=Q.lent2;
    for i0=1:sz
        Q.t2(i0)=s.t2s(i0).f;
    end    
end