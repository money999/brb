function [ ratt, par ] = initRule( )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = 3;%ǰ�����Ը���
preNE = [3 3 3];%ÿ��ǰ�����Ժ�ѡֵ����
rNum = prod(preNE);%������
BNum = 2;%�ȼ���������

prAwFlag = false;%ǰ������Ȩ���Ƿ����ѵ��
prAFlag = true;%ǰ�����Ժ�ѡֵ�Ƿ����ѵ��
uFlag = false;%����ֵ�Ƿ����ѵ��

BFlag = true;%��Ϊ1

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