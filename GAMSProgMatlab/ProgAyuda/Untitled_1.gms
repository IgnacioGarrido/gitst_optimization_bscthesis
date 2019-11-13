SET
         I HORAS /1*24/
;

PARAMETERS
PERIODOESTACIONADO(I) PERIODO DE ESTANCIA  /1       0.
                         2       0.
                         3       0.
                         4       0.
                         5       0.
                         6       0.
                         7       0.
                         8       0.
                         9       1.
                         10      1.
                         11      1.
                         12      1.
                         13      1.
                         14      1.
                         15      1.
                         16      1.
                         17      1.
                         18      1.
                         19      1.
                         20      1.
                         21      1.
                         22      0.
                         23      0.
                         24      0. /

 PRECIOENERGIA(I) precio energía  /1        0.14315
2        0.13726
3        0.13355
4        0.13248
5        0.13042
6        0.13326
7        0.13762
8        0.15502
9        0.16342
10        0.15868
11        0.1583
12        0.15595
13        0.15459
14        0.15569
15        0.1531
16        0.15348
17        0.15346
18        0.15686
19        0.16397
20        0.16705
21        0.16928
22        0.1712
23        0.16896
24        0.16353
/

*INVIERNO
  PRODUCCIONFOTOVOLTAICA(I) p. fotovoltaica /1        0
2        0
3        0
4        0
5        0
6        0
7        0
8        0
9        0.031
10        0.926
11        5.199
12        8.181
13        10.129
14        11.208
15        9.998
16        8.1
17        4.232
18        0.185
19        0
20        0
21        0
22        0
23        0
24        0
/

*INVIERNO
  CONSUMOESCUELA(I) consumo escuela /1        16.82254167
2        17.07589167
3        16.80896667
4        16.922075
5        17.335225
6        17.254075
7        18.345375
8        38.20146667
9        61.18709167
10        72.767375
11        78.61703333
12        77.78018333
13        79.43550833
14        74.7873
15        73.60311667
16        74.27143333
17        75.557625
18        77.61494167
19        75.52485833
20        61.31484167
21        28.70408333
22        25.22088333
23        17.48315
24        16.01489167
 /


FOTOVOLTAICASUPERIOR(I)    Vector con un 1 en las posiciones en las que hay más producción que consumo
;

SCALAR
 CARGAINICIAL            Carga inicial en kWh            /18/
 HORASALIDA              Hora de salida                  /21/
 HORALLEGADA             Hora de llegada                 /9/ ;

SCALAR
         CAPACIDAD               Capacidad de la batería en kWh  /24/
         CARGAALASALIDA          Carga minima cuando se va       /18/
         COUNTERLOOP             Contador para el loop           /0/
         NUMCOCHES               Número de coches                /1/
         RATIOCARGADESCARGA      KWh máximos en 1 hora           /3.68/
         NODESCARGADEBAJODE      No se descarga por debajo de... /4.8/
         MAXPOTENCIA             Máxima potencia contratada      /450/
;


*LOOP para completar el vector FOTOVOLTAICASUPERIOR. Tiene un 1 si la producción
*fotovoltáica en la hora I es menor que el consumo, y un 0 en caso contrario
LOOP(I, if ((CONSUMOESCUELA(I) + (NUMCOCHES*RATIOCARGADESCARGA)) < PRODUCCIONFOTOVOLTAICA(I) , FOTOVOLTAICASUPERIOR(I) = 0;
        else FOTOVOLTAICASUPERIOR(I) = 1;);
    );


VARIABLES
F;

POSITIVE VARIABLES
CARGA(I), CONSUMOPORHORA(I);

BINARY VARIABLES
COCHEACEPTADO;

*fx para fijar el valor de una variable.
*Este loop inicializa el valor de la carga con CARGAINICIAL.
*Fija ese valor en todas las horas hasta que llega.
LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP <= HORALLEGADA, CARGA.fx(I) =  CARGAINICIAL;);
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
    );

*lo para poner el límite inferior de una variable.
*Este loop pone un límite inferior a la carga de salida. Aseguramos que el
*coche se va con una carga mínima.
*PARA SIMULACIONES 2.1 Y 3.1 CAMBIAR CARGAALASALIDA POR CARGAINICIAL(J).

LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP >= HORASALIDA, CARGA.lo(I) =  CARGAALASALIDA;);
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
    );

EQUATIONS
     OBJ                         La función objetivo
     COSTESINCOCHES(I)           Función para comparar el coste si no se usase este algoritmo
     ITERACION(I)                Función de las horas 1 a la 24
     ITERACIONCOCHEACEPTADO(I)   Función de las horas 1 a la 24 que incluye la variable binaria COCHEACEPTADO(I)
     CAPACIDADMAX(I)           Función que condiciona la carga de la batería a la capacidad
     CARGAMAX(I)               Función que condiciona la carga  por hora máxima a 3.68 kWh
     DESCARGAMAX(I)            Función que condiciona la descarga  por hora máxima a 3.68 kWh
     NODESCARGADEBAJO(I)       Función que no permite descarga por debajo de la carga con la que llega el coche
;

OBJ ..                           F  =E=  sum(I, CONSUMOPORHORA(I));

COSTESINCOCHES(I) ..             FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I)]) =E= CONSUMOPORHORA(I);


ITERACIONCOCHEACEPTADO(I) ..     FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I) + COCHEACEPTADO*[[CARGA(I) - CARGA(I-1)]*PERIODOESTACIONADO(I)]]) =E=  CONSUMOPORHORA(I) ;

CAPACIDADMAX(I) ..               CARGA(I) =L= CAPACIDAD;

CARGAMAX(I) ..                 CARGA(I+1) - CARGA(I) =L= RATIOCARGADESCARGA;

DESCARGAMAX(I) ..              CARGA(I) - CARGA(I-1) =G= -RATIOCARGADESCARGA;

NODESCARGADEBAJO(I) ..         CARGA(I) =G= CARGAINICIAL;


$ONTEXT
Cinco simulaciones:
         1.- Sin mejoras
         2.- El coche se va con 18kwh y puede bajar a 0 en algún momento
                 2.1.- El coche se va con la carga con la que llega -> Cambiar en el loop
         3.- Como 2, pero no baja por debajo de su carga inicial
                 3.1.- El coche se va con la carga con la que llega -> Cambiar en el loop
         4.- Como 2, pero se pueden excluir algunos coches COCHEACEPTADO
         5.- Como 3, pero se pueden excluir algunos coches COCHEACEPTADO
$OFFTEXT

MODEL progConCoches4 /OBJ, ITERACIONCOCHEACEPTADO, CAPACIDADMAX, CARGAMAX, DESCARGAMAX/ ;
MODEL progConCoches5 /OBJ, ITERACIONCOCHEACEPTADO, CAPACIDADMAX, CARGAMAX, DESCARGAMAX, NODESCARGADEBAJO/ ;

*MINLP -> Mixed integer non linear programing
SOLVE progConCoches4 using MINLP minimizing F;
*SOLVE progConCoches5 using MINLP minimizing F;

