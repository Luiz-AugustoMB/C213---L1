% Relatório 02 

%% Limpa tudo

clc
clear
close all

%% Exercicio 01

% Sistema 1
M1 = 2;

% coeficiente de atrito viscoso
B1 = 3;

% Sistema 2
M2 = 4;
B2 = 6;

% Numerador da funcao de transferencia dos dois sistemas
num = 1;

% Denominador de cada sistema: M*s + B
den1 = [M1 B1];
den2 = [M2 B2];

disp('Funcao de transferencia do Sistema 1:')
G1 = tf(num, den1)

disp('Funcao de transferencia do Sistema 2:')
G2 = tf(num, den2)

% força aplicad nos dois sistemas
F = 1;

tempo = 20;

%% Exercicio 01 - Respostas na mesma figura

figure(1)

step(G1, tempo)
hold on
step(G2, tempo)

plot([0 0 tempo], [0 F F], 'k--', 'LineWidth', 1)

grid on

xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')
title('Sistemas massa-atrito - Caixa branca')
legend('Sistema 1 (M = 2, B = 3)', 'Sistema 2 (M = 4, B = 6)', ...
    'Forca aplicada', 'Location', 'east')

%%  graficos separados

figure(2)

subplot(2,1,1)
step(G1, tempo)
grid on
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')
title('Sistema 1 - M = 2 kg e B = 3')

subplot(2,1,2)
step(G2, tempo)
grid on
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')
title('Sistema 2 - M = 4 kg e B = 6')

%% Exercicio 01 - Janela de ampliacao dentro da figura 1

figure(1)

% [posicao horizontal, posicao vertical, largura, altura]
axes('Position',[0.55 0.45 0.3 0.3])

box on   % Mostra a borda da janela nova

step(G1, 5)
hold on
step(G2, 5)

grid on

% Regiao que sera mostrada na ampliacao
xlim([0 5])

title('Primeiros 5 segundos')

%% Exercicio 02 

R = 2000;

tau = 2.5;

disp('Capacitancia calculada (F):')
C = tau/R

num = 1;

% RC: R*C*s + 1
den = [R*C 1];

disp('Funcao de transferencia do circuito RC:')
G3 = tf(num, den)

figure(3)

step(G3, 15)
grid on

xlabel('Tempo (s)')
ylabel('Tensao de saida (V)')
title('Circuito RC - Caixa cinza')

%% Exercicio 02

% Vetor de resistencias de teste, mantendo o capacitor calculado
Rteste = 100:100:10000;

% Constante de tempo de cada resistencia: tau = R*C
tauteste = Rteste*C;

figure(4)

subplot(2,2,1)
plot(Rteste, tauteste, 'b', 'LineWidth', 1.5)
grid on
xlabel('Resistencia (Ohm)')
ylabel('Constante de tempo (s)')
title('Escala comum nos dois eixos')

subplot(2,2,2)
semilogy(Rteste, tauteste, 'r', 'LineWidth', 1.5)
grid on
xlabel('Resistencia (Ohm)')
ylabel('Constante de tempo (s)')
title('Escala logaritmica em Y')

subplot(2,2,3)
semilogx(Rteste, tauteste, 'g', 'LineWidth', 1.5)
grid on
xlabel('Resistencia (Ohm)')
ylabel('Constante de tempo (s)')
title('Escala logaritmica em X')

subplot(2,2,4)
loglog(Rteste, tauteste, 'k', 'LineWidth', 1.5)
grid on
xlabel('Resistencia (Ohm)')
ylabel('Constante de tempo (s)')
title('Escala logaritmica em X e Y')

%% exercicio 03

t = (0:25)';

