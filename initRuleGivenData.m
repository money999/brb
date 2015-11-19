function [ ratt, par ] = Curve_wh_initRuleGivenData( )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

preN = 4;%前提属性个数
preNE = [5 5 5 5];%每个前提属性候选值个数
rNum = prod(preNE);%规则数
BNum = 5;%等级评价数量

prAFlag = true;%前提属性候选值是否参与训练
uFlag = true;%期望值是否参与训练

gB = zeros(rNum, BNum) ;%每条规则的beta，行数是规则编号，矩阵大小为rNum * BNum
gwR = zeros(1, rNum);%规则权重，矩阵大小为1*rNum
gu = zeros(1, BNum);%期望值，矩阵大小为1*BNum
gPraW = zeros(1, preN);%前提属性权重，矩阵大小为1*preN
gPraA = cell(1,preN);%前提属性候选值采用细胞矩阵，每个元存储候选值数组，矩阵大小为1*preN



gB = [0.2295,0.4180,0.1603,0.1603,0.0319
    0.0487,0.0692,0.4992,0.1915,0.1914
    0.2044,0.3174,0.3396,0.0852,0.0535
    0.0586,0.0624,0.1064,0.2145,0.5581
    0.0686,0.4841,0.3447,0.1025,0.0000];
gBt = [];
for i = 1:rNum/5
    gBt = [gBt;gB];
end
gB = gBt;

gwR = rand(1,rNum);
gu = [-0.5,-0.2671,0.1801,0.8737,1.5];
gPraW = [0.5 0.4 0.3 0.2];
gPraA = {[-5.0 -2.0470 -0.1180 2.0539 5.0] [0.2 0.3 0.4 0.5 0.5] [0.7 0.8 0.9 0.98 0.99] [0.5 0.6 0.7 0.8 0.9]};

if (size(gB,1) ~= rNum || size(gB,2) ~= BNum)
    error('置信度矩阵gB出错');
end

if size(gwR, 2) ~= rNum;
    error('规则权重gwR出错');
end

if size(gu, 2) ~= BNum;
    error('期望gu出错');
end

if size(gPraW, 2) ~= preN;
    error('前提属性权重gPraW出错');
end

for i = 1:preN
    if (size(gPraA{i},2) ~= preNE(i))
        error('前提属性候选值gPreN出错');
    end
end

ratt.u = gu;
prA(preN).a = [];
prA(preN).w = 0;
for i = 1:preN
    prA(i).a = gPraA{i};
    prA(i).w = gPraW(i);
end

rule(rNum).wR = 0;
rule(rNum).B = [];
for i = 1:rNum
    rule(i).B = gB(i,:);
    rule(i).wR = gwR(i);
end

ratt.prA = prA;
ratt.rule = rule;

par.preNE = preNE;
par.BNum = BNum;
par.prA = prA;
par.prAFlag = prAFlag;
par.uFlag = uFlag;
par.u = gu;

