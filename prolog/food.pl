main_protein(steak).
main_protein(lamb).
main_protein(chicken).
main_protein(fish).

breakfast_protein(eggs).
breakfast_protein(bacon).
breakfast_protein(sausage).
breakfast_protein(ham).
breakfast_protein(chorizo).

slice_meat(ham).
slice_meat(turky).

main_drink(cider).
main_drink(beer).
main_drink(water).
main_drink(soda).

breakfast_drink(milk).
breakfast_drink(orang_juice).

grain(bread).
grain(biscets).
grain(rice).
grain(pasta).

cheese(cheder).
cheese(monerray).
cheese(provolone).



bread(slice_white_bread).
bread(slice_wheat_bread).
bread(slice_sourdough_bread).

dessert(chocolate).
dessert(candy).
dessert(cake).

flavor(spicy).
flavor(sweet).
flavor(savory).

vegie_fruit(apple).
vegie_fruit(mushum).
vegie_fruit(pizza).
vegie_fruit(cail).

snack(jerky).
snack(trail_mix).

dish(ommolet):-
    breakfast_protein(eggs),
    vegie_fruit(V),
    flavor(F),
    breakfast_drink(D).

dish(sandwhich):-
    bread(B),
    slice_meat(M),
    spread(S),
    cheese(C).






drink(D):-main_drink(D).
drink(D):-breakfast_drink(D).

protein(M):-main_protein(M).
protein(M):-breakfast_protein(M).

breakfast(D,P,G):-
    breakfast_drink(D),
    breakfast_protein(P),
    grain(G).

breakfast(V, D, G):-
    vegie_fruit(V),
    breakfast_drink(D),
    grain(G).
    
breakfast(D,P,G,F,V):-
    breakfast_drink(D),
    breakfast_protein(P),
    grain(G),
    flavor(F),
    vegie_fruit(V).

dinner(P,D,G):-
    protein(P),
    drink(D),
    grain(G).
