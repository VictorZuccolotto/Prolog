p(1).
p(2).
p(3).
p(4).
p(5).
/*p(6).
p(7).
p(8).
*/

cavalo([L1,C1],[L2,C2]) :-
    p(L1),p(L2),p(C1),p(C2), L2 is L1 +1, C2 is C1+2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 +1, C2 is C1-2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 -1, C2 is C1+2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 -1, C2 is C1-2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 +1, C2 is C1+2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 +1, C2 is C2-2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 -1, C2 is C1+2;
    p(L1),p(L2),p(C1),p(C2), L2 is L1 -1, C2 is C1-2.

peao([L1,C1],[L2,C2]) :-
    p(L1),p(L2),p(C1),p(C2), L2 is L1 -1, C2 is C1;
    p(L1),p(L2),p(C1),p(C2), L2 is L1, C2 is C1.

ataca(_,_,_,_,0) :- !,fail.
ataca([Lp1,Cp1],[Lp2,Cp2],[Lc1,Cc1],[Lc2,Cc2],N) :-
    peao([Lp1,Cp1],[Lp2,Cp2]),cavalo([Lc1,Cc1],[Lc2,Cc2]),Lp2 =:= Lc2, Cp2 =:= Cc2;
    N2 is N-1,ataca([Lp2,Cp2],[_,_],[Lc2,Cc2],[_,_],N2).

kvalo([L1,C1],Lx,N) :- cavalo([L1,C1],[L2,C2]),Lx is L1+1, Cx is C1,kbalo([Lx,Cx],[L2,C2],N).
kbalo(_,_,0) :- !,fail.
kbalo([Lx,Cx],[L2,C2],_) :- Lx=:=L2, Cx=:=C2,!.
kbalo([Lx,Cx],[L2,C2],N) :- cavalo([L2,C2],[L3,C3]),N2 is N-1,kbalo([Lx,Cx],[L3,C3],N2).


/*tamanho([_|T],X) :- X2 = 0,tamanho2(T,X2+1),X is X2.
tamanho2([],_) :- !.
tamanho2([_|T],X) :- X2 is X+1,tamanho2(T,X2).*/

tamanho([_|T],X) :- X2 is 0,tamanho2(T,X2+1),X is X2.
tamanho([_|T],X) :- tamanho2(T,1),X is 0.
tamanho([_|T],0) :- tamanho2(T,1).
