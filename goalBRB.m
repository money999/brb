function [ result ] = goalBRB( m1, m0, mA )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%w = log((1-m0)./(1.000001-m1));
w = m1;

if isnan(sum(sum(w)))
    disp(95123);
end

%生成01规划所要的约束条件
num = size(w,1);
m1 = [];
m2 = [];
for i = 1:num
    ta = zeros(num);
    ta(i,:) = 1;
    m1 = [m1 ta];
    m2 = [m2 eye(num)];
end
mA = [m1; m2];

%%%01规划
f = reshape(w, num*num,1);%目标函数
intcon = 1:num*num;%每个都是整数   这个意思是那几个位置需要为整数
Aeq = mA;%等式约束保证行列和为1
beq = ones(num*2, 1);
lb = zeros(num*num,1);%下限0
ub = ones(num*num,1);%上限1
options = optimoptions('intlinprog', 'Display', 'off');
result = intlinprog(-f, intcon, [], [], Aeq, beq, lb, ub, options);%加个负号求最大值
result = reshape(result, num, num);


end

