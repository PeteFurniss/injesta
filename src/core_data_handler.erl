-module(core_data_handler).
-behaviour(gen_server).

%%%-----------------------------------------------------------------------------
%%% Description module injesta core_data_handler
%%%-----------------------------------------------------------------------------
%%% Uses OTP gen_server to Implement the injesta Core Data Handler generic
%%% module.

-export([start_link/1]).
-export([init/1]).

%%------------------------------------------------------------------------------
%% Client Functions
%%------------------------------------------------------------------------------

%%------------------------------------------------------------------------------
% start_link
%%------------------------------------------------------------------------------
%% Function: start_link/1
%% Purpose:  Starts a gen_server process for an injesta Core Data Handler.
%% Args:     {ProcessType, ProcessInstance, ConfigModule}
%%           ProcessType = atom(), the name of the type of Core Data Handler
%%                                 process
%%           ProcessInstance = int(), the unique instance number of the process
%%           ConfigModule = atom(), the name of the module from which the Core
%%                                  Data Handler fetches its configuration data
%% Returns:  {ok, <Pid of the Core Data Handler process>}
%%------------------------------------------------------------------------------

start_link({ProcessType, ProcessInstance, ConfigModule}) ->
    gen_server:start_link({local, list_to_atom(lists:concat([ProcessType, ProcessInstance]))}, ?MODULE, {ProcessType, ProcessInstance, ConfigModule}, []).

%%------------------------------------------------------------------------------
%% Callback Functions for gen_server
%%------------------------------------------------------------------------------

%%------------------------------------------------------------------------------
%% Function: init/1
%% Purpose:  Called by gen_server when the core_data_handler process is started
%% Args:     {ProcessType, ProcessInstance, ConfigModule}
%%           ProcessType = atom(), the name of the type of Core Data Handler
%%                                 process
%%           ProcessInstance = int(), the unique instance number of the process
%%           ConfigModule = atom(), the name of the module from which the Core
%%                                  Data Handler fetches its configuration data
%% Returns:  {ok, InitialState}
%%------------------------------------------------------------------------------

init(_Args) ->
    {ok, []}.

