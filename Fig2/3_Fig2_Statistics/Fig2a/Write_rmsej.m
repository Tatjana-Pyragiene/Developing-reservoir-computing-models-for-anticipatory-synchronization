function  Write_rmsej(Q)

rmsej=Q.rmsej;
save("Double1/rmsej.mat","rmsej");
B=cell_mas1(rmsej);    
RMSEj = struct('f',B);
save("Structure1/RMSEj.mat","RMSEj");
end

