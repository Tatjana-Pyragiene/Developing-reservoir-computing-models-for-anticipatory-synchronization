function Lorenz_Fig2a
% Fig2 (a)
s=load ("Structure\RMSEjs.mat");
sz1=30;
sz2=5;
rmsej0=zeros(sz1,sz2);
    for i01=1:sz1
        for i02=1:sz2
        rmsej0(i01,i02)=s.rmsej(i01,i02).f;
        end    
    end

fnt=11;
[n,Nlam]=size(rmsej0);


MarkerSz=4;
Marker_Step=5;
Marker_mas=['>', 'o', '>', '<', '*','^','x','o' ];
col0_mas=['red','black','blue','magenta','black','blue','magenta','red'];
col0_szj=[3,5,4,7,5,4,7,3];
LineWd = 0.5;

ist=1;
nj=1:n;   
ik=0;
p=ones(1,Nlam);
for jlam=1:Nlam        
hold on
ik=ik+1;               
      ist1=ist+col0_szj(ik);        
      col0=col0_mas(ist:ist1-1); 
            StartInd=1;
      	    if(ik==1) 
               StartInd=3;
            end
      p(ik)=plot(nj,rmsej0(1:n,jlam),"LineStyle",'-', ...
       "LineStyle",'-',... 
      "LineWidth", LineWd, "Color",col0,...
       "Marker",Marker_mas(ik), "MarkerFaceColor",'none', ...      
       "MarkerSize",MarkerSz, "MarkerEdgeColor",col0,...
       "MarkerIndices", StartInd:Marker_Step:n);
      ist=ist1;
end % jlam

ymx=10^(-1);
ymn=5*10^(-7);

yscale log
ylim([ymn,ymx]);
xlim([0 n+1]);
Legend={'$\lambda_{\perp}=-100$' ,'$\lambda_{\perp}=-50$', '$\lambda_\perp=-30$','$\lambda_{\perp}=-20$',...
    '$\lambda_{\perp}=-10$'};
legend(p([1,2,3,4,5]),Legend,'Location', 'northwest', 'Interpreter','latex', 'FontSize',9);
legend('boxoff')
xlabel('$j$', 'Interpreter','latex', 'FontSize',fnt) 
ylabel('RMSE$(j)$', 'Interpreter','latex', 'FontSize',fnt) 
xticks([1 15 30])
xticklabels({'1','15','30', 'FontSize',fnt});
yticks([10^(-6) 10^(-5) 10^(-4) 10^(-3) 10^(-2) 10^(-1)]);
yticklabels({'10^{-6}' '10^{-5}' '10^{-4}' '10^{-3}' '10^{-2}' '10^{-1}', 'FontSize',fnt});
text(1,6.*10^(-2), '(a)', 'FontSize',fnt) 
end