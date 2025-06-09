function Roessler_Fig1b()
fnt=11;
% rmsel vs lam
% Compute the dependence rmsel vs lam 
%  rmsel is an array 
% of root mean squared errors (RMSE) 
% for different lam and initial conditions for the learning phase

s=load("Structure1\RMSEls.mat");
sz1=100;
sz2=5;
rmsel=zeros(sz1,sz2);
    for i01=1:sz1
        for i02=1:sz2
        rmsel(i01,i02)=s.RMSEls(i01,i02).f;        
        end    
    end

ymx=2*10^-3;
ymn=10^-7;

boxchart(rmsel,'MarkerStyle','none')
hold on
ylim([ymn,ymx]);
set(gca,'Yscale','log')
set(gca,'XTickLabel',{'-10','-5','-1','-0.7','-0.6'});
xlabel('$\lambda_\perp$','Interpreter','latex', 'FontSize',fnt)
yticks([10^(-7) 10^(-6) 10^(-5) 10^(-4) 10^(-3) 10^(-2) 10^(-1)]);
yticklabels({'10^{-7}' '10^{-6}'...
    '10^{-5}' '10^{-4}' '10^{-3}' '10^{-2}' '10^{-1}', 'FontSize',fnt});
ylabel('RMSE$(25)$', 'Interpreter','latex', 'FontSize',fnt) 
text(0.4,1.2*10^(-3), '(b)', 'FontSize',fnt) 
end