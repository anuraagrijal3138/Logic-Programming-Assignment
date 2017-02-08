sum-up-numbers-simple([], 0).

sum-up-numbers-simple([H|T] , N):-
    number(H),
    sum-up-numbers-simple(T, TempSum),
    N is H + TempSum.

sum-up-numbers-simple([H|T] , N):-
    \+ number(H),
    sum-up-numbers-simple(T, TempSum),
    N is TempSum.
