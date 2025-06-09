function Roessler_Fig1a()
% Fig1 (a)
% RMSEj vs j
% Compute the dependence RMSE vs j 
% for different  conditional Lyapunov exponent, lam. 

% RMSE -  root mean squared errors  

% j is a number of predictive model 
% j = 1..n
% n=50  is the max.  number in series coupled predictive models

% lamN, RMSEj
Q=ReadFiles1(); %  Q.lamN.mat, Q.RMSEj

% Seclected for drawing lam: 
% [-10, -5, -1, 0.7,-0.6]
fnt=11;
RMSEj=Q.RMSEj;
[n,Nlam]=size(RMSEj);

MarkerSz=3;
Marker_Step=8;
Marker_mas=['>','o','>','<','*'];
col0_mas=['red','black','blue','magenta','red'];
col0_szj=[3,5,4,7,3];
LineWd = 0.5;
%figure (kfig)
ist=1;
p=ones(1,Nlam-3);
nj=1:n;
hold on
ik=0;
for jlam=3:Nlam
    if(jlam~=5)
      ik=ik+1;             
      ist1=ist+col0_szj(ik);        
      col0=col0_mas(ist:ist1-1); 
      StartInd=1;
      	    if(ik==1) 
                StartInd=3;
            end
       p(ik)=plot(nj,RMSEj(1:n,jlam),"LineStyle",'-',... 
      "LineWidth", LineWd, "Color",col0,...
       "Marker",Marker_mas(ik), "MarkerFaceColor",'none', ...      
       "MarkerSize",MarkerSz, "MarkerEdgeColor",col0,...
       "MarkerIndices", StartInd:Marker_Step:n);
      ist=ist1;
    end
end
ymx=10^(-1);
ymn=10^(-8);

yscale log
ylim([ymn,ymx]);
xlim([0 n+1]);
Legend={'$\lambda_{\perp}=-10$' ,'$\lambda_{\perp}=-5$', '$\lambda_{\perp}=-1$','$\lambda_{\perp}=-0.7$',...
    '$\lambda_{\perp}=-0.6$'};
legend(p([1,2,3,4,5]),Legend,'Location', 'northwest', 'Interpreter','latex', 'FontSize',9);
legend('boxoff')
%xlabel('Predictive model #') 
xlabel('$j$', 'Interpreter','latex', 'FontSize',fnt) 
%ylabel('Prediction RMSE') 
ylabel('RMSE$(j)$', 'Interpreter','latex', 'FontSize',fnt) 
xticks([1 25 50])
xticklabels({'1','25','50', 'FontSize',fnt});
%yticks([10^(-8) 10^(-5)  10^(-1)]);
yticks([10^(-8) 10^(-7) 10^(-6) 10^(-5) 10^(-4) 10^(-3) 10^(-2) 10^(-1)]);
yticklabels({'10^{-8}' '10^{-7}' '10^{-6}'...
    '10^{-5}' '10^{-4}' '10^{-3}' '10^{-2}' '10^{-1}', 'FontSize',fnt});
ylim([10^-8 10^-1])
text(1,5*10^(-2), '(a)', 'FontSize',fnt) 
end