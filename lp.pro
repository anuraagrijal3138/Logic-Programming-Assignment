sum-up-numbers-simple([], 0). %exit case

sum-up-numbers-simple([H|T] , N):-
    number(H),
    sum-up-numbers-simple(T, TempSum),
    N is H + TempSum.

sum-up-numbers-simple([H|T] , N):-
    \+ number(H),
    sum-up-numbers-simple(T, TempSum),
    N is TempSum.




sum-up-numbers-general([], 0). %exit case

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

ignore-char([], []).%exit case

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
great-list(_, [], []).

great-list(A, [H|T1], [H|T2]):-
    H > A,
    great-list(A, T1, T2).

great-list(A, [H|T], Z):-
    H =< A,
    great-list(A, T, Z).



min-above-min(L1, L2, A):-
    ignore-char(L2, IgnoreL2),
    find-min(IgnoreL2, Minimum),
    ignore-char(L1, IgnoreL1),
    great-list(Minimum, IgnoreL1, FinalList),
    find-min(FinalList, A).

flatten-list([], []).%exit case

flatten-list([H|T], A):-
    \+(is_list(H)),
    flatten-list(T, Temp),
    append([H], Temp, A).

flatten-list([H|T], A):-
    is_list(H),
    flatten-list(H, Temp),
    flatten-list(T, Temp2),
    append(Temp, Temp2, A).


get-common-elements([],_,[]).

get-common-elements([H|T], Temp , A):-
	member(H, Temp),
	get-common-elements(T, Temp, Temp2),
	append([H], Temp2, A).

get-common-elements([H|T], Temp, A):-
	\+ (member(H, Temp)),
	get-common-elements(T, Temp  , A).


common-unique-elements(L1, L2, A):-
	flatten-list(L1, Temp1),
	flatten-list(L2, Temp2),
	get-common-elements(Temp1, Temp2 , A).




