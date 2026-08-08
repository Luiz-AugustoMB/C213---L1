%

clc
clear

% Lista 1

% Exercicio 01

%% Variáveis
a = 12;
b = 5;

%% Soma

soma = a + b

%% Subtração

sub = a - b

%% Multiplicação

mult = a * b

%% Divisão

div = a / b

%% A elevado a B

potencia  = a^b

% Exercicio 02

%% Raiz quadrada de 144

raiz = sqrt(144)

%% Arredondamento de 7.6 -> vai pro inteiro mais proximo (8)

round(7.6)

%% Arredondamento de 4.01 para cima

ceil(4.01)

%% Resto da divisão (250/17)

rem(250,17)

% Exercicio 03

%% MDC

gcd(24,36)

%% MMC

lcm (12,18)

% Exercicio 04

%% Exponencial e trigonometria

exp(2)

%% Seno

a = 30;
b = pi;
seno = (a*b/180);
sin(seno)

%% Cosseno

a = 60;
b = pi;
coseno = (a*b/180);
cos(coseno)

%% Tangente

a = 45;
b = pi;
tangente = (a*b/180);
tan(tangente)

% Exercício 05

%% Criando vetor de 1 a 10

vet = 1:10

%% Criando vetor de 10 a 1

vet_contrario = 10:-1:1

%% Vetor de pares de 0 a 20

vet_par = 0:2:20

%% Vetor com linspace

vet_linspace = linspace(0, 100, 5)

% Exercício 06

v = [4 8 15 16 23 42]

%% Primeira posição

v(1)

%% Ultimo elemento

v(end)

%% Posições 2 ate 4

v(2:4)

%% Posições 1-2-6

v(1:2:6)

% Exercício 07

%% Vertor do exercicio

vetor = [5 10 15 20 25]

%% Quantidade de elementos

length(v)

%% Dimensão do vetor

size(vetor)

%% Soma dos elementos

sum(vetor)

%% Média dos elementos

mean(vetor)

%% Maior elemento do vetor

max(vetor)

%% Menor elemento do vetor

min(vetor)

% Exercicio 08

%% Vetor do exercicio

vetor08 = [10 20 30 40]

coluna = vetor08'

%% Comparando tamanhos

size(vetor08)
size(coluna)

% Exercicio 09

%% Matriz

a = [3 6 9;
    2 4 8;
    1 5 7]

%% Elemento coluna 2 linha 3

a(2, 3)

%% Toda a primeira linha

a(1, :)

%% Toda a segunda linha

a(2, :)

%% As dimensões da matriz

size(a)

% Exercício 10

%% Matriz

A = [1 2;
    3 4]

B = [2 0;
    1 5]

%% Soma

soma = A + B

%% Multiplicação 

multiplicacao = A * B

%% Tranporta de A

transporta = A'

%% Matriz 3x3 de zeros

Matriz_zeros = zeros(3)

%% Matriz 2X4 com uns

matriz_ones = ones(2, 4)

%% Matriz identidade 4x4

identidade = eye(3)

%% Matrix aleatoria 3x3 

aleatoria = rand(3)