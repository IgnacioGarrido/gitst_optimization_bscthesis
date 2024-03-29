$TITLE Programa-v4

$ONTEXT
Esta es la versi�n 4 del programa final.
El objetivo ser� adaptar la versi�n 3 a una nueva versi�n con 5 coches.
Para ello se a�adir� tablas con una estructura (y nombres) siimilar a
los vectores de ejercicios anteriores.

Utilizar� un vector del precio de la energ�a por horas:
PRECIOENERGIA = Precio de la energ�a:
PRECIOENERGIA(i) PRECIOENERGIA / 1
                 2
                 3 ..../

Utilizar� un vector del consumo de la escuela por horas
CONSUMOESCUELA = Consumo de la escuela
CONSUMOESCUELA(i) CESCUELA / 1
                 2
                 3 ..../

Utilizar� un vector de la producci�n fotovolt�ica por horas
PRODUCCIONFOTOVOLTAICA = Producci�n fotovolt�ica de la escuela
PRODUCCIONFOTOVOLTAICA(i) PFOTOVOLTAICA / 1
                      2
                      3 ..../

Utilizar� un vector de 0 y 1 que tendr� un 1 en las posiciones en las que
el coche est� en la escuela y un 0 en las que no.
PERIODOESTACIONADO(i) PERIODO DE ESTANCIA  / 1
                      2
                      3 ..../

Utilizar� un vector de los costes por hora (Lo que se gasta por hora en energ�a)
CONSUMOPORHORA = Coste por hora -> Lo que gasta la escuela
CONSUMOPORHORA(i) CHORA / 1
              2
              3 ..../

La funci�n objetivo a minimizar ser�:

        Min F(x) = SUM(I,CONSUMOPORHORA(I))) -> Minimizar el sumatorio de los costes/hora

$OFFTEXT
 SET
         I HORAS /1*24/
         J COCHES /1*5/;

*Par�metros inventados...Falta sacar los valores reales
PARAMETERS
*Precio por KWh
  PRECIOENERGIA(I) precio energ�a  /1       3.
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

*Producci�n fotovoltaica de la escuela / hora
  PRODUCCIONFOTOVOLTAICA(I) p. fotovoltaica /1       0.
                         2       0.
                         3       0.
                         4       0.
                         5       0.
                         6       0.
                         7       0.
                         8       1.
                         9       2.
                         10      3.
                         11      3.5
                         12      4.
                         13      4.3
                         14      4.5
                         15      4.5
                         16      4.4
                         17      4.
                         18      3.5
                         19      2.
                         20      1.
                         21      0.
                         22      0.
                         23      0.
                         24      0. /

*Consumo de la escuela / hora
  CONSUMOESCUELA(I) consumo escuela /1       50.
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
                         24      30. /

 CARGAINICIAL(J)            Carga inicial en kWh            / 1 18, 2 20 , 3 22 , 4 19 , 5 17/
 HORASALIDA(J)              Hora de salida                  / 1 16 , 2 20 , 3 14 , 4 18 , 5 21/
 HORALLEGADA(J)             Hora de llegada                 / 1 11 , 2 9 , 3 8 , 4 7 , 5 9/


;

TABLE
*Tabla de 1 y 0 con un 1 en las horas en las que el coche est� aparcado.
*Filas -> Coches.
*Columnas -> Horas.
PERIODOESTACIONADO(J, I) PERIODO DE ESTANCIA
         1        2        3        4        5        6        7        8        9        10       11       12       13       14       15       16       17       18       19       20       21       22       23       24
1        0        0        0        0        0        0        0        0        0        0        1        1        1        1        1        1        0        0        0        0        0        0        0        0
2        0        0        0        0        0        0        0        0        1        1        1        1        1        1        1        1        1        1        1        1        0        0        0        0
3        0        0        0        0        0        0        0        1        1        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0
4        0        0        0        0        0        0        1        1        1        1        1        1        1        1        1        1        1        1        0        0        0        0        0        0
5        0        0        0        0        0        0        0        0        1        1        1        1        1        1        1        1        1        1        1        1        1        0        0        0


;

SCALAR
         CAPACIDAD               Capacidad de la bater�a en kWh  /24/
         CARGAALASALIDA          Carga minima cuando se va       /18/
         COUNTERLOOP             Contador para el loop           /0/
         RATIOCARGADESCARGA      KWh m�ximos en 1 hora           /3.68/;

VARIABLES
F;

POSITIVE VARIABLES
CARGA(J,I), CONSUMOPORHORA(I);

*fx para fijar el valor de una variable.
*Este loop inicializa el valor de la carga con CARGAINICIAL.
*Fija ese valor en todas las horas hasta que llega.
LOOP(J,LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP <= HORALLEGADA(J), CARGA.fx(J,I) =  CARGAINICIAL(J););
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
    ););

*lo para poner el l�mite inferior de una variable.
*Este loop pone un l�mite inferior a la carga de salida. Aseguramos que el
*coche se va con una carga m�nima.
LOOP(J,
LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP >= HORASALIDA(J), CARGA.lo(J,I) =  CARGAALASALIDA;);
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
    ););

EQUATIONS
     OBJ                 La funci�n objetivo
     COSTESINCOCHES(I)   Funci�n para comparar el coste si no se usase este algoritmo
     ITERACION(I)        Funci�n de las horas 1 a la 24
     CAPACIDADMAX(J,I)   Funci�n que condiciona la carga de la bater�a a la capacidad
     CARGAMAX(J,I)       Funci�n que condiciona la carga  por hora m�xima a 3.68 kWh
     DESCARGAMAX(J,I)    Funci�n que condiciona la descarga  por hora m�xima a 3.68 kWh
;

OBJ ..                   F  =E=  sum(I, CONSUMOPORHORA(I));

COSTESINCOCHES(I) ..     PRECIOENERGIA(I)*[CONSUMOESCUELA(I)- PRODUCCIONFOTOVOLTAICA(I)] =E= CONSUMOPORHORA(I);

ITERACION(I) ..          PRECIOENERGIA(I)*[CONSUMOESCUELA(I)- PRODUCCIONFOTOVOLTAICA(I) + sum(J, [[CARGA(J,I) - CARGA(J,I-1)]*PERIODOESTACIONADO(J,I)])] =E=  CONSUMOPORHORA(I) ;

CAPACIDADMAX(J,I) ..       CARGA(J,I) =L= CAPACIDAD;

CARGAMAX(J,I) ..         CARGA(J,I+1) - CARGA(J,I) =L= RATIOCARGADESCARGA;

DESCARGAMAX(J,I) ..      CARGA(J,I) - CARGA(J,I-1) =G= -RATIOCARGADESCARGA;


MODEL progConCoches /OBJ,ITERACION, CAPACIDADMAX, CARGAMAX, DESCARGAMAX/ ;
MODEL progSinCoches /OBJ,COSTESINCOCHES/ ;

SOLVE progSinCoches using lp minimizing F;
SOLVE progConCoches using lp minimizing F;

