%%%-------------------------------------------------------------------
%%% @author Puneet Sharma
%%% @copyright (C) 2016, Stevens Institute of Technology
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2016 14:19
%%%-------------------------------------------------------------------
-module(bt).
-author("Puneet Sharma").

%% API
-compile(export_all).
%%-export([]).
anABT()->
  {node,"Hello",{node, "bye", {leaf, 3}, {leaf, 4}}, {leaf, 5}}.
mapABT(F, _G, {leaf, N})->
  {leaf, F(N)};
mapABT(F, G, {node, S, LT, RT})->
  {node, G(S),mapABT(F,G,LT),mapABT(F,G,RT)}.

foldABT(F,_G,{leaf, N})->
  F(N);
foldABT(F,G,{node, S, LT, RT}) ->
  G(S, foldABT(F,G, LT), foldABT(F,G,RT)).

sizeABT(T)->
  foldABT(fun(_X)->1 end, fun(_S, SL, SR)->1+SL+SR end, T).

heightABT(T)->
  foldABT(fun(_X)->1 end, fun(_S, HL, HR)->1+max(HL, HR) end, T).