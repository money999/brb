function y = oil_fmin_fun( par, x )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

ratt = x2ratt(x, par); 

data = load('TrainData2008.mat');
x0 = data.TrainData2008(:,1:2);
yTrain = zeros(1,2007);
for i = 1:2007
[Be,BeA] = activeRuleNew(ratt, x0(i,:));
yTrain(i) = sum(Be .* [ratt.u]);
end
yRight = data.TrainData2008(:,3);
yRight = yRight';

y = sum(abs(yRight - yTrain));
y = y/2007;

disp(y);
end

