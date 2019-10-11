function [b] = Vectores_b(ang1,ang2,R1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
b=zeros(3,6);
g=-ang2/2;
for n=1:6
   if mod(n,2) == 0
        g=g+ang1;
   else
       g=g+ang2;
   end
   b(:,n)=[R1*cosd(g),R1*sind(g),0]';
end

end

