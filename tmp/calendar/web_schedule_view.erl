%% -*- mode: nitrogen -*-
-module (web_schedule_view).
-compile([nowarn_export_all, export_all]).
-include_lib("nitrogen_core/include/wf.hrl").

main() ->
  case wf:user() of
    'undefined' ->
      wf:redirect_to_login("/login");
    _ ->
      jsx:encode(current_calendar())
  end.

current_calendar() ->
  logger:info("S ~p ~p",[wf:q(start),wf:q('end')]),
  A=fun(Weeks) ->
        calendar:system_time_to_local_time(
          604800*((erlang:system_time(second) div 604800)+Weeks)
          ,second)
    end,
  R=dbapi:select(schedule, #{ start => {between, A(-2), A(2)}}),
  CTime=fun({{Y,M,D},{HH,MM,SS}}=S) ->
            TT=list_to_binary(
            calendar:system_time_to_rfc3339(
              calendar:datetime_to_gregorian_seconds({{Y,M,D},{HH,MM,trunc(SS)}})-(719528*86400)
             )),
            logger:info("CT ~p -> ~p",[S,TT]),
            TT
        end,
  [ #{ id => ID, title => T, start => CTime(T1), 'end' => CTime(T2) } || 
    #{ id := ID, comments := T, start := T1, finish := T2 } <- R ].

api_event(Name, Tag, JSTag) ->
  logger:info("API Event ~p ~p ~p",[Name, Tag, JSTag]),
  ok.

event(Any) ->
  logger:info("Event ~p ~p",[Any,self()]),
  ok.

