%%%-------------------------------------------------------------------
%%% @author Puneet Sharma
%%% @copyright (C) 2016, Stevens Institute of Technology
%%% @doc
%%%
%%% @end
%%% Created : 27. Oct 2016 00:36
%%%-------------------------------------------------------------------
-module(test).
-author("Puneet Sharma").

%% API
-export([take /2]).
-include_lib("eunit/include/eunit.hrl").
take(_,[]) -> [].
take_1_test () ->
  ?assertEqual(take(0,[]),[]).
take_2_test () ->
  ?assertEqual(take(0,[1,2,3]),[]).
