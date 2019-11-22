function [inertiaPiston, mass, distanceCenterMass] = createPiston()
% Momentos de inercia: ( gramos *  milímetros cuadrados)
% Medido desde el sistema de coordenadas de salida.
% Mediciones de Solidworks

	Lxx = 703671034.55;	
    Lxy = 370.37;
    Lxz = 0.48;
	Lyx = 370.37;
    Lyy = 2079848.98;
    Lyz = -0.25;
	Lzx = 0.48;	
    Lzy = -1.00;
    Lzz = 703687095.27;
    
    
    convertGramMM2toKgM2 = (1/1000)*(1/1000)*(1/1000);
    
    inertiaPiston = convertGramMM2toKgM2 * [Lxx , -Lxy , -Lxz; -Lyx, Lyy, -Lyz; -Lzx, -Lzy , Lzz ];
    
    mass = 5.48131;
    
    distanceCenterMass = [0; 460.39; 0]*(1/1000);
end


% Propiedades de masa de actuator
%      Configuración:  Predeterminado
%      Sistema de coordenadas:  -- predeterminado --
% 
% Masa = 5481.31 gramos
% 
% Volumen = 918344.47 milímetros cúbicos
% 
% Área de superficie = 362362.67  milímetros cuadrados
% 
% Centro de masa: ( milímetros )
% 	X = 0.00
% 	Y = 460.39
% 	Z = 0.00
% 
% Ejes principales de inercia y momentos principales de inercia: ( gramos *  milímetros cuadrados )
% Medido desde el centro de masa.
% 	 Ix = ( 0.00,  1.00,  0.00)   	Px = 2079848.97
% 	 Iy = (-1.00,  0.00,  0.00)   	Py = 703671034.54
% 	 Iz = ( 0.00,  0.00,  1.00)   	Pz = 703687095.27
% 
% Momentos de inercia: ( gramos *  milímetros cuadrados )
% Obtenidos en el centro de masa y alineados con el sistema de coordenadas de resultados.
% 	Lxx = 703671034.55	Lxy = 370.37	Lxz = 0.48
% 	Lyx = 370.37	Lyy = 2079848.98	Lyz = -1.00
% 	Lzx = 0.48	Lzy = -1.00	Lzz = 703687095.27
% 
% Momentos de inercia: ( gramos *  milímetros cuadrados)
% Medido desde el sistema de coordenadas de salida.
% 	Ixx = 1865493625.74	Ixy = -244.20	Ixz = 0.48
% 	Iyx = -244.20	Iyy = 2079848.98	Iyz = -0.25
% 	Izx = 0.48	Izy = -0.25	Izz = 1865509686.46