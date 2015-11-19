function [ ratt, par ] = initRule( )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

preN = 3;%前提属性个数
preNE = [3 3 3];%每个前提属性候选值个数
rNum = prod(preNE);%规则数
BNum = 2;%等级评价数量

prAwFlag = false;%前提属性权重是否参与训练
prAFlag = true;%前提属性候选值是否参与训练
uFlag = false;%期望值是否参与训练

BFlag = true;%和为1

if min(preNE) < 2
    error('dsf');
end

if size(preNE, 2) ~= preN
    error('dsf');
end

if BNum < 2
    error('dsf');
end
rule(rNum).B = [];
for i = 1:rNum
    rule(i).B = rand(1,BNum);
    if BFlag
        rule(i).B = rule(i).B ./ sum(rule(i).B);
    end
    rule(i).wR = rand();
end
prA(preN).w =0;
for i = 1:preN
    prA(i).w = rand();
    prA(i).a = rand(1, preNE(i));
end

ratt.rule = rule;
ratt.prA = prA;
ratt.u = rand(1,BNum);

par.preNE = preNE;
par.BNum = BNum;
par.prA = prA;
par.prAFlag = prAFlag;
par.uFlag = uFlag;
par.prAwFlag= prAwFlag;
par.u = ratt.u;
end