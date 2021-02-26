%Ex3
intercala([],[],[],[]):-!.
intercala(X,[],[],X):-intercala([],[],[],[]),!.
intercala([],Y,[],Y):-intercala([],[],[],[]),!.
intercala([],[],Z,Z):-intercala([],[],[],[]),!.

intercala([],[H2|Y],[H3|Z],[H2|R]):- H2=<H3,intercala([],Y,[H3|Z],R),!.
intercala([],[H2|Y],[H3|Z],[H3|R]):- H3=<H2,intercala([],[H2|Y],Z,R),!.

intercala([H1|X],[],[H3|Z],[H1|R]):- H1=<H3,intercala(X,[],[H3|Z],R),!.
intercala([H1|X],[],[H3|Z],[H3|R]):- H3=<H1,intercala([H3|X],[],Z,R),!.

intercala([H1|X],[H2|Y],[],[H1|R]):- H1=<H2,intercala(X,[H2|Y],[],R),!.
intercala([H1|X],[H2|Y],[],[H2|R]):- H2=<H1,intercala([H1|X],Y,[],R),!.

intercala([H1|X],[H2|Y],[H3|Z],[H1|R]):- H1=<H2,H1=<H3,intercala(X,[H2|Y],[H3|Z],R),!.
intercala([H1|X],[H2|Y],[H3|Z],[H2|R]):- H2=<H1,H2=<H3,intercala([H1|X],Y,[H3|Z],R),!.
intercala([H1|X],[H2|Y],[H3|Z],[H3|R]):- H3=<H2,H3=<H1,intercala([H1|X],[H2|Y],Z,R),!.


%Ex4
div9(X):- somaDigito(X,X2),somaDigito(X2,9),!.

somaDigito(X,Y) :-X>=10, X2 is X//10, somaDigito(X2,Y2), Y is mod(X,10)+Y2.
somaDigito(X,X) :-X<10.

%Ex5
div11(N):- lista(N,X),parimpar(X,Par,Impar),soma(Par,Rp),soma(Impar,Ri),verifica(Rp,Ri),!.

lista(X,[X]):- X<10.
lista(X,Y):- X>=10,X2 is X//10, lista(X2,Y2),N is mod(X,10),append(Y2,[N],Y).

parimpar([],[],[]):- !.
parimpar([H],[H|P],I):- parimpar([],P,I).
parimpar([H,H2|T],[H|P],[H2|I]):- parimpar(T,P,I).

soma([H],H):- !.
soma([H,H2|T],Z):- S is H+H2, soma([S|T],Z).

verifica(Par,Impar):- Impar-Par=:=0;mod(Impar-Par,11)=:=0.

%Ex6
%a
uniao([],[],[]):- !.
uniao(X,[],X):- !.
uniao([],X,X):- !.


%Intervalo dentro do outro
uniao([H1,L1],[H2,L2],[H2,L2]):- contemI(H1,[H2,L2]),contemI(L1,[H2,L2]),!.
uniao([H1,L1],[H2,L2],[H1,L1]):- contemI(H2,[H1,L1]),contemI(L2,[H1,L1]),!.

%intervalos misto
uniao([H1,L1],[H2,L2],[H2,L1]):- contemI(H1,[H2,L2]),L1>L2,!.
uniao([H1,L1],[H2,L2],[H1,L2]):- contemI(H2,[H1,L1]),L2>L1,!.

%intervalo menor que o outro
uniao([H1,L1],[H2,L2],[[H1,L1],[H2,L2]]):- L1<H2,!.
uniao([H1,L1],[H2,L2],[[H2,L2],[H1,L1]]):- L2<H1,!.


contemI(N,[I,F]):- I=<N,N=<F.

expande([I,I],[I]):- !.
expande([I,F],[I|T]):- P is I+1, expande([P,F],T).

%b
diferenca(X,Y,Z):- expande(X,Lst),expande(Y,Lst2),analisa(Lst,Lst2,Z),!.

analisa([],_,[]):- !.
analisa([H|T],Lst2,Z):- member(H,Lst2),analisa(T,Lst2,Z).
analisa([H|T],Lst2,[H|Z]):- analisa(T,Lst2,Z).

%c
interseccao(X,Y,Z):- expande(X,Lst),expande(Y,Lst2),sec(Lst,Lst2,Z),!.

sec([],_,[]):- !.
sec([_,[],[]):- !.
sec([H|T],Lst2,[H|Z]):- member(H,Lst2),sec(T,Lst2,Z).
sec([_|T],Lst2,Z):- sec(T,Lst2,Z).
