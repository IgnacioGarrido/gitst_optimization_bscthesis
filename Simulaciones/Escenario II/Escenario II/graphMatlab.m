cd 'C:\Users\Ignacio\Documents\Universidad\4\SegundoSemestre\TFG\___AuxiliarParaToquetearSinCagarla\Resultados simulaciones\Escenario II\Escenario II'
precio =[0.10816	0.10735	0.10422	0.10355	0.10327	0.10324	0.10785	0.11672	0.11528	0.11502	0.11369	0.11213	0.11171	0.11102	0.10973	0.10457	0.10376	0.10346	0.1033	0.10447	0.11124	0.1154	0.10614	0.10381];
t=1:24;

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
