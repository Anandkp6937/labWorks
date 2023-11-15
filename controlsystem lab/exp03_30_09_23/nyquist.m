%output verified
clear all;
clc;
w=logspace(-2,1,6);
num=[0 0 1];
den=[1 5 6 0];
sys=tf(num,den)
nyquist(sys);
title('original sysytem');
[gm,pm,wpc,wgc]=margin(sys);
[mag,ph,w]=bode(sys,w);
[mp,k]=max(mag);
res_peak=20*log10(mp);
res_fre=w(k);
n=1;
while 20*log(mag(n))>=-3;
    n=n+1;
end
stepinfo(sys);
%zeros added to the system s+1
num1=[1 1 1];
sys1=tf(num1,den);
f2=figure(2);
nyquist(sys1);
title('zero added system')
%verified


[gm,pm,wpc,wgc]=margin(sys1)
[mag,ph,w]=bode(sys1,w)
[Mp,k]=max(mag)
res_peak=20*log10(Mp)
res_freq=w(k)
n=1;
while 20*log(mag(n))>=-3;
    n=n+1
end
bw=w(n)
%poles added to the system 1/s+1
den1=[0.004 0.2214 1.22 1];
sys2=tf(num,den1);
f3=figure(3);
nyquist(sys2);
title('original system2')
[gm,pm,wpc,wgc]=margin(sys2)
[mag,ph,w]=bode(sys2,w)
[Mp,k]=max(mag)
res_peak=20*log10(mp)
res_freq=w(k)
n=1;
while 20*log(mag(n))>=-3;
    n=n+1
end
bw=w(n);