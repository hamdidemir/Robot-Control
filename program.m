
while(Vt_boy>0.01)
R1=eye(3)+skew(h(:,1))*sin(delta_teta(1))+skew(h(:,1))^2*(1-cos(delta_teta(1)));
R2=eye(3)+skew(h(:,2))*sin(delta_teta(2))+skew(h(:,2))^2*(1-cos(delta_teta(2)));
R3=eye(3)+skew(h(:,3))*sin(delta_teta(3))+skew(h(:,3))^2*(1-cos(delta_teta(3)));
R4=eye(3)+skew(h(:,4))*sin(delta_teta(4))+skew(h(:,4))^2*(1-cos(delta_teta(4)));
R5=eye(3)+skew(h(:,5))*sin(delta_teta(5))+skew(h(:,5))^2*(1-cos(delta_teta(5)));

l(:,1)=R1*l(:,1);
l(:,2)=R1*R2*l(:,2);
l(:,3)=R1*R2*R3*l(:,3);
l(:,4)=R1*R2*R3*R4*l(:,4);
l(:,5)=R1*R2*R3*R4*R5*l(:,5);

h(:,1)=R1*h(:,1);
h(:,2)=R1*R2*h(:,2);
h(:,3)=R1*R2*R3*h(:,3);
h(:,4)=R1*R2*R3*R4*h(:,4);
h(:,5)=R1*R2*R3*R4*R5*h(:,5);

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

J = Phi_t * Phi * H;

Vt=Xd-(l(:,1)+l(:,2)+l(:,3)+l(:,4)+l(:,5));

teta_dot=pinv(J(4:6,:))*Vt;

delta_teta=teta_dot*0.01;

Vt_boy=norm(Vt);


% Plot the point in 3D space
plot3(Vt(1), Vt(2), Vt(3), 'x', 'MarkerSize', 4, 'MarkerFaceColor', 'r')
hold on;
end



