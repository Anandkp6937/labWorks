%                            //verified programme
J=0.01;          
b=0.1;
K=0.01;
R=1;
L=0.5;
s=tf('s');
p_motor=K/((J*s+b)*(L*s+R)+K^2);
step(p_motor);
hold on
Kp=100;
C=pid(Kp);
sys_cl=feedback(C*p_motor,1);
t=0:0.01:5;
step(sys_cl,t)
grid
title('step response with propotional control');
Kp=75;
Ki=1;
Kd=1;
C=pid(Kp,Ki,Kd);
sys_cl=feedback(C*p_motor,1);
step(sys_cl,[0:1:200])
title('PID Control with Small Ki and Small Kd')
Kp=100;
Ki=200;
Kd=1;
C=pid(Kp,Ki,Kd);
sys_cl=feedback(C*p_motor,1);
step(sys_cl,0:0.01:4)
grid
title('PID Control with large Ki and Small Kd')
Kp=100;
Ki=200;
Kd=10;
C=pid(Kp,Ki,Kd);
sys_cl=feedback(C*p_motor,1);
step(sys_cl,0:0.01:4)
grid
title('PID Control with Large Ki and Large Kd') 


