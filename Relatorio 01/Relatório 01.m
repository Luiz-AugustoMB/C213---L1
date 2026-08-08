% Relatório 01

%% Limpa tudo

clc
clear 

%% Exercicio 01

num1 = input('Entre com o valor da primeira medição: ');
num2 = input('Entre com o valor da segunda medição: ');
num3 = input('Entre com o valor da terceira medição: ');

vetor_medicoes = [num1 num2 num3];

media = mean(vetor_medicoes);
maior_valor = max(vetor_medicoes);
menor_valor = min(vetor_medicoes);

fprintf('A média das medições é: %.2f \n', media)
fprintf('O maior valor é: %f \n', maior_valor)
fprintf('O menor valor é: %f \n', menor_valor)

if media >= 8 
    disp('Resultado alto')
elseif media >= 5
    disp('Resultado intermediário')
else 
    disp('Resultado baixo')
end

%% Exercicio 02

a = [3 8 2 10 5 7 1 6];
b = zeros(1, 8);

for i = 1:length(a)
    if a(i) >= 6
        b(i) = a(i) * 2;
    else
        b(i) = a(i) + 3;
    end
end

disp('Vetor A:')
disp(a)
disp('Vetor B:')
disp(b)
fprintf('Soma de B = %d \n', sum(b))
fprintf('Média de B = %.2f \n', mean(b))
fprintf('Maior valor de B = %d \n', max(b))
fprintf('Menor valor de B = %d \n', min(b))

%% Exercicio 03

a = [14 7 20 9 6 11 18 5];
b = zeros(1, 8);
cont = 0;

for i = 1:length(a)
    if rem(a(i), 2) == 0
        b(i) = a(i);
        cont = cont + 1;
    else
        b(i) = 0;
    end
end

disp('Vetor b:')
disp(b)
fprintf('Quantidade de números pares = %d \n', cont)

%% Exercicio 04

a = input('Digite o primeiro valor: ');
b = input('Digite o segundo valor: ');

disp('1 - Soma')
disp('2 - Subtracao')
disp('3 - Multiplicacao')
disp('4 - Divisao')
op = input('Escolha uma opcao: ');

switch op
    case 1
        fprintf('Resultado = %f \n', a + b)
    case 2
        fprintf('Resultado = %f \n', a - b)
    case 3
        fprintf('Resultado = %f \n', a * b)
    case 4
        if b == 0
            disp('Operacao nao pode ser realizada (divisao por zero)')
        else
            fprintf('Resultado = %f \n', a / b)
        end
    otherwise
        disp('Opcao invalida')
end

%% Exerciccio 05

soma = 0;
contador = 0;

while soma <= 4
    valor = rand;
    soma = soma + valor;
    contador = contador + 1;
    fprintf('Sorteado = %.4f | Soma = %.4f \n', valor, soma)
end

if contador > 8
    disp('Muitas repeticoes')
else
    disp('Poucas repeticoes')
end
fprintf('Total de repeticoes = %d \n', contador)

%% exercicio 06

a = [2 7 4 9;
    6 1 8 3];
b = zeros(size(a));
[linhas, colunas] = size(a);

for j = 1:linhas
    for i = 1:colunas
        if a(j,i) > 5
            b(j,i) = a(j,i) * 2;
        else
            b(j,i) = a(j,i) + 5;
        end
    end
end

%% Matriz de A
disp('Matriz A:')
disp(a)

%% Matriz de B
disp('Matriz B:')
disp(b)

%% Transposta de B
disp('Transposta de B:')
disp(b')

%% Linha 1 da matriz B
disp('Primeira linha de B:')
disp(b(1,:))

%% Coluna 3 da matriz b
disp('Terceira coluna de B:')
disp(b(:,3))

%% Exercicio 07

a = [5 12 7 3 9 14];
[soma, media] = analisa_vetor(a);

fprintf('Soma = %d \n', soma)
fprintf('Média = %.2f \n', media)

if media >= 8
    disp('Média elevada')
else
    disp('Média abaixo de 8')
end


%% Exerccio 08

a = [1 5 3 8;
    6 2 7 4];
b = zeros(size(a));
b = transforma_matriz(a, b);

disp('Matriz a:')
disp(a)
disp('Matriz b transformada:')
disp(b)


%% Exercicio 09

texto1 = input('Digite o primeiro valor: ', 's');
texto2 = input('Digite o segundo valor: ', 's');

disp(texto1)
disp(texto2)

n1 = str2num(texto1);
n2 = str2num(texto2);

soma = n1 + n2;
mult = n1 * n2;

fprintf('Soma = %.2f \n', soma)
fprintf('Multiplicação = %.2f \n', mult)

if soma > 20
    disp('Soma alta')
elseif soma == 20
    disp('Soma igual a 20')
else
    disp('Soma baixa')
end


%% exercicio 10
