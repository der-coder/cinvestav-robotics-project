function [inertiaPlatform, mass, distanceCenterMass] = createPlatform()
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
    
    inertiaPlatform = convertGramMM2toKgM2 * [Lxx , Lxy , Lxz; Lyx, Lyy, Lyz; Lzx, Lzy , Lzz ];
    
    mass = 2.25414;
    
    distanceCenterMass = [0.01; 13.04; 0]*(1/1000);
end