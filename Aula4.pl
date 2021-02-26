/*Ex1*/

frog(L,[H|T]) :- L >= H,frog2(L,[H|T],T).
frog2(_,_,[]) :- !.
frog2(L,[H|T],[X|Xs]) :- L>=X-H,frog2(L,T,Xs).

/*Ex2*/

somaPar([H|T],L) :- verifica(H,T,L),!;somaPar(T,L).
verifica(X,[H|_],L) :- X + H =:= L,!.
verifica(X,[_|T],L) :- verifica(X,T,L).

/*Ex3*/

sss([H|T],L) :- soma(H,T,L);aux(H,T,L);sss(T,L).
soma(S,_,L) :- S =:= L,!.
soma(S,[H|T],L) :- S2 is S+H,soma(S2,T,L).
aux(H,[_|T],L) :- soma(H,T,L);aux(H,T,L).

/*Ex4*/

intercala(L, [], L):- !.
intercala([], L, L):- !.
intercala([X|L1], [Y|L2], [Y,X|L3]):- X > Y,intercala(L1, L2, L3).
intercala([X|L1], [Y|L2], [X,Y|L3]):- intercala(L2,L1,L3).
