%parameters           //VERIFIED PROGRAMME
J=0.01;
K=0.01;
L=0.5;
B=0.1;
R=1;
%system matrix
A=[-B/J K/J ;-K/L -R/L];
B=[0;1/L];
C=[1 0];
D=[0];
%controllability
QC=[B A*B]
%to determine the rank of controllability
R1=rank(QC)
%obsrvability
Qo=[C' A'* C']
%to determine the rank of observability
R2=rank(Qo)
Co=ctrb(A,B)
unco=length(A)-rank(Co)
Ob=obsv(A,C)
unob=length(A)-rank(Ob)
Qc=rank([B A*B])
Qo=rank([C' A'*C'])
'G';
G=ss(A,B,C,D);
figure(1) 
step(G)
T=feedback(G,1)
figure(2)
step(T)
'EIGEN VALUES OF t ARE';
systemmatrix=ssdata(T)
eigenvalues=eig(T)
if(eigenvalues<0)
    disp('System is stable');  
else
    disp('System is unstable')
end;
sys=ss(A,B,C,D)
figure(1)
step(sys)
stepinfo(sys)
hold on;
pol=pole(sys)
 
g=[-10+1i*10 -10-1i*10];
k=place(A,B,g);
Z=A-B*k
syscl=ss(Z,B,C,D)
figure(3)
step(syscl)
hold on
