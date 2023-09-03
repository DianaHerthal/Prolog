pai(waldemar, gustavo).
pai(joao, waldemar).
pai(raimundo, jane).
pai(waldemar, maira).
mae(jane, gustavo).
mae(jane, maira).
avo(X, Y) :- (pai(X, W), pai(W, Y)) ; (pai(X, W), mae(W, Y)).
irmao(X, Y) :- ((pai(W, X), pai(W, Y)) ; (mae(W, X), mae(W, Y))), X\==Y.
