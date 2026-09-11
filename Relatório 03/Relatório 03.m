% Relatório 03 - Sistemas de Primeira e Segunda Ordem

%% Limpa tudo

clc
clear
close all

% Configuracoes utilizadas pelo stepinfo nos sistemas de segunda ordem
% Tempo de subida de 0% a 100% do valor final
limites_subida = [0 1];

% Tolerancia de 2% para o tempo de acomodacao
tolerancia_acomodacao = 0.02;

%% Exercicio 01 - Identificacao de um sistema de primeira ordem

% O valor final da saida para degrau unitario e o proprio ganho do sistema
K = 1.8;

% A resposta atinge 63% do valor final em t = T (constante de tempo)
T = 1.2;

% G(s) = K/(T*s + 1) -> forma padrao de primeira ordem
disp('Funcao de transferencia do sistema:')
G1 = tf(K, [T 1])

% Polo do sistema
disp('Polo do sistema:')
disp(pole(G1))

% Tempo de subida de 10% a 90% para sistemas de primeira ordem
Tr1 = 2.2*T;

% Tempo de acomodacao com faixa de 2% para sistemas de primeira ordem
Ta1 = 4*T;

% Ganho em regime permanente
ganho1 = dcgain(G1);

fprintf('Ganho do sistema K = %.2f \n', K)
fprintf('Constante de tempo T = %.2f s \n', T)
fprintf('Polo do sistema = %.4f \n', -1/T)
fprintf('Tempo de subida = %.2f s \n', Tr1)
fprintf('Tempo de acomodacao = %.2f s \n', Ta1)
fprintf('Ganho em regime permanente = %.2f \n', ganho1)

%% Exercicio 01 - Resposta ao degrau unitario

figure(1)

step(G1, 8)
grid on

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Sistema de primeira ordem - Degrau unitario')
legend('Resposta ao degrau unitario', 'Location', 'southeast')

%% Exercicio 01 - Resposta ao degrau de amplitude 2,5

% A = amplitude do novo degrau aplicado
A1 = 2.5;

% Valor final da saida para o novo degrau
valor_final1 = A1*ganho1;

fprintf('Valor final para degrau de amplitude %.1f = %.2f \n', A1, valor_final1)

figure(2)

step(A1*G1, 8)
grid on

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Sistema de primeira ordem - Degrau de amplitude 2,5')
legend('Resposta ao degrau de 2,5', 'Location', 'southeast')

% A constante de tempo define a rapidez do sistema: o polo vale -1/T, entao
% quanto menor T mais afastado da origem fica o polo e mais rapida e a resposta.

% A amplitude do degrau nao altera a constante de tempo nem o polo: ela muda
% apenas o valor final da saida, que passa a ser o ganho multiplicado pela amplitude.

%% Exercicio 02 - Tres sistemas de segunda ordem

% Forma padrao: G(s) = wn^2/(s^2 + 2*zeta*wn*s + wn^2)
% Aqui os numeradores ja garantem ganho unitario em regime permanente

disp('Funcao de transferencia do Sistema A:')
GA = tf(25, [1 3 25])

disp('Funcao de transferencia do Sistema B:')
GB = tf(25, [1 10 25])

disp('Funcao de transferencia do Sistema C:')
GC = tf(25, [1 16 25])

% Vetor de tempo usado na comparacao dos tres sistemas
t2 = 0:0.001:8;

%% Exercicio 02 - Caracteristicas do Sistema A

% Frequencia natural: wn = raiz do termo independente do denominador
wnA = sqrt(25);

% Coeficiente de amortecimento: zeta = coeficiente de s / (2*wn)
zetaA = 3/(2*wnA);

[yA, tA] = step(GA, t2);
valor_finalA = dcgain(GA);

infoA = stepinfo(yA, tA, valor_finalA, 'RiseTimeLimits', limites_subida, ...
    'SettlingTimeThreshold', tolerancia_acomodacao);

disp('Polos do Sistema A:')
disp(pole(GA))

