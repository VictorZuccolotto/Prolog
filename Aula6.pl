
:- use_module(library(clpb)).

%%Ex1
e1(A, B, C) :- sat(A =:= ((A=:=0) + (B =:= 0) + (C =:= 0))).
e2(A, B, C) :- sat(A =:= ((A =:= 0) * (B =:= 0) * (C =:= 0))), sat(B =:= (((A =:= 1) * (B =:= 0) * (C =:= 0)) + ((A =:= 0) * (B =:= 1) * (C =:= 0)) + ((A =:= 0) * (B =:= 0) * (C =:= 1)))).
e3(C) :- sat(A =:= (B =:= 0)), sat(B =:= (A =:= C)).

%%Ex2
super([H|T]):- super2(H,T).
super2(_,[]):- !.
super2(S,[H|T]):- H>=S,super2(S+H,T).

%%Ex3
%a
pertenceinter([],_):- !,fail.
pertenceinter([[H,H2]|_],N):- N>=H,H2>=N,!.
pertenceinter([_|T],N):- pertenceinter(T,N).

%b
chama(Lst,Nmr):- insere5(Lst,Nmr,Z).

insere5([],_,Z):- junta(Z,X),!.
insere5([[H1,H2]|T],N,Z):- N=:=H1-1,append(Z,[[N,H2]],Z2),insere5(T,N,Z2).
insere5([[H1,H2]|T],N,Z):- N=:=H2+1,append(Z,[[H1,N]],Z2),insere5(T,N,Z2).
insere5([[H1,H2]|T],N,Z):- N>=H1,H2>=N,append(Z,[[H1,H2]],Z2),insere5(T,N,Z2).
insere5([[H1,H2],[X1,X2]|T],N,Z):- N>H2,X1>N,append(Z,[[H1,H2],[N,N]],Z2),insere5(T,N,Z2).
insere5([[H1,H2]|T],N,Z):- append(Z,[[H1,H2]],Z2),insere5(T,N,Z2).

junta([X],Z):- append(Z,[X],Z2),write(Z2),!.
junta([[H1,H2],[J1,J2]|T],Z):- H2+1=:=J1,append(Z,[H1,J2],Z2),junta([Z2|T],Z).
junta([[H1,H2],[J1,J2]|T],Z):- H2=:=J1,append(Z,[H1,J2],Z2),junta([Z2|T],Z).
junta([[H1,H2],[J1,J2]|T],Z):- append(Z,[[H1,H2]],Z2),junta([[J1,J2]|T],Z2