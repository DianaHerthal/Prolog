idade(gustavo, 26).
idade(mateus, 17).
idade(maria, 26).
idade(luana, 20).
idade(lucas, 30).
idade(juliana, 20).
maior(X) :- idade(X, Y), Y>=18.
mesmaidade(X, Y) :- idade(X, W), idade(Y, J), W==J, X\==Y.