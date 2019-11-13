$TITLE Prueba1

$ONTEXT
Esto es una prueba.

Se trata de introducir los datos en forma matricial, para poderlo
resolver mediante un programa lineal.
        Min F(x) = 3*x1 + 2*x2 +x3 + 2*x4 +3*x5
        s.a:
               2*x1 + 5*x2 + x4 + x5 >= 6
               4*x2 -2*x3 +2*x4 + 3*x5 >= 5
               x1 - 6*x2 + 3*x3 + 7*x4 +5*x5 >= 7
              x1, x2, x3, x4, x5 no negativas

$OFFTEXT

VARIABLES
X1, X2, F;
*F es una variable que queremos que sea mínima -> la función

POSITIVE VARIABLES
X1, X2;

EQUATIONS
*OBJ es la función objetivo -> la que queremos minimizar
OBJ, R1, R2;
*Se pone el nombre de la ecuación seguido de dos puntos y después la ecuación
OBJ..   F =E= 50*X1 + 40*X2 ;
*El "=G=6" significa >= 6
*si fuese <=6 se escribiría "=L=6"
*Si fuese =6 se escribiría "=E=6"
R1..    x1 + 1.5*x2 =L= 750;
R2..    2*X1 + X2 =L= 1000;

MODEL prob1 /OBJ, R1, R2/;
*MODEL nombre/ecuaciones/;

SOLVE prob1 USING LP MAXIMIZING F;
*SOLVE nombre using lp minimizing f;
*using lp -> empleando programación lineal
*minimizing f -> minimizando la función f

