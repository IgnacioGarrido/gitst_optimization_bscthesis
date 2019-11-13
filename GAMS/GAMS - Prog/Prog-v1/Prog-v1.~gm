$TITLE Programa-v1

$ONTEXT
Esta es la versión 1 del programa final.
El objetivo es calcular el valor óptimo de la variable carga(i) que representa:
   carga(i) -> Valor de carga de la batería/hora.
   i -> Valor entre 1 y 24 que representa la hora del día.

Esta versión será simplificada, y solo habrá un coche con capacidad C=24 [kWh].

Utilizaré un vector del precio de la energía por horas:
PE = Precio de la energía:
PE(i) PENERGIA / 1
                 2
                 3 ..../

Utilizaré un vector del consumo de la escuela por horas
CE = Consumo de la escuela
CE(i) CESCUELA / 1
                 2
                 3 ..../

Utilizaré un vector de la producción fotovoltáica por horas
PF = Producción fotovoltáica de la escuela
PF(i) PFOTOVOLTAICA / 1
                      2
                      3 ..../
IMPORTANTE: En este primer ejercicio supongo que no hay producción

Utilizaré un vector de los costes por hora (Lo que se gasta por hora en energía)
CH = Coste por hora -> Lo que gasta la escuela
CH(i) CHORA / 1
              2
              3 ..../

La función objetivo a minimizar será:

        Min F(x) = SUM(I,CH(I)) -> Minimizar el sumatorio de los costes/hora

$OFFTEXT

SET
         I HORAS /1*24/;

*Parámetros inventados...Falta sacar los valores reales
PARAMETERS
*Precio por KWh
         PE(I) PENERGIA /1       3.
                         2       3.
                         3       4.
                         4       3.
                         5       3.
                         6       4.
                         7       4.
                         8       6.
                         9       8.
                         10      10.
                         11      10.
                         12      9.
                         13      7.
                         14      6.
                         15      6.
                         16      8.
                         17      10.
                         18      11.
                         19      12.
                         20      10.
                         21      8.
                         22      3.
                         23      3.
                         24      3. /

*Consumo de la escuela / hora
         CE(I) CESCUELA /1       50.
                         2       60.
                         3       70.
                         4       60.
                         5       70.
                         6       70.
                         7       90.
                         8       110.
                         9       130.
                         10      100.
                         11      100.
                         12      90.
                         13      80.
                         14      60.
                         15      60.
                         16      80.
                         17      90.
                         18      100.
                         19      150.
                         20      130.
                         21      80.
                         22      30.
                         23      30.
                         24      30. /;

SCALAR
         CAPACIDAD               Capacidad de la batería en kWh  /24./
         CARGAINICIAL            Carga inicial en kWh            /3./
         RATIOCARGADESCARGA      KWh máximos en 1 hora           /3.68/;

VARIABLES
CARGA(I), CH(I), F;


POSITIVE VARIABLES
CARGA, CH;


EQUATIONS
     OBJ                 La función objetivo
     ITERACION(I)        Función de las horas 1 a la 24
     ITERACIONPRIMERA    Funcion de la hora 1
     CARGAINI            Función que inicializa la carga de la bateria
     CAPACIDADMAX(I)     Funcion que condiciona la carga de la batería a la capacidad
     CARGAMAX(I)         Función que condiciona la carga  por hora máxima a 3.68 kWh
     DESCARGAMAX(I)      Función que condiciona la descarga  por hora máxima a 3.68 kWh
;

OBJ ..                    F  =E=  sum(I, CH(I)) ;

ITERACION(I) ..          PE(I+1)*[CE(I+1)+ [CARGA(I+1) - CARGA(I)]] =E=  CH(I+1) ;

ITERACIONPRIMERA ..      PE('1')*CE('1') =E= CH('1') ;

CARGAINI ..              CARGA('1') =E= CARGAINICIAL;

CAPACIDADMAX(I) ..       CARGA(I+1) =L= CAPACIDAD;

CARGAMAX(I) ..           CARGA(I+1) - CARGA(I) =L= RATIOCARGADESCARGA;

DESCARGAMAX(I) ..        CARGA(I) - CARGA(I-1) =G= -RATIOCARGADESCARGA;


MODEL prog1 /all/ ;

SOLVE prog1 using lp minimizing F ;

