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



find-min([A], A).

find-min([H|T], Min):-
    find-min(T, Tmin),
    Min is min(H, Tmin).

%returns a list greater than a given alue
great-list([], _, []).

great-list([H|T1], A, [H|T2]):-
    H > A,
    great-list(T1, A, T2).

great-list([H|T], A, Z):-
    H =< A,
    great-list(T, A, Z).






