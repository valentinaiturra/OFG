clc
clear all
close all

%%
beta = 2*(10^(-11)); %[1/m*s]
c = 3; %[m/s]
f = 10^(-4); %[1/s]
LR= c /f; %[m]
l = 0; %[1/m]

k = linspace(-2,0,100); %Deberia usar -1 en lugar de -2???
k = k * (10^(-4)); %[1/m]

for i = 1:length(k)
    omega(i)= (-beta*k(i))/((k(i)^2)+(l^2)+(LR^(-2)));
end

o=[-2 0];
o=o*(10^(-4));

figure()
plot(k,(omega),"LineWidth",2)
axis tight
%xlim(o)
xlabel("Número de onda [1/m]")
ylabel("Frecuencia angular [1/s]")
title("Relación de dispersión onda de Rossby")

%98

%%
for i = 1:length(omega)
    primero(:,i)= beta/(2*omega(i));
    segundo = f/c;
     
    Radio(:,i) = sqrt( ((primero(i)).^2) - ((segundo).^2));
    t = linspace(0, 2*pi, 100);
     
    K(:,i) = (Radio(i)*cos(t)) - primero(i);
    L(:,i) = (Radio(i)*sin(t));
end

figure()
plot(K(:,5),L(:,5),"LineWidth",1.5)
hold on
for i =10:5:20
    plot(K(:,i-1),L(:,i-1),"LineWidth",1.5)
end
legend(string(omega(5:5:20)),"Location","best")
title("Curvas de dispersión onda de Rossby")
xlabel("Primera componente del numero de onda 'k'")
ylabel("Segunda componente del numero de onda 'l'")