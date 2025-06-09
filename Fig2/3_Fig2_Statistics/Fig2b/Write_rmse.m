function  Write_rmse(Q)

rmsel=Q.rmsel;
save("Double1\rmsel.mat","rmsel");

B=cell_mas1(rmsel);    
RMSEl = struct('f',B);
save("Structure1\RMSEls.mat","RMSEl");
end

