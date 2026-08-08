% Lista 02

%%

clear
clc

%% Exercicio 01

texto_cidade = input('Entre com o nome de uma cidade: ', 's');
disp(texto_cidade)

fprintf('Cidade escolhida: %s \n', texto_cidade)

%% Exercicio 02

x = 12;
if x > 10
    disp('Maior que 10')
elseif x == 10
    disp('Igual a 10')
else
    disp('Menor que 10')
end

%% Exercicio 03

for i = 1:5
    resultado = i * 3;
    fprintf('%d vezes 3 = %d \n', i, resultado)
end

%% Exercício 04

x = 0;
i = 0;
while i < 5
    x = x + 1;
    i = i + 1;
    fprintf('Repeticao %d - x = %d \n', i, x)
end

% Exercic 05

%% letra A

x = 0;
i = 0;
while i < 5
    x = x + 1;
    i = i + 1;
    fprintf('Repeticao %d - x = %d \n', i, x)
end

%% Letra B

valor = 3;
resultado = funcao_triplo(valor);
fprintf('Triplo de %d = %d \n', valor, resultado)