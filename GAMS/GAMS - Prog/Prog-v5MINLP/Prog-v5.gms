$TITLE Programa-v5MINLP

$ONTEXT
Esta es la versión 5MINLP del programa final.
Se intentará resolver el problema de MINLP

También se añadirá un vector COCHEACEPTADO con un 1 en las posiciones de los
coches donde realmente compensa aceptarlo y un 0 cuando se pierde dinero con
ese coche.
También se incluirá un vector FOTOVOLTAICASUPERIOR que controlará los casos de
exceso de producción fotovoltáica.


Utilizaré un vector del precio de la energía por horas:
PRECIOENERGIA = Precio de la energía:
PRECIOENERGIA(i) PRECIOENERGIA / 1
                 2
                 3 ..../

Utilizaré un vector del consumo de la escuela por horas
CONSUMOESCUELA = Consumo de la escuela
CONSUMOESCUELA(i) CESCUELA / 1
                 2
                 3 ..../

Utilizaré un vector de la producción fotovoltáica por horas
PRODUCCIONFOTOVOLTAICA = Producción fotovoltáica de la escuela
PRODUCCIONFOTOVOLTAICA(i) PFOTOVOLTAICA / 1
                      2
                      3 ..../

Utilizaré un vector de 0 y 1 que tendrá un 1 en las posiciones en las que
el coche está en la escuela y un 0 en las que no.
PERIODOESTACIONADO(i) PERIODO DE ESTANCIA  / 1
                      2
                      3 ..../

Utilizaré un vector de los costes por hora (Lo que se gasta por hora en energía)
CONSUMOPORHORA = Coste por hora -> Lo que gasta la escuela
CONSUMOPORHORA(i) CHORA / 1
              2
              3 ..../

FOTOVOLTAICASUPERIOR: Vector de 24 horas que nos indica si en algún momento se
produce más fotovoltáica que el máximo de consumo, caso en el que se "perderá"
ese exceso de producción.

COCHEACEPTADO: un 1 en las posiciones de los coches donde realmente compensa
aceptarlo y un 0 cuando se pierde dinero con ese coche.

La función objetivo a minimizar será:

        Min F(x) = SUM(I,CONSUMOPORHORA(I))) -> Minimizar el sumatorio de los costes/hora

$OFFTEXT



SET
         I HORAS /1*24/
         J COCHES /1*3/;

PARAMETERS
*Precio por KWh
  PRECIOENERGIA(I) precio energía  /1       3.
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
                         13      8.
                         14      8.
                         15      8.
                         16      9.
                         17      10.
                         18      11.
                         19      12.
                         20      10.
                         21      8.
                         22      3.
                         23      3.
                         24      3. /

*Producción fotovoltaica de la escuela / hora
  PRODUCCIONFOTOVOLTAICA(I) p. fotovoltaica /1       0.
                         2       0.
                         3       0.
                         4       0.
                         5       0.
                         6       0.
                         7       0.
                         8       10.
                         9       20.
                         10      30.
                         11      35
                         12      40.
                         13      43
                         14      45
                         15      45
                         16      44
                         17      40.
                         18      35
                         19      20.
                         20      10.
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
                         13      85.
                         14      80.
                         15      80.
                         16      80.
                         17      90.
                         18      100.
                         19      150.
                         20      130.
                         21      80.
                         22      60.
                         23      50.
                         24      50. /

 CARGAINICIAL(J)            Carga inicial en kWh            / 1 10, 2 20 , 3 22/
 HORASALIDA(J)              Hora de salida                  / 1 16 , 2 20 , 3 14/
 HORALLEGADA(J)             Hora de llegada                 / 1 11 , 2 9 , 3 8/
 FOTOVOLTAICASUPERIOR(I)    Vector con un 1 en las posiciones en las que hay más producción que consumo
 ;

TABLE
*Tabla de 1 y 0 con un 1 en las horas en las que el coche está aparcado.
*Filas -> Coches.
*Columnas -> Horas.
PERIODOESTACIONADO(J, I) PERIODO DE ESTANCIA
         1        2        3        4        5        6        7        8        9        10       11       12       13       14       15       16       17       18       19       20       21       22       23       24
1        0        0        0        0        0        0        0        0        0        0        1        1        1        1        1        1        0        0        0        0        0        0        0        0
2        0        0        0        0        0        0        0        0        1        1        1        1        1        1        1        1        1        1        1        1        0        0        0        0
3        0        0        0        0        0        0        0        1        1        1        1        1        1        1        0        0        0        0        0        0        0        0        0        0
;

SCALAR
         CAPACIDAD               Capacidad de la batería en kWh  /24/
         CARGAALASALIDA          Carga minima cuando se va       /18/
         COUNTERLOOP             Contador para el loop           /0/
         NUMCOCHES               Número de coches                /3/
         RATIOCARGADESCARGA      KWh máximos en 1 hora           /3.68/;

