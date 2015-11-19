function [ ratt, par ] = Curve_whj_orig_initRuleGivenData( )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = 1;%ǰ�����Ը���
preNE = [5];%ÿ��ǰ�����Ժ�ѡֵ����
rNum = prod(preNE);%������
BNum = 5;%�ȼ���������

prAwFlag = false;%ǰ������Ȩ���Ƿ����ѵ��
prAFlag = true;%ǰ�����Ժ�ѡֵ�Ƿ����ѵ��
uFlag = false;%����ֵ�Ƿ����ѵ��

gB = zeros(rNum, BNum) ;%ÿ�������beta�������ǹ����ţ������СΪrNum * BNum
gwR = zeros(1, rNum);%����Ȩ�أ������СΪ1*rNum
gu = zeros(1, BNum);%����ֵ�������СΪ1*BNum
gPraW = zeros(1, preN);%ǰ������Ȩ�أ������СΪ1*preN
gPraA = cell(1,preN);%ǰ�����Ժ�ѡֵ����ϸ������ÿ��Ԫ�洢��ѡֵ���飬�����СΪ1*preN



gB = [0 0.9999 0.0001 0 0
    0 0 1 0 0
    0 0.9500 0.0500 0 0
    0 0 0 1 0
    0 0.998 0.0002 0 0];

gwR = [1 1 1 1 1];
gu = [-0.5 0 0.5 1 1.5];
gPraW = [1];
gPraA = {[-5 -2 0 2 5]};

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
par.prAwFlag= prAwFlag;
par.u = gu;

