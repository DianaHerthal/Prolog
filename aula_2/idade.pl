idade(gustavo, 26).
idade(mateus, 17).
idade(sergio, 15).
idade(maria, 26).
idade(luana, 20).
idade(lucas, 30).
idade(juliana, 20).
idade(luciana, 13).
maior(X) :- idade(X, Y), write("Encontrado alvo com idade… "), Y>=18, write("Encontrado alvo maior de idade!").
