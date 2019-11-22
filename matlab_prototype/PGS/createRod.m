function [inertiaRod, mass, distanceCenterMass] = createRod()
% Momentos de inercia: ( gramos *  milímetros cuadrados)
% Medido desde el sistema de coordenadas de salida.
% Mediciones de Solidworks

	Lxx = 205340155.81,	
    Lxy = -7485.30;	
    Lxz = 125.20;
	Lyx = -7485.30;	
    Lyy = 297124.75;	
    Lyz = 313.80;
	Lzx = 125.20;	
    Lzy = 313.80;	
    Lzz = 205340101.17;
    
    
    convertGramMM2toKgM2 = (1/1000)*(1/1000)*(1/1000);
    
    inertiaRod = convertGramMM2toKgM2 * [Lxx , Lxy , Lxz; Lyx, Lyy, Lyz; Lzx, Lzy , Lzz ];
    
    mass = 2.25414;
    
    distanceCenterMass = [0.01; 13.04; 0]*(1/1000);
end


% Propiedades de masa de piston
%      Configuración:  Predeterminado
%      Sistema de coordenadas:  -- predeterminado --
% 
% Masa = 2254.14 gramos
% 
% Volumen = 315162.96 milímetros cúbicos
% 
% Área de superficie = 162768.62  milímetros cuadrados
% 
% Centro de masa: ( milímetros )
% 	X = 0.01
% 	Y = 13.04
% 	Z = 0.00
% 
% Ejes principales de inercia y momentos principales de inercia: ( gramos *  milímetros cuadrados )
% Medido desde el centro de masa.
% 	 Ix = ( 0.00,  1.00,  0.00)   	Px = 297124.48
% 	 Iy = ( 0.63,  0.00,  0.78)   	Py = 205340000.46
% 	 Iz = ( 0.78,  0.00, -0.63)   	Pz = 205340256.79
% 
% Momentos de inercia: ( gramos *  milímetros cuadrados )
% Obtenidos en el centro de masa y alineados con el sistema de coordenadas de resultados.
% 	Lxx = 205340155.81	Lxy = -7485.30	Lxz = 125.20
% 	Lyx = -7485.30	Lyy = 297124.75	Lyz = 313.80
% 	Lzx = 125.20	Lzy = 313.80	Lzz = 205340101.17
% 
% Momentos de inercia: ( gramos *  milímetros cuadrados)
% Medido desde el sistema de coordenadas de salida.
% 	Ixx = 205723468.00	Ixy = -7290.09	Ixz = 125.19
% 	Iyx = -7290.09	Iyy = 297124.85	Iyz = 305.39
% 	Izx = 125.19	Izy = 305.39	Izz = 205723413.46