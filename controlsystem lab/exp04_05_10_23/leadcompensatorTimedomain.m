clear all;
clc;
num=[0 0 2];
den=[1 0 2];
num1=[0 0 4 2];
den1=[1 3 4 2];
t=0:0.02:15
c1=step(num,den,t);
c2=step(num1,den1,t); 
plot(t,c1,t,c2);
grid
title('Unit step responsated and compensated system');
x label('t sec'); 
y label('output');
text(2,0,88,'compensated system');
text(3.1,1.48,'uncompensated system');
