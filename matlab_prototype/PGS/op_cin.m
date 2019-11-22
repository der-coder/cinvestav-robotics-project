function opc = op_cin(R_ang)
opc = eye(6);
MRot = M_Rot(R_ang(3),'z','r')*M_Rot(R_ang(2),'y','r')*M_Rot(R_ang(1),'x','r');
J = [1,0,-sin(R_ang(2))
  0,cos(R_ang(1)),sin(R_ang(1))*cos(R_ang(2))
  0,-sin(R_ang(1)),cos(R_ang(1))*cos(R_ang(2))];

opc(1:3,1:3) = MRot;
opc(4:6,4:6) = J;

end