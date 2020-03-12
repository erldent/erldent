%% -*- mode: nitrogen -*-
-module (web_schedule_edit).
-compile([nowarn_export_all, export_all]).
-include_lib("nitrogen_core/include/wf.hrl").

main() ->
  case wf:user() of
    'undefined' ->
      wf:redirect_to_login("/login");
    _ ->
      #template { file=code:priv_dir(site)++"/templates/default.html" }
  end.

title() -> "Правка".

body() ->
  [
   #panel{ class="sched_edit",
           body = htmlform:modelform(schedule,#{})
           %#inplace { tag="t1", id=textbox1, text="Some text.", view=#span{}, edit=#textbox{} }
         }
  ].

inplace_event(ID, Value) ->
  logger:info("Inplace event ~p ~p",[ID, Value]),
  "preved".

api_event(Name, Tag, JSTag) ->
  logger:info("API Event ~p ~p ~p",[Name, Tag, JSTag]),
  ok.

event(Any) ->
  logger:info("Event ~p ~p",[Any,self()]),
  ok.

