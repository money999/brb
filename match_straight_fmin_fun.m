function y = match_straight_fmin_fun(par, adis ,x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
ratt = x2ratt(x, par);
pNum = size(adis, 1);


yd = 0;
for i = 1:pNum
    xin = adis(i,:);
    %%%%控制高斯加燥导致无限大的情况
    if xin(1)>5
        xin(1) = 5;
    end
    if xin(2)>1.8
        xin(2) = 1.8;
    end
    
    [Be,BeA] = activeRuleNew(ratt, xin);
    
    if (adis(i,3) >= 0.51)
        yd = yd + abs(1 - Be(1)) + abs(Be(2) - 0);
        continue;
    end
    
    if (adis(i,1) <= 1)
        yd = yd + abs(0 - Be(1)) + abs(Be(2) - 1);
    elseif (adis(i,1) >5)
        yd = yd + abs(1 - Be(1)) + abs(Be(2) - 0);
    else
        tp1 = -0.25 * adis(i,1) + 1.25;
        tp0 = 1 - tp1;
        yd = yd + abs(tp0 - Be(1)) + abs(tp1 - Be(2));
    end
    
    
    if (adis(i,2) > 1)
        tv1 = -5/9 * adis(i,2) + 1;
        tv0 = 1 - tv1;
        yd = yd + abs(tv0 - Be(1)) + abs(tv1 - Be(2));
    end
   
    
    
end

% yk = 0;
% for i = 1:(pNum/2)
%     if i == pNum - i + 1
%         xin = [pdis(i,pNum-i+2) vdis(i,pNum-i+2) cdis(i,pNum-i+2)];
%         [Be,BeA] = activeRuleNew(ratt, xin);
%         yk = yk + sum(Be .* [ratt.u]);
%     else
%         xin = [pdis(i,pNum-i+1) vdis(i,pNum-i+1) cdis(i,pNum-i+1)];
%         [Be,BeA] = activeRuleNew(ratt, xin);
%         yk = yk + sum(Be .* [ratt.u]);
%     end
% end
% y = yk - yd;
y = yd;
y = y/(pNum);
end

