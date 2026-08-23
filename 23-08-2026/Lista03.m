% Lista 03
%% 
clc
clear
close all

%% Exercicio 01

t = 0:0.1:10;

y = 2*sin(3*t);
z = 2*cos(3*t);

figure(1)
plot(t,y,'b',t,z,'r','LineWidth',1.5),grid

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Senoide e cossenoide')
legend('2*sin(3t)','2*cos(3t)','Location','North')

length(t)

%% Exercicio 02

a = input('Entre com o valor do coeficiente a: ');

if a > 0
    disp('O coeficiente digitado é positivo')
elseif a < 0
    disp('O coeficiente digitado é negativo')
else
    disp('O coeficiente digitado é igual a zero')
end

x = -10:0.1:10;
y = a*x + 2;

figure(2)
plot(x,y,'b','LineWidth',1.5),grid

xlabel('x')
ylabel('y')
title('Funcao y = a*x + 2')
legend('y','Location','SouthEast')

% Regiao que vai ser destacada na janela menor
x_zoom = -2:0.1:2;
y_zoom = a*x_zoom + 2;

% [posicao horizontal, posicao vertical, largura, altura]
axes('Position',[0.2 0.6 0.2 0.25])

box on

plot(x_zoom,y_zoom,'r','LineWidth',1.5),grid

xlim([-2 2])
title('Regiao de -2 a 2')

%% exercicio 03

multiplos = zeros(1,5);

for i = 1:5
    multiplos(i) = i * 3;
    fprintf('%d vezes 3 = %d \n', i, multiplos(i))
end

dobro = multiplos * 2;

figure(3)

subplot(2,1,1)
plot(multiplos)
xlabel('Posicao no vetor')
ylabel('Valor')
title('Multiplos de 3')

subplot(2,1,2)
plot(dobro,'r-o','LineWidth',1.5),grid
xlabel('Posicao no vetor')
ylabel('Valor')
title('Dobro dos multiplos de 3')

%% exercicio 4
t = 0.1:0.1:1000;
y = 50000*exp(-0.05*t);

figure(4)

subplot(2,1,1)
plot(t,y,'b','LineWidth',1.5),grid
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Escala normal')

subplot(2,1,2)
semilogy(t,y,'r','LineWidth',1.5),grid
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Escala logaritmica em Y')

%% exercicio 5

[x,y] = meshgrid(1:0.5:10, 1:20);

z = sin(x) + cos(y);

figure(5)
surf(x,y,z)

colormap("summer")
shading interp 

xlabel('x')
ylabel('y')
zlabel('z')
title('Superficie z = sin(x) + cos(y)')

figure(6)
contour(x,y,z)

colormap("summer")
grid on

xlabel('x')
ylabel('y')
title('Curvas de nivel de z = sin(x) + cos(y)')