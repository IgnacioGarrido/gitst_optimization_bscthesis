cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario I\Escenario I'
precio =[0.10816	0.10735	0.10422	0.10355	0.10327	0.10324	0.10785	0.11672	0.11528	0.11502	0.11369	0.11213	0.11171	0.11102	0.10973	0.10457	0.10376	0.10346	0.1033	0.10447	0.11124	0.1154	0.10614	0.10381];
t=1:24;
%%
%Plot escenario sin VE -> Gasto/Hora

consumo = [ 1.795 1.775 1.680 1.691 1.675 1.684 1.804 3.851 6.283 7.682 8.015 7.842 7.739 6.925 6.247 5.621 5.536 5.935 5.577 4.859 3.007 2.896 2.004 1.820];
plot(t, consumo);
axis([1 24 0 9]);
title('Gasto/hora');
xlabel('Hora');
ylabel('€');

%%
%Plot escenario sin VE -> precio energía

plot(t, precio);
axis([1 24 (min(precio)-0.005) (max(precio)+0.005)]);
title('Precio de la energía');
xlabel('Hora');
ylabel('€/kWh');


%%
%Plot consumo precio primavera
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);
axis([1 24 0 (max([max(precio.*100) max(primavera)])+1)]);
hold on;
plot(t,precio.*100,'k.');
title('Gasto/hora');
xlabel('Hora');
ylabel('€ | cént./kWh');
savefig('_primavera.fig'); 
hold off;

%%
%Plot coches
coches = importdata('df_coche.csv');
coches = coches.data;
plot(t,coches(:,2));
axis([1 24 0 25]);
title('SoC');
xlabel('Hora');
ylabel('kWh | cént./kWh');
hold on;
plot(t,coches(:,3));
plot(t,coches(:,4));
plot(t,coches(:,5));
plot(t,coches(:,6));
plot(t,coches(:,7));
plot(t,precio.*100,'k.');
%legend('VE1', 'VE2', 'VE3', 'VE4', 'VE5', 'VE6', 'Precio energía');
savefig('_coches.fig');
hold off;

%%
%Superposición escenarios

A=[1.795 1.775 1.680 1.691 1.675 1.684 1.804 3.851 6.283 7.682 8.015 7.842 7.739 6.925 6.247 5.621 5.536 5.935 5.577 4.859 3.007 2.896 2.004 1.820];
plot(t,A);
hold on;

cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario I\Escenario I'
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);

cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario II\Escenario II'
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);

cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario III\Escenario III'
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);

cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario IV\Escenario IV'
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);

cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario V\Escenario V'
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);

cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario VI\Escenario VI'
estaciones = importdata('df_estaciones.csv');
estaciones = estaciones.data;
primavera = estaciones(:,2);
plot(t,primavera);

axis([1 24 0 (max([max(precio.*450) max(primavera)])+1)]);
%legend('E. sin VE', 'E. I', 'E. II', 'E. III', 'E. IV', 'E. V', 'E. VI')
plot(t,precio.*450,'k.');
title('Gasto/hora');
xlabel('Hora');
ylabel('€');

hold off;

%%
%SoC mínimo a la entrada E. II

SoC = [17.949	17.857	17.791	17.703	17.62	17.378	17.128	16.899	16.754	16.754	16.534	16.297
        NaN	17.906	17.844	17.804	17.725	17.488	17.238	17.005	16.864	16.86	16.64	16.403
        NaN	NaN	NaN	17.963	17.897	17.686	17.444	17.224	17.084	17.079	16.855	16.614
        NaN	NaN	NaN	NaN	NaN	NaN	NaN	17.963	17.945	17.919	17.664	17.365];

LimiteSup = repmat(18,12,1);
t = 11:22;

%plot(t,LimiteSup, 'k.');
axis([11 22 16 18.5]);
title('SoC mínimo a la entrada');
xlabel('Hora');
ylabel('kWh');
hold on;
plot(t,SoC(1,:));
plot(t,SoC(2,:));
plot(t,SoC(3,:));
plot(t,SoC(4,:));
legend('8:00', '9:00', '11:00', '15:00' );
%savefig('_SoCII.fig');
hold off;

%%
%SoC mínimo a la entrada E. II

SoC = [18	18	18	18	18	18	18	18	18	17.958	17.695	17.396
NaN	18	18	18	18	18	18	18	18	17.958	17.695	17.396
NaN	NaN	NaN	18	18	18	18	18	18	17.958	17.695	17.396
NaN	NaN	NaN	NaN	NaN	NaN	NaN	18	18	17.958	17.695	17.396];

LimiteSup = repmat(18,12,1);
t = 11:22;

plot(t,LimiteSup, 'k.');
axis([11 22 16 18.5]);
title('SoC mínimo a la entrada');
xlabel('Hora');
ylabel('kWh');
hold on;
plot(t,SoC(1,:));
plot(t,SoC(2,:));
plot(t,SoC(3,:));
plot(t,SoC(4,:));
%legend('8:00', '9:00', '11:00', '15:00' );
savefig('_SoCIV.fig');
hold off;

%%
%Plot gasto VE si se va antes

Perdidas = [NaN	NaN	-0.42 	0.00 	-0.13 	-0.54 	-0.54 	-0.54 	-0.25 	-0.53 	-0.53 	-0.40 	-0.02 	NaN	NaN
            NaN NaN	NaN	0.13 	0.55 	0.55 	0.43 	0.02 	-0.38 	0.01 	NaN	NaN	NaN	NaN	NaN
            NaN	NaN	NaN	-0.42 	-0.55 	-0.14 	-0.55 	-0.14 	-0.54 	-0.54 	-0.54 	-0.42 	-0.04 	NaN	NaN
            NaN	NaN	NaN	0.06 	0.48 	0.29 	-0.12 	-0.53 	-0.53 	-0.40 	-0.02 	NaN	NaN	NaN	NaN
            -0.13 	-0.55 	-0.12 	0.30 	0.55 	0.14 	-0.27 	-0.38 	0.02 	NaN	NaN	NaN	NaN	NaN	NaN
            NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	-0.38 	-0.50 	-0.16 	0.22 	0.22 	-0.01]; 

LimiteCero = repmat(0,15,1);
t = 7:21;

%plot(t,LimiteCero, 'k.');
axis([7 21 -0.7 0.7]);
title('Pérdidas si el VE se va antes de la hora prevista');
xlabel('Hora');
ylabel('€');
hold on;
plot(t,Perdidas(1,:));
plot(t,Perdidas(2,:));
plot(t,Perdidas(3,:));
plot(t,Perdidas(4,:));
plot(t,Perdidas(5,:));
plot(t,Perdidas(6,:));
legend('VE 1', 'VE 2', 'VE 3', 'VE 4', 'VE 5', 'VE 6');
%savefig('_Pérdidas.fig');
hold off;        