*LOOP para completar el vector FOTOVOLTAICASUPERIOR. Tiene un 1 si la producción
*fotovoltáica en la hora I es menor que el consumo, y un 0 en caso contrario
LOOP(I, if ((CONSUMOESCUELA(I) + (NUMCOCHES*RATIOCARGADESCARGA)) < PRODUCCIONFOTOVOLTAICA(I) , FOTOVOLTAICASUPERIOR(I) = 0;
        else FOTOVOLTAICASUPERIOR(I) = 1;);
    );

*DISPLAY 'FOTOVOLTAICASUPERIOR:', FOTOVOLTAICASUPERIOR;

VARIABLES
F;

POSITIVE VARIABLES
CARGA(J,I), CONSUMOPORHORA(I);

BINARY VARIABLES
COCHEACEPTADO(J);

*fx para fijar el valor de una variable.
*Este loop inicializa el valor de la carga con CARGAINICIAL.
*Fija ese valor en todas las horas hasta que llega.
LOOP(J,LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP <= HORALLEGADA(J), CARGA.fx(J,I) =  CARGAINICIAL(J););
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
    ););

*lo para poner el límite inferior de una variable.
*Este loop pone un límite inferior a la carga de salida. Aseguramos que el
*coche se va con una carga mínima.
*PARA SIMULACIONES 2.1 Y 3.1 CAMBIAR CARGAALASALIDA POR CARGAINICIAL(J).
LOOP(J,
LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP >= HORASALIDA(J), CARGA.lo(J,I) =  CARGAALASALIDA;);
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
    ););

EQUATIONS
     OBJ                         La función objetivo
     COSTESINCOCHES(I)           Función para comparar el coste si no se usase este algoritmo
     ITERACION(I)                Función de las horas 1 a la 24
     ITERACIONCOCHEACEPTADO(I)   Función de las horas 1 a la 24 que incluye la variable binaria COCHEACEPTADO(I)
     CAPACIDADMAX(J,I)           Función que condiciona la carga de la batería a la capacidad
     CARGAMAX(J,I)               Función que condiciona la carga  por hora máxima a 3.68 kWh
     DESCARGAMAX(J,I)            Función que condiciona la descarga  por hora máxima a 3.68 kWh
     NODESCARGADEBAJO(J,I)       Función que no permite descarga por debajo de la carga con la que llega el coche
;

OBJ ..                           F  =E=  sum(I, CONSUMOPORHORA(I));

COSTESINCOCHES(I) ..             FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I)]) =E= CONSUMOPORHORA(I);

ITERACION(I) ..                  FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I) + sum(J,[[CARGA(J,I) - CARGA(J,I-1)]*PERIODOESTACIONADO(J,I)])]) =E=  CONSUMOPORHORA(I) ;

ITERACIONCOCHEACEPTADO(I) ..     FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I) + sum(J,COCHEACEPTADO(J)*[[CARGA(J,I) - CARGA(J,I-1)]*PERIODOESTACIONADO(J,I)])]) =E=  CONSUMOPORHORA(I) ;

CAPACIDADMAX(J,I) ..             CARGA(J,I) =L= CAPACIDAD;

CARGAMAX(J,I) ..                 CARGA(J,I+1) - CARGA(J,I) =L= RATIOCARGADESCARGA;

DESCARGAMAX(J,I) ..              CARGA(J,I) - CARGA(J,I-1) =G= -RATIOCARGADESCARGA;

NODESCARGADEBAJO(J,I) ..         CARGA(J,I) =G= CARGAINICIAL(J);


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

MODEL progSinCoches /OBJ,COSTESINCOCHES/ ;
MODEL progConCoches2 /OBJ,ITERACION, CAPACIDADMAX, CARGAMAX, DESCARGAMAX/ ;
MODEL progConCoches3 /OBJ,ITERACION, CAPACIDADMAX, CARGAMAX, DESCARGAMAX, NODESCARGADEBAJO/ ;
MODEL progConCoches4 /OBJ, ITERACIONCOCHEACEPTADO, CAPACIDADMAX, CARGAMAX, DESCARGAMAX/ ;
MODEL progConCoches5 /OBJ, ITERACIONCOCHEACEPTADO, CAPACIDADMAX, CARGAMAX, DESCARGAMAX, NODESCARGADEBAJO/ ;

SOLVE progSinCoches using lp minimizing F;
SOLVE progConCoches2 using lp minimizing F;
SOLVE progConCoches3 using lp minimizing F;


*MINLP -> Mixed integer non linear programing
SOLVE progConCoches4 using MINLP minimizing F;
*SOLVE progConCoches5 using MINLP minimizing F;
