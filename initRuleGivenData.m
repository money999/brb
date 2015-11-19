function [ ratt, par ] = Curve_wh_initRuleGivenData( )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = 4;%ǰ�����Ը���
preNE = [5 5 5 5];%ÿ��ǰ�����Ժ�ѡֵ����
rNum = prod(preNE);%������
BNum = 5;%�ȼ���������

prAFlag = true;%ǰ�����Ժ�ѡֵ�Ƿ����ѵ��
uFlag = true;%����ֵ�Ƿ����ѵ��

gB = zeros(rNum, BNum) ;%ÿ�������beta�������ǹ����ţ������СΪrNum * BNum
gwR = zeros(1, rNum);%����Ȩ�أ������СΪ1*rNum
gu = zeros(1, BNum);%����ֵ�������СΪ1*BNum
gPraW = zeros(1, preN);%ǰ������Ȩ�أ������СΪ1*preN
gPraA = cell(1,preN);%ǰ�����Ժ�ѡֵ����ϸ������ÿ��Ԫ�洢��ѡֵ���飬�����СΪ1*preN



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
    error('���ŶȾ���gB����');
end

if size(gwR, 2) ~= rNum;
    error('����Ȩ��gwR����');
end

if size(gu, 2) ~= BNum;
    error('����gu����');
end

if size(gPraW, 2) ~= preN;
    error('ǰ������Ȩ��gPraW����');
end

for i = 1:preN
    if (size(gPraA{i},2) ~= preNE(i))
        error('ǰ�����Ժ�ѡֵgPreN����');
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

