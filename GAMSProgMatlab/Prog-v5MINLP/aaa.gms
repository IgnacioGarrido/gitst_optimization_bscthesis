SET I;

PARAMETERS  CARGAINICIAL , HORASALIDA , HORALLEGADA ;
PARAMETER PERIODOESTACIONADO(I) ;

$if not set gdxin $set gdxin MtoG
$GDXIN %gdxin%
$LOAD I CARGAINICIAL HORASALIDA HORALLEGADA PERIODOESTACIONADO
$GDXIN

PARAMETERS

********************************************************************************************************************************************************************
********************************************************************************************************************************************************************
********************************************************************************************************************************************************************

$ONTEXT
*INVIERNO
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

$OFFTEXT

********************************************************************************************************************************************************************
********************************************************************************************************************************************************************
********************************************************************************************************************************************************************

$ONTEXT

*PRIMAVERA
  PRECIOENERGIA(I) precio energía  /1        0.10816
2        0.10735
3        0.10422
4        0.10355
5        0.10327
6        0.10324
7        0.10785
8        0.11672
9        0.11528
10        0.11502
11        0.11369
12        0.11213
13        0.11171
14        0.11102
15        0.10973
16        0.10457
17        0.10376
18        0.10346
19        0.1033
20        0.10447
21        0.11124
22        0.1154
23        0.10614
24        0.10381
 /


*PRIMAVERA
  PRODUCCIONFOTOVOLTAICA(I) p. fotovoltaica /1        0
2        0
3        0
4        0
5        0
6        0
7        0
8        0.001
9        0.098
10        1.239
11        4.51
12        6.15
13        8.021
14        10.235
15        10.55
16        9.015
17        6.263
18        2.599
19        0.411
20        0.099
21        0.003
22        0
23        0
24        0
 /


*PRIMAVERA
  CONSUMOESCUELA(I) consumo escuela /1        16.59305833
2        16.53566667
3        16.12069167
4        16.33203333
5        16.21999167
6        16.31400833
7        16.73023333
8        32.99425833
9        54.59871667
10        68.02641667
11        75.00676667
12        76.08936667
13        77.30204167
14        72.61345
15        67.482475
16        62.76636667
17        59.61899167
18        59.96645833
19        54.39643333
20        46.61051667
21        27.03819167
22        25.098225
23        18.88199167
24        17.52773333
/

$OFFTEXT

********************************************************************************************************************************************************************
********************************************************************************************************************************************************************
********************************************************************************************************************************************************************

$ONTEXT

*VERANO
  PRECIOENERGIA(I) precio energía  /1        0.11069
2        0.10218
3        0.09882
4        0.09676
5        0.095
6        0.09452
7        0.09474
8        0.10171
9        0.10291
10        0.10404
11        0.0999
12        0.10326
13        0.10396
14        0.10536
15        0.10749
16        0.10745
17        0.10654
18        0.10633
19        0.10269
20        0.10257
21        0.10288
22        0.10794
23        0.11157
24        0.11019
/


*VERANO
  PRODUCCIONFOTOVOLTAICA(I) p. fotovoltaica /1        0
2        0
3        0
4        0
5        0
6        0
7        0
8        0
9        0.023
10        0.509
11        2.328
12        6.413
13        8.213
14        9.479
15        10.025
16        7.515
17        2.058
18        1.095
19        0.222
20        0.071
21        0.02
22        0
23        0
24        0
/


*VERANO
  CONSUMOESCUELA(I) consumo escuela /1        15.79004167
2        15.45044167
3        15.74135
4        15.56744167
5        15.770325
6        15.60140833
7        15.73653333
8        22.285925
9        193.0669833
10        192.7126583
11        210.1847083
12        209.2127417
13        221.0418
14        227.11485
15        227.3223083
16        223.0809167
17        229.32465
18        229.8379083
19        221.8427833
20        210.9914083
21        85.29118333
22        21.02435833
23        19.22509167
24        17.026
/

$OFFTEXT


********************************************************************************************************************************************************************
********************************************************************************************************************************************************************
********************************************************************************************************************************************************************

*$ONTEXT

*OTOÑO
  PRECIOENERGIA(I) precio energía  /1        0.11755
2        0.11399
3        0.10875
4        0.10754
5        0.10887
6        0.11247
7        0.12376
8        0.12776
9        0.12657
10        0.12526
11        0.12506
12        0.12477
13        0.12525
14        0.12565
15        0.12422
16        0.12139
17        0.12047
18        0.12217
19        0.12332
20        0.12963
21        0.13552
22        0.13099
23        0.11797
24        0.11301
/


*OTOÑO
  PRODUCCIONFOTOVOLTAICA(I) p. fotovoltaica /1        0
2        0
3        0
4        0
5        0
6        0
7        0
8        0
9        0
10        0.07
11        0.267
12        0.524
13        1.271
14        6.042
15        8.195
16        4.285
17        1.621
18        0.496
19        0.103
20        0
21        0
22        0
23        0
24        0
 /

