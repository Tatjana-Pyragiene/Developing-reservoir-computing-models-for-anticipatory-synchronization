function B=cell_mas(mas)
sz=length(mas);
B=cell(1,sz);
    for i0=1:sz
        B(1,i0)={mas(i0)};
    end       
end