function y = curve_fmin_fun( par, x )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

ratt = x2ratt(x, par); 

x = -5:0.0125:5;
yTrain(size(x,2)) = 0;
for i = 1:size(x,2)
    [Be,BeA] = activeRuleNew(ratt, x(i));
     yTrain(i) = sum(Be .* [ratt.u]);
end

yRight = exp(-(x-2).^2) + 0.5*exp(-(x+2).^2);

y = sum(abs(yRight - yTrain));
y = y/size(x,2);

end

