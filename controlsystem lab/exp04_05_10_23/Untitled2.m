%design of lead compensator

num=input('\n enter the coeffient of numerator polynomial:');
den=input('\n enter the coeffient of denominator polynomial:');
kv=input('\n enter the designed velocity error constant:');
pm=input('\n enter the desired phase margin:');
eps=input('\n enter the additional phase lag,eplision:');

%determine the of k to satisfy the velocity error constant
flag1=conv([1 0],num);
G1=tf(flag1,den);
k=kv/dcgain(G1);
%tf and bode diagramme of un compensated system
g=tf(k*num,den);
figure(1);
bodeplot(g);
margin(g);
title('bode plot of un compensated sytem');
 
%design of Compensator
w=logspace(-1,2,100);
[mag,ph]=bode(g,w);
[~,phm]=margin(g);
%reshape mag array in to column vector
magdb=20*log10(mag);
magdb=reshape(magdb,100,1);
%computation of desired phase margin
phim=(pm-phm+eps);
%exraction of wm corresponding to -20log(1/sqrt(alpha) and tau
alpha=(1-sin(phim*pi/180))/(1+sin(phim*pi/180));
wm=interp1(magdb,w,-20*log(1/sqrt(alpha)));
tau=1/(wm*sqrt(alpha));
%tf and bode diagramme of compensator
GC=tf([tau 1],[alpha*tau 1]);
figure(2);
bodeplot(GC);
margin(GC);
title('bode plot of lead compensator system')
%bode plot of compensated system 
g2=g*GC;
figure(3);
bodeplot(g2); 
margin(g2);
title('bode plot of compensated system'); 
%displaying results
fprintf('\n the transfer function of lag compensated system is:')
printsys(num,den);
[gm,pm]=margin(g);
fprintf('\n the gain margin of un compensated system is:\t%4.2fdb\n',gm);
fprintf('\n the phase margin of un compensated system is:\t%4.2fdeg\n',pm);
fprintf('\n the transfer function of lead compensated system');
printsys([tau 1],[alpha*tau 1]);
fprintf('\n the transfer function of lag compensator is:');
[n,d]=tfdata(g2,'v');
printsys(n,d);
[gm1,pm1]=margin(g2);
fprintf('\n the gain margin of  compensated system is:\t%4.2fdb\n',gm1);
fprintf('\n the phase margin of compensated system is:\t%4.2fdb\n',pm1);
gg=tf([1 0],[0 1]);
kv1=dcgain(gg*g2);
if(pm1>=pm)&&(kv1>=kv)
    disp('the design is accetable')
else
    disp('the design id not acceptable redesign with another bvalue of eps')
end
 
 
 
 
 
 
 
 
 


