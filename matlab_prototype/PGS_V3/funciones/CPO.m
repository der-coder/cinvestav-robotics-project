function x = CPO(d)
n = length(d);
if n == 3
    x = [0    ,-d(3),d(2);
         d(3) ,0    ,-d(1);
         -d(2),d(1) , 0];
end
end