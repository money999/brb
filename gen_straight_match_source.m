function [adis] = gen_straight_match_source()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

pp = [0 0.3 0.6 1 3 5];  %6
vv = [0 0.3 0.7 1 1.8];%5
cc = [0 0.3 0.4 0.5 0.4 0.7 1];%7

adis = zeros(336,3);
ntt = 1;
for i = 1:6
    for j = 1:5
        for k = 1:7
            adis(ntt, :) = [pp(i) vv(j) cc(k)];
            ntt = ntt + 1;
        end
    end
end


end