% u = sinal de entrada aplicado ao sistema
u = [0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% y = sinal de saida medido no experimento
y = [0.008 0.012 0.006 0.010 0.020 0.382 0.671 0.903 1.082 1.226 1.335 1.425 ...
    1.492 1.547 1.587 1.618 1.642 1.660 1.674 1.684 1.692 1.698 1.702 1.706 ...
    1.709 1.711];

% Convertendo os sinais para vetores coluna
u = u(:);
y = y(:);

%% visualização ex 3
figure(5)

subplot(2,1,1)
plot(t, u, 'b', 'LineWidth', 1.5)
grid on
xlabel('Tempo (s)')
ylabel('Entrada u')
title('Dados do experimento')

subplot(2,1,2)
plot(t, y, 'r', 'LineWidth', 1.5)
grid on
xlabel('Tempo (s)')
ylabel('Saida y')

%% gráfico 3D

figure(6)

plot3(t, u, y, 'b', 'LineWidth', 1.5)
grid on

xlabel('Tempo (s)')
ylabel('Entrada u')
zlabel('Saida y')
title('Dados do experimento em 3D')

%% Exercicio 03 - Identificacao do sistema

% tempo de amostragem
Ts = 1;

dados = iddata(y, u, Ts);

% tfest(dados, quantidade de polos, quantidade de zeros)
disp('Funcao de transferencia estimada:')
G4 = tfest(dados, 1, 0)

%% Comparacao e resposta ao degrau

figure(7)
compare(dados, G4)
grid on

figure(8)
step(G4, 25)
grid on

xlabel('Tempo (s)')
ylabel('Saida')
title('Modelo identificado - Caixa preta')

%% Exercicio 04 

% Experimento 1
R1 = 1000;
tau1 = 1.2;
C1 = tau1/R1;

% Experimento 2
R2 = 2000;
tau2 = 2.8;
C2 = tau2/R2;

% Experimento 3
R3 = 3000;
tau3 = 3.9;
C3 = tau3/R3;

% Experimento 4
R4 = 5000;
tau4 = 7.0;
C4 = tau4/R4;

fprintf('Capacitancia do experimento 1 = %.6f F \n', C1)
fprintf('Capacitancia do experimento 2 = %.6f F \n', C2)
fprintf('Capacitancia do experimento 3 = %.6f F \n', C3)
fprintf('Capacitancia do experimento 4 = %.6f F \n', C4)

% Vetores com os resultados dos quatro experimentos
R = [R1 R2 R3 R4];
tau = [tau1 tau2 tau3 tau4];
C = [C1 C2 C3 C4];

%% Gráfica 3D

figure(9)

plot3(R, tau, C, 'b-o', 'LineWidth', 1.5)
grid on

xlabel('Resistencia (Ohm)')
ylabel('Constante de tempo (s)')
zlabel('Capacitancia (F)')
title('Experimentos com circuitos RC')

%% Funcao de transferencia do Experimento 3

num = 1;

% Denominador do circuito RC do experimento 3
den = [R3*C3 1];

disp('Funcao de transferencia do experimento 3:')
G5 = tf(num, den)

figure(10)

step(G5, 20)
grid on

xlabel('Tempo (s)')
ylabel('Tensao de saida (V)')
title('Circuito RC do experimento 3 - Caixa cinza')

% ampliacao dentro da propria imagem
axes('Position',[0.55 0.3 0.3 0.3])

box on

step(G5, 5)
grid on

xlim([0 5])

title('Primeiros 5 segundos')

%% Exercicio 05 

M = 3;

% coeficiente de atrito viscoso
B = 5;

num = 1;
den = [M B];

disp('Funcao de transferencia do Sistema A:')
GA = tf(num, den)

%% Sistema B

R = 1500;

%  constante de tempo obtida experimentalmente
tau = 3;

disp('Capacitancia do Sistema B (F):')
C = tau/R

num = 1;
den = [R*C 1];

disp('Funcao de transferencia do Sistema B:')
GB = tf(num, den)

%% Sistema C

t = (0:20)';

% sinal de entrada aplicado ao sistema
u = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% sinal de saida medido no experimento
y = [0.010 0.006 0.012 0.018 0.408 0.706 0.934 1.103 1.229 1.322 1.391 1.441 ...
    1.479 1.505 1.526 1.540 1.551 1.558 1.564 1.568 1.571];

% convertendo os sinais para vetores coluna
u = u(:);
y = y(:);

% tempo de amostragem
Ts = 1;

dados = iddata(y, u, Ts);

disp('Funcao de transferencia estimada do Sistema C:')
GC = tfest(dados, 1, 0)

%% Respostas ao degrau dos sistemas

figure(11)

subplot(3,1,1)
step(GA, 20)
grid on
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')
title('Sistema A - Caixa branca')

subplot(3,1,2)
step(GB, 20)
grid on
xlabel('Tempo (s)')
ylabel('Tensao de saida (V)')
title('Sistema B - Caixa cinza')

subplot(3,1,3)
step(GC, 20)
grid on
xlabel('Tempo (s)')
ylabel('Saida')
title('Sistema C - Caixa preta')

%% Dados do Sistema C

figure(12)

subplot(2,1,1)
plot(t, u, 'b', 'LineWidth', 1.5)
grid on
xlabel('Tempo (s)')
ylabel('Entrada u')
title('Dados do experimento do Sistema C')

subplot(2,1,2)
plot(t, y, 'r', 'LineWidth', 1.5)
grid on
xlabel('Tempo (s)')
ylabel('Saida y')

%% Comparacao do Sistema C

figure(13)
compare(dados, GC)
grid on

%% Exercicio 05 - Classificacao dos sistemas

% Sistema A é caixa branca porque a equacao do sistema e conhecida e a funcao
% de transferencia foi montada apenas com os parametros fisicos M e B.

% Sistema B é caixa cinza porque a estrutura do modelo e conhecida (circuito RC
% de primeira ordem), mas o parametro C so foi obtido a partir da constante de
% tempo medida no experimento.

% Sistema C é caixa preta porque nada se sabe sobre o sistema: o modelo foi
% estimado somente a partir dos dados de entrada e saida medidos no experimento.