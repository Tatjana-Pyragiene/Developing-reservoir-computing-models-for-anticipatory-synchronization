function matr = generate_all_exp_matrices(m,DegMax)
C=cell(1,DegMax);
for i=1:DegMax
    C(1,i)={genExponents(m, i)};
end
matr = struct('f',C); % matr(1).f=C{1,1},   matr(2).f=C{1,2}, ..
save("matr.mat","matr")
end