*OTOÑO
  CONSUMOESCUELA(I) consumo escuela /1        16.039925
2        16.15481667
3        16.31661667
4        16.21679167
5        16.27056667
6        16.236575
7        16.92513333
8        21.29335833
9        39.72148333
10        63.06515
11        68.65985833
12        68.76865833
13        67.63531667
14        62.798475
15        58.790275
16        59.39766667
17        61.65389167
18        57.82683333
19        54.876575
20        49.49373333
21        35.350225
22        24.512525
23        18.26321667
24        16.51139167
/


*$OFFTEXT


********************************************************************************************************************************************************************
********************************************************************************************************************************************************************
********************************************************************************************************************************************************************






FOTOVOLTAICASUPERIOR(I)    Vector con un 1 en las posiciones en las que hay más producción que consumo
;

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
CARGA(I), CONSUMOPORHORA(I), X;

*fx para fijar el valor de una variable.
*Este loop inicializa el valor de la carga con CARGAINICIAL.
*Fija ese valor en todas las horas hasta que llega.
LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP < HORALLEGADA, CARGA.fx(I) =  CARGAINICIAL;);
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;);
);


*lo para poner el límite inferior de una variable.
*Este loop pone un límite inferior a la carga de salida. Aseguramos que el
*coche se va con una carga mínima.
*PARA SIMULACIONES 2.1 Y 3.1 CAMBIAR CARGAALASALIDA POR CARGAINICIAL(J).

LOOP(I, COUNTERLOOP = COUNTERLOOP+1;
        if (COUNTERLOOP >= HORASALIDA, if(CARGAINICIAL > CARGAALASALIDA, CARGA.lo(I) = CARGAINICIAL; else CARGA.lo(I) =  CARGAALASALIDA;); ;);
        if (COUNTERLOOP = 24, COUNTERLOOP = 0;)
;);


EQUATIONS
     OBJ                         La función objetivo
     AUXSINCOCHE                 Auxiliar iteraciones sin coche
     ITERACIONCOCHEACEPTADO(I)   Función de las horas 1 a la 24 que incluye la variable binaria COCHEACEPTADO(I)
     CAPACIDADMAX(I)             Función que condiciona la carga de la batería a la capacidad
     CARGAMAX(I)                 Función que condiciona la carga  por hora máxima a 3.68 kWh
     DESCARGAMAX(I)              Función que condiciona la descarga  por hora máxima a 3.68 kWh
     NODESCARGADEBAJO(I)         Función que no permite descarga por debajo de la carga con la que llega el coche
     CARGALIMITADA(I)            Función que limita la descarga máxima de la batería a 4.8 kWh
     DINEROPOSITIVO(I)           Nunca se puede ganar dinero vendiendo energía
     MAXGASTO(I)                 No superar los 450 kW
;

OBJ ..                           F  =E=  sum(I, CONSUMOPORHORA(I));

ITERACIONCOCHEACEPTADO(I) ..     FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I) + [[CARGA(I) - CARGA(I-1)]*PERIODOESTACIONADO(I)]]) =E=  CONSUMOPORHORA(I);

AUXSINCOCHE ..                   X =E= sum(I,FOTOVOLTAICASUPERIOR(I)*(PRECIOENERGIA(I)*[CONSUMOESCUELA(I) - PRODUCCIONFOTOVOLTAICA(I)]));

CAPACIDADMAX(I) ..               CARGA(I) =L= CAPACIDAD;

CARGAMAX(I) ..                   CARGA(I+1) - CARGA(I) =L= RATIOCARGADESCARGA;

DESCARGAMAX(I) ..                CARGA(I) - CARGA(I-1) =G= -RATIOCARGADESCARGA;

NODESCARGADEBAJO(I) ..           CARGA(I) =G= CARGAINICIAL;

*
CARGALIMITADA(I) ..              CARGA(I) =G= NODESCARGADEBAJODE;

DINEROPOSITIVO(I) ..             CONSUMOPORHORA(I) =G= 0.000001;

MAXGASTO(I) ..                   CONSUMOPORHORA(I) =L= PRECIOENERGIA(I)*450;
;

MODEL progConCoches4 /OBJ, ITERACIONCOCHEACEPTADO, AUXSINCOCHE, CAPACIDADMAX, CARGAMAX, DESCARGAMAX, CARGALIMITADA, DINEROPOSITIVO, MAXGASTO/ ;
MODEL progConCoches5 /OBJ, ITERACIONCOCHEACEPTADO, AUXSINCOCHE, CAPACIDADMAX, CARGAMAX, DESCARGAMAX, NODESCARGADEBAJO, CARGALIMITADA, DINEROPOSITIVO, MAXGASTO/ ;

*SOLVE progConCoches4 using lp minimizing F;
SOLVE progConCoches5 using lp minimizing F;
