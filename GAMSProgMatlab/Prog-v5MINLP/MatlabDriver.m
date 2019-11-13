clear all

I.name = 'I'
I.uels = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'}

%Se cargan los parámetros iniciales
CARGAINICIAL.name='CARGAINICIAL'
CARGAINICIAL.val=18
CARGAINICIAL.type='parameter'

HORASALIDA.name='HORASALIDA'
HORASALIDA.val=21
HORASALIDA.type='parameter'

HORALLEGADA.name='HORALLEGADA'
HORALLEGADA.val=9
HORALLEGADA.type='parameter'

PERIODOESTACIONADO.name='PERIODOESTACIONADO'
PERIODOESTACIONADO.val=[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 ]
PERIODOESTACIONADO.type='parameter'
PERIODOESTACIONADO.form='full'
PERIODOESTACIONADO.uels = I.uels


%Se mandan los valores
wgdx('MtoG',I,HORASALIDA, CARGAINICIAL, HORALLEGADA, PERIODOESTACIONADO)
gdxInfo MtoG.gdx

system 'gams aaa lo=3 gdx=GtoM'

% F -> Sistema con coche
% X -> Sistema sin coche

F.name = 'F'

F = rgdx('GtoM',F)

X.name = 'X'

X = rgdx('GtoM',X)

%F debe se < que X
F.val
X.val

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
hora_entrada = [9, 10, 12, 16];
%Límites de horas de salida superior e inferior
%El vector resultado se hará entre estos dos valores
h_salida_min = [11, 12, 14, 18];
h_salida_max = [22, 22, 22, 22];
almacen_de_valores = zeros(4,24)

for h_ent_iteracion = 1:length(hora_entrada)

for h_sal = h_salida_min(h_ent_iteracion):h_salida_max(h_ent_iteracion)

%Se actualizan la hora de salida y el vector PE
hora_salida = h_sal;
vectorPE = ones(1,24);
    for n=1:24
     if n < hora_entrada
        vectorPE(n) = 0;
     end
     if n > hora_salida
        vectorPE(n) = 0;
     end
    end
%Valores de las cargas
carga_aux = 9;
carga = 9;
%Precisión de 0.0044 para 11 iteraciones
    for iteracion = 1:12
        carga_aux = carga_aux/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aquí se llama a GAMS        



clear F X I CARGAINICIAL HORASALIDA HORALLEGADA PERIODOESTACIONADO;

I.name = 'I';
I.uels = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'};

%Se cargan los parámetros iniciales
CARGAINICIAL.name='CARGAINICIAL';
CARGAINICIAL.val=carga;
CARGAINICIAL.type='parameter';

HORASALIDA.name='HORASALIDA';
HORASALIDA.val=h_sal;
HORASALIDA.type='parameter';

HORALLEGADA.name='HORALLEGADA';
HORALLEGADA.val=hora_entrada(h_ent_iteracion);
HORALLEGADA.type='parameter';

PERIODOESTACIONADO.name='PERIODOESTACIONADO';
PERIODOESTACIONADO.val=vectorPE;
PERIODOESTACIONADO.type='parameter';
PERIODOESTACIONADO.form='full';
PERIODOESTACIONADO.uels = I.uels;
 

%Se mandan los valores
wgdx('MtoG',I,HORASALIDA, CARGAINICIAL, HORALLEGADA, PERIODOESTACIONADO);
gdxInfo MtoG.gdx;


system 'gams aaa lo=3 gdx=GtoM';

F.name = 'F';

F = rgdx('GtoM',F);

X.name = 'X';

X = rgdx('GtoM',X);
        
% F -> Sistema con coche
% X -> Sistema sin coche        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aquí se termina la llamada a GAMS        
%Si es aceptado, se prueba con una carga más baja. Si no, con una más alta.
     if F.val < X.val
         carga = carga - carga_aux;
     else
         carga = carga + carga_aux;
     end
    end
    
    
%Se guarda el valor de la carga   
almacen_de_valores(h_ent_iteracion, h_sal) = carga; 
    
end
end

%Se guarda en un csv
csvwrite('E5_otoño.csv',almacen_de_valores);



