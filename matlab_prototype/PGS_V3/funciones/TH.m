function ht = TH(MRot,dV)
HT = zeros(4,4);
n = size(MRot);
m = size(dV);

if m(1) ~= 3
  dV = dV';
  m = size(dV);
end

if n(1) == 3 && n(2) == 3 && m(1) == 3
  HT = eye(4,4);
  HT(1:3,1:3) = MRot;
  HT(1:3,4) = dV;
end

ht = HT;
end