fprintf('Sistema A: wn = %.4f rad/s e zeta = %.4f \n', wnA, zetaA)
fprintf('Sistema A: ganho em regime permanente = %.4f \n', valor_finalA)
fprintf('Sistema A: tempo de acomodacao = %.4f s \n', infoA.SettlingTime)

if zetaA == 0
    disp('Sistema A: resposta nao amortecida')
elseif zetaA < 1
    disp('Sistema A: resposta subamortecida')
elseif zetaA == 1
    disp('Sistema A: resposta criticamente amortecida')
else
    disp('Sistema A: resposta superamortecida')
end

%% Exercicio 02 - Caracteristicas do Sistema B

wnB = sqrt(25);
zetaB = 10/(2*wnB);

[yB, tB] = step(GB, t2);
valor_finalB = dcgain(GB);

infoB = stepinfo(yB, tB, valor_finalB, 'RiseTimeLimits', limites_subida, ...
    'SettlingTimeThreshold', tolerancia_acomodacao);

disp('Polos do Sistema B:')
disp(pole(GB))

fprintf('Sistema B: wn = %.4f rad/s e zeta = %.4f \n', wnB, zetaB)
fprintf('Sistema B: ganho em regime permanente = %.4f \n', valor_finalB)
fprintf('Sistema B: tempo de acomodacao = %.4f s \n', infoB.SettlingTime)

if zetaB == 0
    disp('Sistema B: resposta nao amortecida')
elseif zetaB < 1
    disp('Sistema B: resposta subamortecida')
elseif zetaB == 1
    disp('Sistema B: resposta criticamente amortecida')
else
    disp('Sistema B: resposta superamortecida')
end

%% Exercicio 02 - Caracteristicas do Sistema C

wnC = sqrt(25);
zetaC = 16/(2*wnC);

[yC, tC] = step(GC, t2);
valor_finalC = dcgain(GC);

infoC = stepinfo(yC, tC, valor_finalC, 'RiseTimeLimits', limites_subida, ...
    'SettlingTimeThreshold', tolerancia_acomodacao);

disp('Polos do Sistema C:')
disp(pole(GC))

fprintf('Sistema C: wn = %.4f rad/s e zeta = %.4f \n', wnC, zetaC)
fprintf('Sistema C: ganho em regime permanente = %.4f \n', valor_finalC)
fprintf('Sistema C: tempo de acomodacao = %.4f s \n', infoC.SettlingTime)

if zetaC == 0
    disp('Sistema C: resposta nao amortecida')
elseif zetaC < 1
    disp('Sistema C: resposta subamortecida')
elseif zetaC == 1
    disp('Sistema C: resposta criticamente amortecida')
else
    disp('Sistema C: resposta superamortecida')
end

%% Exercicio 02 - Comparacao das respostas e dos polos

figure(3)

step(GA, GB, GC, t2)
grid on

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Sistemas de segunda ordem - Degrau unitario')
legend('Sistema A (zeta = 0.3)', 'Sistema B (zeta = 1)', ...
    'Sistema C (zeta = 1.6)', 'Location', 'southeast')

figure(4)

pzmap(GA, GB, GC)
grid on

title('Mapa de polos dos tres sistemas')
legend('Sistema A', 'Sistema B', 'Sistema C', 'Location', 'northwest')

%% Exercicio 02 - Escolha do sistema mais adequado

% O Sistema A possui zeta < 1, ou seja, apresenta sobressinal e ja fica fora
% da aplicacao. Restam os sistemas B e C, que nao possuem sobressinal.

if infoB.SettlingTime < infoC.SettlingTime
    disp('Sistema mais adequado: Sistema B')
else
    disp('Sistema mais adequado: Sistema C')
end

% O Sistema B e o mais adequado porque e o unico sem sobressinal que ainda
% chega rapido ao valor final: com zeta = 1 ele esta no limite do amortecimento,
% enquanto o Sistema C, com zeta = 1.6, tem um polo lento perto da origem que
% deixa a resposta bem mais demorada.

%% Exercicio 03 - Dois sistemas de segunda ordem

disp('Funcao de transferencia do Sistema 1:')
Gs1 = tf(16, [1 2.8 16])

