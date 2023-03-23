clc
clear

global h 
global l
global Xd 
global Vt


l=[1 0 0 0 0;0 1 1 0 1;0 0 0 1 0];
h=[0 0 1 0 0;1 0 0 0 0;0 1 0 -1 1];
Xd=[2;2;1];
Vt=Xd-(l(:,1)+l(:,2)+l(:,3)+l(:,4)+l(:,5));
Vt_boy=norm(Vt);
delta_teta=[0; 0; 0; 0; 0];
i=1;

Phi=eye(30);
Phi(7:12,1:6)=eye(6);
Phi(13:18,1:6)=eye(6);
Phi(19:24,1:6)=eye(6);
Phi(25:30,1:6)=eye(6);
Phi(13:18,7:12)=eye(6);
Phi(19:24,7:12)=eye(6);
Phi(25:30,7:12)=eye(6);
Phi(19:24,13:18)=eye(6);
Phi(25:30,13:18)=eye(6);
Phi(25:30,19:24)=eye(6);

H=zeros(30,5);

Phi_t=[zeros(6,24) eye(6)];

L21=skew(-l(:,1));
L32=skew(-l(:,2));
L43=skew(-l(:,3));
L54=skew(-l(:,4));
Lt5=skew(-l(:,5));
L31=L21+L32;
L42=L32+L43;
L53=L43+L54;
L41=L43+L31;
L52=L53+L32;
L51=L54+L41;

H(1:3,1)=h(:,1);
H(7:9,2)=h(:,2);
H(13:15,3)=h(:,3);
H(19:21,4)=h(:,4);
H(25:27,5)=h(:,5);

Phi_t(4:6,25:27)=Lt5;

Phi(10:12,1:3)=L21;
Phi(16:18,1:3)=L31;
Phi(22:24,1:3)=L41;
Phi(28:30,1:3)=L51;
Phi(16:18,7:9)=L32;
Phi(22:24,7:9)=L42;
Phi(28:30,7:9)=L52;
Phi(22:24,13:15)=L43;
Phi(28:30,13:15)=L53;
Phi(28:30,19:21)=L54;

J=Phi_t*Phi*H;

Vt=Xd-(l(:,1)+l(:,2)+l(:,3)+l(:,4)+l(:,5));
teta_dot=pinv(J(4:6,:))*Vt;
delta_teta=teta_dot*0.01;
Vt_boy=norm(Vt);

