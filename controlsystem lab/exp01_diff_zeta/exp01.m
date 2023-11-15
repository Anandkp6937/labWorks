%                             //verified programme
clear all;
clc;
t=0:10:1000;
zeta=[0 0.1 0.8 1 1.5];
wn=0.01;
for i=1:5
    num=[0 0 1];
    den=[1 2*zeta(i)*wn wn^2];
    [y(1:length(t),i),x]=step(num,den,t);
    plot(t,y)
    title('step response')
    xlabel('time')
    ylabel('response')
    hold on
end
gtext('zeta=0')
gtext('zeta=0.1')
gtext('zeta=0.8')
gtext('zeta=1')
gtext('zeta=1.5')

