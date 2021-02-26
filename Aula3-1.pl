/*EX1*/

somaDigito(X,X) :- X<10.
somaDigito(X,Y) :- X>=10, X2 is X//10, somaDigito(X2,Y2), Y is mod(X,10)+Y2.

/*EX2*/

criptograma(A,B,C,A,X,A,C,B) :-
    digito(A),digito(B), digito(C),digito(X),
    X is 3,
    A>0,
    A=\= B, A =\= C,
    B =\= C,
    T1 is A*100 + B*10 + C,
    T2 is A*10 + X,
    T3 is A*100 + C*10 + B,
    T3 is T1 + T2.

digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).

/*EX3*/
assombroso(1).
assombroso(N) :- mod(N,2) =:= 0,N2 is N/2, assombroso(N2);mod(N,2) =\= 0,N2 is N*3+1, assombroso(N2).

/*EX4*/
ehTriangular(1,1).
ehTriangular(N,T) :- T2 is T-N,N2 is N-1,N2>0, ehTriangular(N2,T2).

/*EX5*/

div7(N) :- R is mod(N,10), Q is N//10, N2 is Q-(R*2), mod(N2,7) =:= 0.


/*EX6*/


busca_fator(N,F) :- N mod F =:= 0,!.

busca_fator(N,F) :- F*F < N, Fp is F + 1, busca_fator(N,Fp).

tem_fator(N) :- busca_fator(N,2).

eh_primo(N) :- N<2,!,fail.

eh_primo(2) :- !.

eh_primo(N) :- tem_fator(N),!,fail.

eh_primo(_).

conjectura(N) :- mod(N,2) =:= 0, N>=4,X is 2, conjec(N,X).

conjec(N,X) :- eh_primo(X),X+X =:= N.
conjec(N,X) :- X+X>N,!,fail.
conjec(N,X) :- X2 is X + 1,conjec(N,X2).



teste(X,Z) :- Z+Z =:= X.
teste(X,Z) :- Z2 is Z+1, Z2>X,!,fail.
teste(X,Z) :- Z2 is Z+1,teste(X,Z2).

