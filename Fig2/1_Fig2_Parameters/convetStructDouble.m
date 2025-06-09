function convetStructDouble()
% Main folder: Fig2b\
s=load("Structure1\RMSEls.mat");
sz1=100;
sz2=5;
rmsel0=zeros(sz1,sz2);
    for i01=1:sz1
        for i02=1:sz2
        rmsel0(i01,i02)=s.rmsel(i01,i02);
        end    
    end
rmsel=rmsel0;
save("Double1\rmsel.mat","rmsel");
end