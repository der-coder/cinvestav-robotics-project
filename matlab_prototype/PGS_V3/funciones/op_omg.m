function omega = op_omg(v)
omega = zeros(6,6);

omega(1:3,1:3) = CPO(v(4:6));
omega(1:3,4:6) = CPO(v(1:3));
omega(4:6,4:6) = CPO(v(4:6));

end