disp('Funcao de transferencia do Sistema 2:')
Gs2 = tf(25, [1 6.5 25])

% Vetor de tempo usado na analise dos dois sistemas
t3 = 0:0.001:8;

%% Exercicio 03 - Caracteristicas do Sistema 1

[ys1, ts1] = step(Gs1, t3);
valor_final_s1 = dcgain(Gs1);

% Tempo de atraso: instante em que a resposta atinge 50% do valor final
indice_atraso_s1 = find(ys1 >= 0.5*valor_final_s1, 1);
td_s1 = ts1(indice_atraso_s1);

info_s1 = stepinfo(ys1, ts1, valor_final_s1, 'RiseTimeLimits', limites_subida, ...
    'SettlingTimeThreshold', tolerancia_acomodacao);

% Frequencia natural e coeficiente de amortecimento
wn_s1 = sqrt(16);
zeta_s1 = 2.8/(2*wn_s1);

disp('Polos do Sistema 1:')
disp(pole(Gs1))

fprintf('Sistema 1: valor final = %.4f \n', valor_final_s1)
fprintf('Sistema 1: tempo de atraso = %.4f s \n', td_s1)
fprintf('Sistema 1: tempo de subida = %.4f s \n', info_s1.RiseTime)
fprintf('Sistema 1: tempo de pico = %.4f s \n', info_s1.PeakTime)
fprintf('Sistema 1: valor do primeiro pico = %.4f \n', info_s1.Peak)
fprintf('Sistema 1: maximo sobressinal = %.4f %% \n', info_s1.Overshoot)
fprintf('Sistema 1: tempo de acomodacao = %.4f s \n', info_s1.SettlingTime)
fprintf('Sistema 1: wn = %.4f rad/s e zeta = %.4f \n', wn_s1, zeta_s1)

%% Exercicio 03 - Caracteristicas do Sistema 2

[ys2, ts2] = step(Gs2, t3);
valor_final_s2 = dcgain(Gs2);

indice_atraso_s2 = find(ys2 >= 0.5*valor_final_s2, 1);
td_s2 = ts2(indice_atraso_s2);

info_s2 = stepinfo(ys2, ts2, valor_final_s2, 'RiseTimeLimits', limites_subida, ...
    'SettlingTimeThreshold', tolerancia_acomodacao);

wn_s2 = sqrt(25);
zeta_s2 = 6.5/(2*wn_s2);

disp('Polos do Sistema 2:')
disp(pole(Gs2))

fprintf('Sistema 2: valor final = %.4f \n', valor_final_s2)
fprintf('Sistema 2: tempo de atraso = %.4f s \n', td_s2)
fprintf('Sistema 2: tempo de subida = %.4f s \n', info_s2.RiseTime)
fprintf('Sistema 2: tempo de pico = %.4f s \n', info_s2.PeakTime)
fprintf('Sistema 2: valor do primeiro pico = %.4f \n', info_s2.Peak)
fprintf('Sistema 2: maximo sobressinal = %.4f %% \n', info_s2.Overshoot)
fprintf('Sistema 2: tempo de acomodacao = %.4f s \n', info_s2.SettlingTime)
fprintf('Sistema 2: wn = %.4f rad/s e zeta = %.4f \n', wn_s2, zeta_s2)

%% Exercicio 03 - Comparacao e verificacao dos requisitos

figure(5)

step(Gs1, Gs2, t3)
grid on

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Comparacao entre os dois sistemas de segunda ordem')
legend('Sistema 1 (zeta = 0.35)', 'Sistema 2 (zeta = 0.65)', 'Location', 'southeast')

% Requisitos da aplicacao: sobressinal menor que 10% e acomodacao menor que 1,5 s
if info_s1.Overshoot < 10 && info_s1.SettlingTime < 1.5
    disp('Sistema 1 atende aos requisitos')
else
    disp('Sistema 1 nao atende aos requisitos')
end

if info_s2.Overshoot < 10 && info_s2.SettlingTime < 1.5
    disp('Sistema 2 atende aos requisitos')
