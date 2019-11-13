classdef Plat_GS < handle
    % Propiedades de la plataforma Gough-Stewart
    properties
        % Propiedades básicas de la plataforma
        rb                              % Radio de la junta en la base
        ra                              % Radio de la junta en la plataforma
        dpmin                           % Extensión minima del piston/actuador
        % Propiedades generales de la plataforma, valor estático con
        % posibilidad de cambio
        hb = .1;                        % Separación lineal entre juntas en la base
        ha = .1;                        % Separacion lineal entre juntas en la plataforma
        m = [0,0,0,0,0];                % Masa de los objetos (Cardan, CamisaActuador, EmboloActuador, Esferica, Plataforma)
    end
    properties (SetAccess = private)
      % Tensores de inercia de los objetos en los centros de masa
      I_cC(:,:) = eye(3);                   %Tensor inercia junta Cardan
      I_cCA(:,:) = eye(3);                  %Tensor inercia camisa actuador
      I_cEA(:,:) = eye(3);                  %Tensor inercia embolo actuador
      I_cJE(:,:) = eye(3);                  %Tensor inercia junta esferica
      I_cP(:,:) = eye(3);                   %Tensor inercia plataforma
      % Radio a centro de masa
      r_cC = zeros(3,1);                    %Radio del marco local al centro de masa de la junta cardan
      r_cCA = zeros(3,1);                   %Radio del marco local al centro de masa de la camisa del actuador
      r_cEA = zeros(3,1);                   %Radio del marco local al centro de masa del embolo del actuador
      r_cJE = zeros(3,1);                   %Radio del marco local al centro de masa de la junta esferica
      r_cP = zeros(3,1);                    %Radio del marco local al centro de masa de la plataforma
    end
    properties (Dependent)
      % Angulos separación entre las juntas
      th_b
      th_a
      % Angulos de posición de las juntas
      ang_a
      ang_b
      % Puntos cartesianos del centro de la junta
      p_a
      p_b  
    end
    
    % Metodos para la plataforma para modificar los valores de la
    % plataforma
    methods
        %% Constructor
        % Constructor de los valores mínimos para el desarrollo d ela
        % cinemática de la plataforma Gough-Stewart de 6 GdL
        function obj = Plat_GS(ra, rb, dpmin)
            switch nargin
                case 3
                    obj.ra = ra;
                    obj.rb = rb;
                    obj.dpmin = dpmin;
                otherwise
                    disp(" ")
                    disp("Datos insuficientes")
            end
        end
        
        %% Variables dependientes
        % Angulo de separacion de las juntas respecto a la linea media
        function th_b = get.th_b(obj)
            th_b = asin(obj.hb/(2*obj.rb));
        end
        function th_a = get.th_a(obj)
            th_a = asin(obj.ha/(2*obj.ra));
        end
        
        %Obtener los angulos de los puntos donde se colocan las juntas de
        %Cardan y esfericas
        function ang_b = get.ang_b(obj)
            ang_b(6,1) = 0;
            for i = 1:6
                ang_b(i,1) = ((2*pi)/3)*floor(i/2) - (-1)^i*obj.th_b;
            end
        end
        
        function ang_a = get.ang_a(obj)
            ang_a(6,1) = 0;
            for i = 1:6
                ang_a(i,1) = ((2*pi)/3)*floor((i+1)/2) - (pi/3) + (-1)^i*obj.th_a;
            end
        end
        
        function p_b = get.p_b(obj)
            p_b(3,6) = 0;
            for i = 1:6
                p_b(1,i) = obj.rb*cos(obj.ang_b(i));
                p_b(2,i) = obj.rb*sin(obj.ang_b(i));
                p_b(3,i) = 0;
            end
        end
        
        function p_a = get.p_a(obj)
            p_a(3,6) = 0;
            for i = 1:6
                p_a(1,i) = obj.ra*cos(obj.ang_a(i));
                p_a(2,i) = obj.ra*sin(obj.ang_a(i));
                p_a(3,i) = 0;
            end
        end
        
        %% Métodos generales de la plataforma
        
    end
end