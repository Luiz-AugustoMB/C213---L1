% Lista 04

%%

clc
clear

%% Exercicio 01

% M = massa do corpo em kg
M = 2;

% B = coeficiente de amortecimento
B = 3;

% K = constante elastica da mola
K = 8;

% Numerador da funcao de transferencia
num = 1;

% Denominador da funcao de transferencia
den = [M B K];

% Funcao de transferencia do sistema massa-mola-amortecedor
G1 = tf(num, den)

figure(1)
step(G1, 15)
grid on

xlabel("Tempo (s)")
ylabel("Deslocamento (m)")
title("Sistema massa-mola-amortecedor - Caixa branca")

%% Exercicio 02

% resistencia eletrica em ohms
R = 1000;

% constante de tempo obtida no experimento
tau = 2;

% capacitancia calculada a partir de tau = R*C
C = tau/R

num = 1;
den = [R*C 1];

% Funcao de transferencia do circuito RC
G2 = tf(num, den)

figure(2)
step(G2, 10)
grid on

xlabel("Tempo (s)")
ylabel("Tensao de saida (V)")
title("Circuito RC - Caixa cinza")

%% exercicio 03

% massa
M = 4;

% forca aplicada
F = 1;

% velocidade que o corpo estabilizou
v = 0.5;

% coeficiente de atrito
B = F/v

num = 1;
den = [M B];

% Funcao de transferencia do sistema massa-atrito
G3 = tf(num, den)

figure(3)

step(G3, 20)
hold on

% Representacao da forca aplicada ao sistema
plot([0 0 20], [0 F F], "r--", "LineWidth", 1)

grid on

xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
title("Sistema massa-atrito - Caixa cinza")
legend("Velocidade do corpo", "Forca aplicada", "Location", "southeast")