sum-up-numbers-simple([], 0).

sum-up-numbers-simple([H|T] , N):-
    number(H),
    sum-up-numbers-simple(T, TempSum),
    N is H + TempSum.

sum-up-numbers-simple([H|T] , N):-
    \+ number(H),
    sum-up-numbers-simple(T, TempSum),
    N is TempSum.




sum-up-numbers-general([], 0).

sum-up-numbers-general([H|T], N):-
    number(H),
    sum-up-numbers-general(T, TempSum),
    N is H + TempSum.

sum-up-numbers-general([H|T], N):-
    is_list(H),
    sum-up-numbers-general(H, TempSum),
    sum-up-numbers-general(T, TempSum2),
    N is TempSum + TempSum2.


sum-up-numbers-general([H|T], N):-
    \+ number(H),
    \+ is_list(H),
    sum-up-numbers-general(T, TempSum),
    N is TempSum.


%ignors characters in the given list

ignore-char([], []).

ignore-char([H|T], [H|Z]):-
    number(H),
    ignore-char(T, Z).

ignore-char([H|T], Z):-
    \+ number(H),
    ignore-char(T, Z).


find-min([H|T], Min):-