else
    disp('Sistema 2 nao atende aos requisitos')
end

% O Sistema 1 tem zeta = 0.35 e por isso oscila bastante: o sobressinal passa
% de 30% e a resposta demora para entrar na faixa de 2% do valor final.

% O Sistema 2 foi o escolhido porque o zeta maior (0.65) reduz o sobressinal
% para menos de 10% e ainda deixa a acomodacao abaixo de 1,5 s, atendendo aos
% dois requisitos ao mesmo tempo.

%% Exercicio 04 - Quatro configuracoes de segunda ordem

% Parametros de cada configuracao
zeta4 = [0.35 0.55 0.70 0.80];
wn4 = [6 5 4 3.2];

% Letras usadas para identificar as configuracoes
letras = ['A' 'B' 'C' 'D'];

% Vetores para guardar as caracteristicas de cada configuracao
Mp4 = zeros(1,4);
Tr4 = zeros(1,4);
Tp4 = zeros(1,4);
Ta4 = zeros(1,4);
Vf4 = zeros(1,4);

% Vetor de tempo usado na comparacao das quatro respostas
t4 = 0:0.001:8;

figure(6)

for i = 1:4
    % Forma padrao de segunda ordem
    G = tf(wn4(i)^2, [1 2*zeta4(i)*wn4(i) wn4(i)^2]);

    [y4, tempo4] = step(G, t4);
    Vf4(i) = dcgain(G);

    info4 = stepinfo(y4, tempo4, Vf4(i), 'RiseTimeLimits', limites_subida, ...
        'SettlingTimeThreshold', tolerancia_acomodacao);

    Mp4(i) = info4.Overshoot;
    Tr4(i) = info4.RiseTime;
    Tp4(i) = info4.PeakTime;
    Ta4(i) = info4.SettlingTime;

    fprintf('Configuracao %c: zeta = %.2f e wn = %.1f rad/s \n', letras(i), zeta4(i), wn4(i))
    disp('Polos:')
    disp(pole(G))
    fprintf('Configuracao %c: maximo sobressinal = %.4f %% \n', letras(i), Mp4(i))
    fprintf('Configuracao %c: tempo de subida = %.4f s \n', letras(i), Tr4(i))
    fprintf('Configuracao %c: tempo de pico = %.4f s \n', letras(i), Tp4(i))
    fprintf('Configuracao %c: tempo de acomodacao = %.4f s \n', letras(i), Ta4(i))
    fprintf('Configuracao %c: valor final = %.4f \n\n', letras(i), Vf4(i))

    step(G, t4)
    hold on
end

grid on
hold off

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Quatro configuracoes de segunda ordem')
legend('A (zeta = 0.35)', 'B (zeta = 0.55)', 'C (zeta = 0.70)', ...
    'D (zeta = 0.80)', 'Location', 'southeast')

%% Exercicio 04 - Verificacao dos requisitos e escolha

% Valor inicial alto para procurar o menor tempo de subida
menor_subida = 1000;
melhor = 0;

for i = 1:4
    if Mp4(i) < 10 && Ta4(i) < 1.5
        fprintf('Configuracao %c atende aos requisitos \n', letras(i))

        if Tr4(i) < menor_subida
            menor_subida = Tr4(i);
            melhor = i;
        end
    else
        fprintf('Configuracao %c nao atende aos requisitos \n', letras(i))
    end
end

fprintf('Configuracao escolhida: %c (tempo de subida = %.4f s) \n', letras(melhor), menor_subida)

% Nos graficos as configuracoes A e B sobem bem rapido, mas ultrapassam o valor
% final com um sobressinal acima de 10%, o que ja as elimina da aplicacao.

% Entre as configuracoes que ficaram (C e D), a C chega ao valor final antes,
% porque tem wn maior; a D quase nao oscila, mas a resposta fica mais lenta.

%% Exercicio 05 - Equipamento A (primeira ordem)

% G_A(s) = 2/(1,2s + 1)
K5 = 2;
T5 = 1.2;

