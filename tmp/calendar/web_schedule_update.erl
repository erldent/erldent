%% -*- mode: nitrogen -*-
-module (web_schedule_update).
-compile([nowarn_export_all, export_all]).
-include_lib("nitrogen_core/include/wf.hrl").

main() ->
  case wf:user() of
    'undefined' ->
      wf:redirect_to_login("/login");
    _ ->
      wf:header("Content-type", "application/json"),
      logger:info("post ~p",[wf:params()]),
      CF=fun(T) ->
             calendar:system_time_to_universal_time(
               calendar:rfc3339_to_system_time(T)-10800,
               second)
         end,
      St=CF(wf:q("start")),
      Fin=CF(wf:q("end")),
      logger:info("post id ~p ~p ~p",[wf:q(id),St,Fin]),
      O=dbapi:update(schedule,
                     #{
                       id=>list_to_integer(wf:q(id)),
                       start=>St,
                       finish=>Fin
                      }),
      case O of
        {ok,1} ->
          jsx:encode(#{success=>true});
        _ ->
          jsx:encode(#{success=>false})
      end
  end.

