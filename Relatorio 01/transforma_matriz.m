function B = transforma_matriz(A, B)
    [linhas, colunas] = size(A);
    for j = 1:linhas
        for i = 1:colunas
            if A(j,i) >= 5
                B(j,i) = A(j,i) * 2 * exp(1);
            else
                B(j,i) = A(j,i) * 2;
            end
        end
    end
end