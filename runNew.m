%clear global;
clear;


load('TrainData2008.mat');
x0 = TrainData2008(:,1:2);
%[ ratt, par] = oil_used_initRuleGivenData();
load('C:\Users\money\Desktop\µ⁄“ª¥Œ ‰”Õ ß∞‹\ruleNew.mat');
ratt = rattNew;
yTrainMy = zeros(1,2007);
for i = 1:2007
[Be,BeA] = activeRuleNew(ratt, x0(i,:));
yTrainMy(i) = sum(Be .* [ratt.u]);
%disp(i);
end



plot(1:2007, yTrainMy);
yRight = TrainData2008(:,3);
yRight = yRight';
hold on
plot(1:2007, yRight, 'r');

[ ratt, par] = oil_used_initRuleGivenData();
yTrainWhj = zeros(1,2007);
for i = 1:2007
[Be,BeA] = activeRuleNew(ratt, x0(i,:));
yTrainWhj(i) = sum(Be .* [ratt.u]);
%disp(i);
end
hold on
plot(1:2007, yTrainWhj, 'g');

yMy = sum(abs(yRight - yTrainMy));
yMy = yMy/2007;

yWhj = sum(abs(yRight - yTrainWhj));
yWhj = yWhj/2007;
legend('fzj','trueData','whj');
text([2300 2300 2300], [5 4.5 4], {'delta Y',  ['fzj: ' num2str(yMy)],  ['whj: ' num2str(yWhj)]});


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [ ratt, par ] =Curve_whj_orig_initRuleGivenData( );
% [ x ] = ratt2x( ratt, par);
% 
% for i = 1:10
%     for j = 1:36
%         fmin_fun(par, x);
%     end
%     disp(i);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  [ ratt, par ] =Curve_whj_orig_initRuleGivenData( );
%  [ x ] = ratt2x( ratt, par);
%  x= x';
%  [ ratt1 ] = x2ratt( x, par );

% ratt.u = [-0.5,-0.2671,0.1801,0.8737,1.5];
% 
% prA(1).a = [-5.0 -2.0470 -0.1180 2.0539 5.0];
% prA(1).w = 1.0;
% 
% rule(1).wR = 0.9687;
% rule(1).B = [0.2295,0.4180,0.1603,0.1603,0.0319];
% 
% rule(2).wR = 0.3493;
% rule(2).B = [0.0487,0.0692,0.4992,0.1915,0.1914];
% 
% rule(3).wR = 0.4356;
% rule(3).B = [0.2044,0.3174,0.3396,0.0852,0.0535];
% 
% rule(4).wR = 0.2940;
% rule(4).B = [0.0586,0.0624,0.1064,0.2145,0.5581];
% 
% rule(5).wR = 0.7999;
% rule(5).B = [0.0686,0.4841,0.3447,0.1025,0.0000];
% 
% ratt.prA = prA;
% ratt.rule = rule;

% load('TrainData2008.mat');
% [ ratt, par] = Curve_whj_used_initRuleGivenData();
% 
% x = -5:0.1:5;
% y(size(x,2)) = 0;
% for i = 1:size(x,2)
%     [Be,BeA] = activeRuleNew(ratt, x(i));
%      y(i) = sum(Be .* [ratt.u]);
% end
% 
% plot(x, y,'.r');
% 
% yRight = exp(-(x-2).^2) + 0.5*exp(-(x+2).^2);
% hold on
% plot(x,yRight,'g');