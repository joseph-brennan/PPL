man(anakin_skywalker).
man(luke_skywalker).
man(ben_skywalker).
man(ceden_skywalker).
man(val_skywalker).
man(han_solo).
man(anakin_solo).
man(bail_solo).
man(jacen_solo).
man(jagged_fel).
man(adan_fel).

woman(padme_skywalker).
woman(mara_skywalker).
woman(sara_skywalker).
woman(gwyn_skywalker).
woman(leia_solo).
woman(tahiri_solo).
woman(tenelka_solo).
woman(jaina_fel).
woman(rhea_fel).

parent(anakin_skywalker,luke_skywalker).
parent(anakin_skywalker,leia_solo).

parent(padme_skywalker,luke_skywalker).
parent(padme_skywalker,leia_solo).

parent(luke_skywalker,ben_skywalker).
parent(luke_skywalker,sara_skywalker).
parent(luke_skywalker,ceden_skywalker).
parent(luke_skywalker,gwyn_skywalker).
parent(luke_skywalker,val_skywalker).

parent(mara_skywalker,ben_skywalker).
parent(mara_skywalker,sara_skywalker).
parent(mara_skywalker,ceden_skywalker).
parent(mara_skywalker,gwyn_skywalker).
parent(mara_skywalker,val_skywalker).

parent(leia_solo,anakin_solo).
parent(leia_solo,jacen_solo).
parent(leia_solo,jaina_fel).

parent(han_solo,anakin_solo).
parent(han_solo,jacen_solo).
parent(han_solo,jaina_fel).

parent(anakin_solo,bail_solo).
parent(tahiri_solo,bail_solo).


father(F,C):-man(F),parent(F,C).
mother(M,C):-woman(M),parent(M,C).

is_father(F):-father(F,_).
is_mother(M):-mother(M,_).

son(S,P):-man(S),parent(P,S).
daughter(D,P):-woman(D),parent(P,D).

siblings(A,B):-parent(P,A),parent(P,B),A\=B.
%siblings have at least one common parent
%the test A\=B preserves that siblings are different persons

married(X,Y):-parent(X,Z),parent(Y,Z),X\=Y.

full_siblings(A,B):-
    parent(F,A),parent(F,B),
    parent(M,A),parent(M,B),
    A\=B,F\=M.
% full siblings have commmon parents (both)
%the tests F\=M preserves that full sibligns have two different parenets
%(fatehr and mother)

full_siblings2(A,B):-
    father(F,A),father(F,B),
    mother(M,A),mother(M,B),
    A\=B.

uncle(U,N):-man(U),siblings(U,P),parent(P,N).
aunt(A,N):-woman(A),siblings(A,P),parent(P,N).

grand_parent(G,N):-parent(G,X),parent(X,N).

human(H):-man(H).
human(H):-woman(H).

descenent(D,A):-parent(A,D).
descendent(D,A):-parent(P,D),descendent(P,A).

ancestor(A,D):-descendent(D,A).
