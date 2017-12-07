-module(core_data_handler_test).

%%%-------------------------------------------------------------------------------------------------
%%% Description module core_data_handler_test
%%%-------------------------------------------------------------------------------------------------
%%% Defines a set of eunit tests for the injesta core_data_handler module
%%%-------------------------------------------------------------------------------------------------

-include_lib("eunit/include/eunit.hrl").

%%-------------------------------------------------------------------------------------------------
%% Test Functions
%%-------------------------------------------------------------------------------------------------

%%-------------------------------------------------------------------------------------------------
%% Function: start_link_test/0
%% Purpose:  Checks that start_link starts a core_data_handler process with the correct name
%%-------------------------------------------------------------------------------------------------
start_link_test() ->

    {ok,CoreDataHandlerPid}=core_data_handler:start_link({test_process, 1, test_config}),
    ?assert(is_pid(CoreDataHandlerPid)),
    ?assert(is_pid(whereis(list_to_atom("test_process1")))).