disp('Funcao de transferencia do Equipamento A:')
GeqA = tf(K5, [T5 1])

% Ganho em regime permanente
ganho_A = dcgain(GeqA);

% Tempo de subida e de acomodacao para sistemas de primeira ordem
Tr_A = 2.2*T5;
Ta_A = 4*T5;

disp('Polo do Equipamento A:')
disp(pole(GeqA))

fprintf('Equipamento A: ganho em regime permanente = %.4f \n', ganho_A)
fprintf('Equipamento A: valor final para degrau unitario = %.4f \n', ganho_A)
fprintf('Equipamento A: tempo de subida = %.4f s \n', Tr_A)
fprintf('Equipamento A: tempo de acomodacao = %.4f s \n', Ta_A)

%% Exercicio 05 - Equipamento B (segunda ordem)

% G_B(s) = 32/(s^2 + 5,6s + 16)
disp('Funcao de transferencia do Equipamento B:')
GeqB = tf(32, [1 5.6 16])

% Vetor de tempo usado na comparacao dos dois equipamentos
t5 = 0:0.001:8;

[yB5, tB5] = step(GeqB, t5);
ganho_B = dcgain(GeqB);

info_B5 = stepinfo(yB5, tB5, ganho_B, 'RiseTimeLimits', limites_subida, ...
    'SettlingTimeThreshold', tolerancia_acomodacao);

% Frequencia natural e coeficiente de amortecimento
wn_B5 = sqrt(16);
zeta_B5 = 5.6/(2*wn_B5);

disp('Polos do Equipamento B:')
disp(pole(GeqB))

fprintf('Equipamento B: ganho em regime permanente = %.4f \n', ganho_B)
fprintf('Equipamento B: valor final para degrau unitario = %.4f \n', ganho_B)
fprintf('Equipamento B: tempo de subida = %.4f s \n', info_B5.RiseTime)
fprintf('Equipamento B: tempo de acomodacao = %.4f s \n', info_B5.SettlingTime)
fprintf('Equipamento B: wn = %.4f rad/s e zeta = %.4f \n', wn_B5, zeta_B5)
fprintf('Equipamento B: tempo de pico = %.4f s \n', info_B5.PeakTime)
fprintf('Equipamento B: valor do primeiro pico = %.4f \n', info_B5.Peak)
fprintf('Equipamento B: maximo sobressinal = %.4f %% \n', info_B5.Overshoot)

%% Exercicio 05 - Comparacao para degrau unitario

figure(7)

step(GeqA, GeqB, t5)
grid on

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Equipamentos A e B - Degrau unitario')
legend('Equipamento A (primeira ordem)', 'Equipamento B (segunda ordem)', ...
    'Location', 'southeast')

%% Exercicio 05 - Comparacao para degrau de amplitude 1,5

% A5 = amplitude do novo degrau aplicado
A5 = 1.5;

valor_final_A5 = A5*ganho_A;
valor_final_B5 = A5*ganho_B;

fprintf('Equipamento A: valor final para degrau de %.1f = %.4f \n', A5, valor_final_A5)
fprintf('Equipamento B: valor final para degrau de %.1f = %.4f \n', A5, valor_final_B5)

figure(8)

step(A5*GeqA, A5*GeqB, t5)
grid on

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Equipamentos A e B - Degrau de amplitude 1,5')
legend('Equipamento A (primeira ordem)', 'Equipamento B (segunda ordem)', ...
    'Location', 'southeast')

%% Exercicio 05 - Comentarios finais

% Rapidez: o Equipamento B e bem mais rapido, porque seus polos estao mais
% afastados da origem do que o polo do Equipamento A, que fica em -0,8333.

% Sobressinal: o Equipamento A nao apresenta sobressinal por ser de primeira
% ordem, enquanto o Equipamento B tem zeta = 0,7 e ultrapassa um pouco o valor
% final antes de estabilizar.

% Regime permanente: os dois equipamentos possuem o mesmo ganho em regime
% permanente, entao terminam no mesmo valor final para a mesma entrada; muda
% apenas o comportamento transitorio ate chegar la.