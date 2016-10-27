%%%-------------------------------------------------------------------
%%% @author Puneet Sharma
%%% @copyright (C) 2016, Stevens Institute of Technology
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2016 14:09
%%%-------------------------------------------------------------------
-module(basic).
-author("Puneet Sharma").

%% API
-export([mult/2, double/1, distance/2, basicand/2, basicor/2, basicnot/1, fibonacci/1, fibtail/4, fibonacciTR/1, sum/1,
  maximum/1, zip/2, append/2, reverse/1, evenL/1, take/2, map/2, filter/2]).

mult(A, B) ->
  C = A * B,
  io:format("~B", [C]).

double(A) -> 2 * A.

distance(P, Q) ->
  {Px, Py} = P,
  {Qx, Qy} = Q,
  X = abs(Qx - Px),
  Y = abs(Qy - Py),
  math:sqrt(X * X + Y * Y).

basicand(P, Q) -> P and Q.

basicor(P, Q) -> P or Q.

basicnot(P) -> not P.

fibonacci(N) when N > 1 ->
  fibonacci(N - 1) + fibonacci(N - 2);
fibonacci(0) -> 0;
fibonacci(1) -> 1.


fibonacciTR(N) when N > 2 ->
  fibtail(N, 1, 1, 3);
fibonacciTR(N) when N < 3 -> 1;
fibonacciTR(0) -> 0.

fibtail(I, L, SL, C) when C == I -> L + SL;
fibtail(I, L, SL, C) ->
  S = SL + L,
  fibtail(I, S, L, C + 1).

sum([H | T]) -> H + sum(T);
sum([]) -> 0.

maximum([H | T]) -> maximum(H, T).
maximum(Max, [H | T]) when H > Max -> maximum(H, T);
maximum(Max, [_H | T]) -> maximum(Max, T);
maximum(Max, []) -> Max.

zip([AH | AT], [BH | BT]) -> [{AH, BH}] ++ zip(AT, BT);
zip([], []) -> [].

append(A, B) -> A ++ B.

reverse([H | T]) -> reverse(T) ++ [H];
reverse([]) -> [].

evenL([H | T]) when H rem 2 == 0 -> [H] ++ evenL(T);
evenL([_H | T]) -> evenL(T);
evenL([]) -> [].

take([_H | _T], L) when L == 0 -> [];
take([H | T], L) when L >= length(T) + 1 -> [H] ++ T;
take([H | T], L) -> takeHelp(H, T, 0, L).


takeHelp(_A, [H | _T], N, L) when N == L -> [H];
takeHelp(A, [H | T], N, L) -> [A] ++ takeHelp(H, T, N + 1, L);
takeHelp(_A, [], _N, _L) -> [].

%%map(F, [H | T]) -> [F(H) | map(F, T)];
%%map(_F, []) -> [].

map(F, L) ->
  [F(H) || H <- L].

filter(F, L) ->
 [E || E <- L, F(E)].