% lh=findall(gca,'type','line');
% xc = get(lh, 'xdata');
% yc = get(lh, 'ydata');
% plot(xc,yc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555555
% ang = 0:0.01:2*pi;
% r = zeros(size(ang));
% N = length(ang);
% r(1) = 1;
% syms x y
% f = (x^2-1)^3/(x^5) - sin(y)^3 * cos(y)^2;
% 
% for i = 2 : N
%     f1 = subs(f, y, ang(i));
%     rlt = solve(f1);
%     rlt = eval(rlt);
% 
%     [~, ind] = min(abs(rlt-r(i-1)));
%     r(i) = rlt(ind);
% end
% 
% x = r .* cos(ang);
% y = r .* sin(ang);
% plot(x,y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555555
% res = mvnrnd([0,0], 0.04*eye(2), 1000);
% tt = reshape(res, 1, 2000);
% plot(1:2000, tt, '.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555555
% a = 3;
% if a>3
%     disp(1);
% elseif a<3
%     disp(2);
% elseif a==3
%     disp(3);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555555