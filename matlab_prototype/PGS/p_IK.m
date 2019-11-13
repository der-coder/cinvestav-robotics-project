function [lam,th_i] = p_IK(d,R_ang,anga,angb,a,b)

R = Rotz(R_ang(3))*Roty(R_ang(2))*Rotx(R_ang(1));

l = zeros(3,6);
q = zeros(1,6);
lam = zeros(3,6);
th_1 = zeros(1,6);
th_2 = zeros(1,6);
th_3 = zeros(1,6);
th_4 = zeros(1,6);
th_5 = zeros(1,6);
th_6 = zeros(1,6);

R1_3 = zeros(3,3,6);
Rz_b = zeros(3,3,6);
Rz_a = zeros(3,3,6);
R4_6 = zeros(3,3,6);

for i = 1:6
    l(:,i) = d + R*a(:,i) - b(:,i);
    q(i)=norm(l(:,i));
    th_3(i) = q(i);
    lam(:,i)=(l(:,i))/(q(i));
    
    al = (cos(angb(i) + (pi/2))*(lam(1,i))) + (sin(angb(i) + (pi/2))*lam(2,i));
    bl = lam(3,i);
    th_1(i) = atan(al/bl);
    cl = (sin(angb(i) + (pi/2))*lam(1,i)) - (cos(angb(i) + (pi/2))*lam(2,i));
    th_2(i) = asin(cl);
    
    R1_3(:,:,i) = Roty(th_1(i))*Rotx(th_2(i));
    Rz_b(:,:,i) = Rotz(angb(i) + (pi/2));
    Rz_a(:,:,i) = Rotz(anga(i) + (pi/2));
    R4_6(:,:,i) = R1_3(:,:,i)'*Rz_b(:,:,i)'*R*Rz_a(:,:,i);

    th_4(i) = atan2(-(R4_6(1,2,i)),R4_6(2,2,i));
    th_5(i) = asin(R4_6(3,2,i));
    th_6(i) = atan2(-(R4_6(3,1,i)),(R4_6(3,3,i)));
end

th_i = [th_1;th_2;th_3;th_4;th_5;th_6];

end