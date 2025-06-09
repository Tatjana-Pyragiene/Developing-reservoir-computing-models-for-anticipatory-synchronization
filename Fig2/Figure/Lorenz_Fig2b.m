function Lorenz_Fig2b()
fnt=11;
s=load("Structure\RMSEls.mat");
sz1=100;
sz2=5;
rmsel0=zeros(sz1,sz2);
    for i01=1:sz1
        for i02=1:sz2
        rmsel0(i01,i02)=s.rmsel(i01,i02);
        end    
    end

% v1a=rmsel(:,1);
% v1=v1a(v1a<0.1344);
% v2a=rmsel(:,2);
% v2=v2a(v2a<0.01466);
% v3a=rmsel(:,3);
% v3=v3a(v3a<0.01697);
% v4a=rmsel(:,4);
% v4=v4a(v4a<0.02021);
% v5a=rmsel(:,5);
% v5=v5a(v5a<0.02845);
%  meanl=[mean(v1), mean(v2), mean(v3), mean(v4), mean(v5)];

ymx=4*10^-2;
ymn=10^-5;

boxchart(rmsel0,'MarkerStyle','none')
hold on
ylim([ymn,ymx]);
set(gca,'Yscale','log')
set(gca,'XTickLabel',{'-100','-50','-30','-20','-10'});
xlabel('$\lambda_\perp$','Interpreter','latex', 'FontSize',fnt)
yticklabels({'10^{-7}' '10^{-6}'...
    '10^{-5}' '10^{-4}' '10^{-3}' '10^{-2}' '10^{-1}', 'FontSize',fnt});
ylabel('RMSE$(15)$', 'Interpreter','latex', 'FontSize',fnt) 
text(0.4,2.6*10^(-2), '(b)', 'FontSize',fnt) 
end