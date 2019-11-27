function [] = Vectores(b,a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:6
    quiver3(b(1,i),b(2,i),b(3,i),a(1,i),a(2,i),a(3,i),0);
    hold on;
end
end

