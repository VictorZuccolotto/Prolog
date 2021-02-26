/*Ex1*/
famoso(jorg).
famoso(niltin).
rico(clovis).
rico(vapo).

eh_feliz(H) :- famoso(H);rico(H).

/*Ex2*/
barb(guto).
barb(ze).

vai_barb(X) :- not(barb(X)).

/*Ex3*/
palavras(bico,b,i,c,o).
palavras(asas,a,s,a,s).
palavras(bola,b,o,l,a).
palavras(ovos,o,v,o,s).


cruzada(H1,H2,V1,V2) :- palavras(H1,H1L1,_,_,H1L4),
	palavras(H2,H2L1,_,_,H2L4),
	palavras(V1,V1L1,_,_,V1L4),
	palavras(V2,V2L1,_,_,V2L4),
	H1L1 == V1L1,
	H1L4 == V2L1,
	H2L1 == V1L4,
	H2L4 == V2L4,
	H1 \= H2, H1 \= V1, H1 \= V2,
	H2 \= V1, H2 \= V2,
	V1 \= V2.

/*Ex4*/
ladrao(maikojecks).
ladrao(timyturne).

likes(timyturne,magica).
likes(maikojecks,musica).

likes(nelso,magica).
likes(negoney,musica).

gosto(musica).
gosto(magica).

poderoubar(X,Y) :- ladrao(X), likes(X,Z), likes(Y,Z), gosto(Z).


/*Ex5*/

influencer(maikojecks).
/*influencer(a).*/
likes(a,musica).



likes(X,Y) :- not(influencer(X)), influencer(A), likes(A,Y), influencer(B), likes(B,Y), A \== B.
