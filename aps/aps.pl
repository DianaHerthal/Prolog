:-dynamic duda_possui/1.
:- dynamic pegar/1.
:-dynamic local_duda/1.
:- dynamic ir_para/1.
local_duda(patio).

acessivel(patio, floresta).
acessivel(patio, casa).
acessivel(patio, lagoa).
acessivel(patio, cemiterio).
acessivel(patio, galinheiro).
acessivel(patio, armazem).
acessivel(casa, patio).
acessivel(lagoa, patio).
acessivel(armazem, patio).
acessivel(cemiterio, patio).
acessivel(galinheiro, patio).
acessivel(floresta, patio).


finalizado:-
    local_duda(galinheiro),
    duda_possui(bessy),
    write("Final Feliz"), nl,
    write("Bessy foi capturada e dona Lurdes Agradece."), nl,
    write("Fim de jogo").


finalizado:-
    local_duda(cemiterio),
    duda_possui(rifle),
    duda_possui(bessy),
    duda_possui(municao),
    write("Final Mais Legal"), nl,
    write("Duda mata Bessy e a enterra"), nl,
    write("Fim de jogo.").


rodar:- finalizado.
rodar:- read(X), call(X), rodar.
rodar:- read(X), call(X), rodar.

ir_para(X):-
    X == casa, acessivel(X,Y),
    not(duda_possui(banho)),nl,assert(local_duda(Y)),
    write("voce precisa tomar um banho"), nl.
ir_para(X):-
    X == casa,
    acessivel(X,Y), (duda_possui(banho)),nl,
    assert(local_duda(X)),
    write("Chegou na casa da Dona Lurdes"), nl.

ir_para(X):-
    X == casa,
    not(acessivel(X,Y)), (duda_possui(banho)),nl,
    write("Precisa passar pelo patio"), nl.

ir_para(X):-
    X == patio, acessivel(Y,X), retract(local_duda(Y)),
    assert(local_duda(X)), nl,
    write("voce esta no patio"),nl.

ir_para(X):-
    X \== patio, not(local_duda(patio)),nl,
    write("voce precisa passar pelo patio antes"),nl.

ir_para(X):-
    X \== patio,
    local_duda(patio),acessivel(X,Y),
    retract(local_duda(Y)), assert(local_duda(X)),nl,
    write("Voce chegou no seu destino "), write(X),nl.


pegar(X):-
    X == banho,
    local_duda(lagoa), assert(duda_possui(X)),
    write("Você tomou banho, que cheirosinho").

pegar(X):-
    X == rede,
    local_duda(casa),retract(duda_possui(banho)), assert(duda_possui(rede)),
    write("Voce pegou a rede, agora pegue a Bessy").

pegar(X):-
    X == rifle,
    local_duda(casa), assert(duda_possui(X)),
    write("Você pegou um rifle, TEI TEI NELES").

pegar(X):-
    X == bessy,
    local_duda(floresta),duda_possui(rifle),
    duda_possui(municao),assert(duda_possui(X)),
    write("Você capturou a bessy, Vitóooooooria").

pegar(X):-
    X == bessy,
    local_duda(floresta),duda_possui(rede), assert(duda_possui(X)),
    write("Pegou a safada da bessy, boa").

pegar(X):-
    X == municao,
    local_duda(armazem),assert(duda_possui(municao)),
    write("você pegou as balas, bora dale").

pegar(X):-
    X == banho,
    not(local_duda(lago)),
    write("local errado pra banho meu chapa").

pegar(X):-
    X == municao,
    not(local_duda(armazem)),
    write("Opa Opa, local errado, hora errada").
pegar(X):-
    X == bessy,
    not(local_duda(floresta)),
    write("League of Bessy não pode ser concluido").
pegar(X):-
    X == rede,
    not(local_duda(casa)),
    write("Opa Opa, local errado, hora errada").














