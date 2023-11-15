clear all;
clc;
t=0:10:1000;
num=[0 0 1];
den=[1 5 6 0];
sys=tf(num,den);
f1=figure(1);
rlocus(sys);
title('original syatem');
num1=[1 1 1];
sys1=tf(num1,den);
f2=figure(2);
rlocus(sys1);
title('step added system')
den1=[0.004 0.2214 1.11 1];
sys2=tf(num,den1);
f3=figure(3);
rlocus(sys2);
title('original system2')