clear all

i.name = 'i'
i.uels = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'}

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
PERIODOESTACIONADO.uels = i.uels
 

%Se mandan los valores
wgdx('MtoG',i,HORASALIDA, CARGAINICIAL, HORALLEGADA, PERIODOESTACIONADO)
gdxInfo MtoG.gdx

system 'gams aaa lo=3 gdx=GtoM'

COCHEACEPTADO.name = 'COCHEACEPTADO'

COCHEACEPTADO = rgdx('GtoM',COCHEACEPTADO)

COCHEACEPTADO.val;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
hora_entrada = 9;
%Límites de horas de salida superior e inferior
%El vector resultado se hará entre estos dos valores
h_salida_min = 20;
h_salida_max = 22;
almacen_de_valores = zeros(1,24)


for h_sal = h_salida_min:h_salida_max

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



clear COCHEACEPTADO i CARGAINICIAL HORASALIDA HORALLEGADA PERIODOESTACIONADO;

i.name = 'i';
i.uels = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'};

%Se cargan los parámetros iniciales
CARGAINICIAL.name='CARGAINICIAL';
CARGAINICIAL.val=carga;
CARGAINICIAL.type='parameter';

HORASALIDA.name='HORASALIDA';
HORASALIDA.val=h_sal;
HORASALIDA.type='parameter';

HORALLEGADA.name='HORALLEGADA';
HORALLEGADA.val=hora_entrada;
HORALLEGADA.type='parameter';

PERIODOESTACIONADO.name='PERIODOESTACIONADO';
PERIODOESTACIONADO.val=vectorPE;
PERIODOESTACIONADO.type='parameter';
PERIODOESTACIONADO.form='full';
PERIODOESTACIONADO.uels = i.uels;
 

%Se mandan los valores
wgdx('MtoG',i,HORASALIDA, CARGAINICIAL, HORALLEGADA, PERIODOESTACIONADO);
gdxInfo MtoG.gdx;


system 'gams aaa lo=3 gdx=GtoM';

COCHEACEPTADO.name = 'COCHEACEPTADO';

COCHEACEPTADO = rgdx('GtoM',COCHEACEPTADO);
  
        
        
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aquí se termina la llamada a GAMS        
%Si es aceptado, se prueba con una carga más baja. Si no, con una más alta.
     if COCHEACEPTADO.val
         carga = carga - carga_aux;
     else
         carga = carga + carga_aux;
     end
    end
    
    
%Se guarda el valor de la carga   
almacen_de_valores(h_sal) = carga; 
    
end
