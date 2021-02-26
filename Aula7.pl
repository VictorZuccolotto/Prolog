contemI(N,[I,F]):- I=<N,N=<F.

expande([I,I],[I]):- !.
expande([I,F],[I|T]):- P is I+1, expande([P,F],T).

linear([[I,F]],L):- expande([I,F],L).
linear([H|T],L):- expande(H,T1),linear(T,T2),append(T1,T2,L).


linearIntervalar([X],[[X,X]]):- !.
linearIntervalar([H1],[[_,H1]]):- !.


linearIntervalar([H1,H2|T],[[I,F]|Ti]):- H1>=I,H2 is H1+1,
    linearIntervalar([H2|T],[[I,F]|Ti]),!.

linearIntervalar([H1,H2|T],[[_,H1],[H2,F]|Ti]):- H2>H1+1,
    linearIntervalar([H2|T],[[H2,F]|Ti]).


li([H|T],[[H,F]|Ti]):- linearIntervalar(T,[[H,F]|Ti]).


%A
%lista vazia
remover(_,[],[]):- !.
%lista normal
remover(N,Lst,Lst4):- linear(Lst,Lst2),del(N,Lst2,Lst3),li(Lst3,Lst4).


del(N,[N],[]).
del(N,[N|T],T):- !.
del(N,[H|T],[H|T2]):- del(N,T,T2).


%B
uniao([],[],[]):- !.
uniao(X,[],X):- !.
uniao([],X,X):- !.


%Intervalo dentro do outro
uniao([[H1,L1]|T],[[H2,L2]|T2],T3):- contemI(H1,[H2,L2]),contemI(L1,[H2,L2]),
    uniao(T,[[H2,L2]|T2],T3).
uniao([[H1,L1]|T],[[H2,L2]|T2],T3):- contemI(H2,[H1,L1]),contemI(L2,[H1,L1]),
    uniao([[H1,L1]|T],T2,T3).

%intervalos misto
uniao([[H1,L1]|T],[[H2,L2]|T2],T3):- contemI(H1,[H2,L2]),L1>L2,uniao([[H2,L1]|T],T2,T3).
uniao([[H1,L1]|T],[[H2,L2]|T2],T3):- contemI(H2,[H1,L1]),L2>L1,uniao(T,[[H1,L2]|T2],T3).

%intervalo menor que o outro
uniao([[H1,L1]|T],[[H2,L2]|T2],[[H1,L1]|T3]):- L1<H2,uniao(T,[[H2,L2]|T2],T3).
uniao([[H1,L1]|T],[[H2,L2]|T2],[[H2,L2]|T3]):- L2<H1,uniao([[H1,L1]|T],T2,T3).

uniaoL(X,Y,Z):- uniao(X,Y,Z1),linear(Z1,Z2),li(Z2,Z).



%C
intersec(_,[],[]) :- !.
intersec([],_,[]):- !.
intersec(X,Y,L) :- expande(X,Z1), linear(Y,Z2), inter(Z2,Z1,L).

inter([],_,[]):- !.
inter([H|T],Lst,[H|Z]):- member(H,Lst),inter(T,Lst,Z).
inter([_|T],Lst,Z):- inter(T,Lst,Z).
