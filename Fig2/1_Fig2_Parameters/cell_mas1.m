function B=cell_mas1(mas)
sz=size(mas);
sz1=sz(1,1);
sz2=sz(1,2);
B=cell(sz1,sz2);
    for i01=1:sz1
        for i02=1:sz2
            B(i01,i02)={mas(i01,i02)};
        end
    end       
end