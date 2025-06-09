function  WriteFiles(Q)
U0=Q.U0;
save("DynDouble\U0.mat","U0");
B=cell_mas(U0);    
U0s = struct('f',B); % matr(1).f=B{1,1},   matr(2).f=B{1,2}, ..
save("DynStructure\U0s.mat","U0s");

U1=Q.U1;
save("DynDouble\U1.mat","U1");
B=cell_mas(U1);    
U1s = struct('f',B); % matr(1).f=B{1,1},   matr(2).f=B{1,2}, ..
save("DynStructure\U1s.mat","U1s");

U2=Q.U2;
save("DynDouble\U2.mat","U2");
B=cell_mas(U2);    
U2s = struct('f',B); % U2s(1).f=B{1,1},   U2s(2).f=B{1,2}, ..
save("DynStructure\U2s.mat","U2s");

lenU0=length(U0); 
lenU1=length(U1); 
lenU2=length(U2);
len_file1=[lenU0; lenU1; lenU2];

XP0=Q.XP0;
save("DynDouble\XP0.mat","XP0");
B=cell_mas(XP0);    
XP0s = struct('f',B); 
save("DynStructure\XP0s.mat","XP0s")

XP1=Q.XP1;
save("DynDouble\XP1.mat","XP1");
B=cell_mas(XP1);    
XP1s = struct('f',B); 
save("DynStructure\XP1s.mat","XP1s")

XP2=Q.XP2;
save("DynDouble\XP2.mat","XP2");
B=cell_mas(XP2);    
XP2s = struct('f',B); 
save("DynStructure\XP2s.mat","XP2s")

lenXP0=length(XP0); 
lenXP1=length(XP1); 
lenXP2=length(XP2);

len_file2=[lenXP0; lenXP1; lenXP2];

t1=Q.t1;
save("DynDouble\t1.mat","t1");
lent1=length(t1);
B=cell_mas(t1);    
t1s = struct('f',B); 
save("DynStructure\t1s.mat","t1s");


t2=Q.t2;
save("DynDouble\t2.mat","t2");
lent2=length(t2);
B=cell_mas(t2);    
t2s = struct('f',B); 
save("DynStructure\t2s.mat","t2s");
len_time=[lent1; lent2];

lenfile=vertcat(len_file1,len_file2,len_time);
save("DynDouble\lenfile.mat","lenfile");
B=cell_mas(lenfile);    
LenFile = struct('f',B); 
save("DynStructure\LenFile.mat","LenFile");

rmsj=Q.rmsj;
save("DynDouble\rmsj.mat","rmsj");
B=cell_mas(rmsj);    
rmsjs = struct('f',B);
save("DynStructure\rmsjs.mat","rmsjs");
end
