%% -*- mode: nitrogen -*-
-module (web_schedule).
-compile([nowarn_export_all, export_all]).
-include_lib("nitrogen_core/include/wf.hrl").

main() ->
  case wf:user() of
    'undefined' ->
      wf:redirect_to_login("/login");
    _ ->
      #template { file=code:priv_dir(site)++"/templates/default.html" }
  end.

title() -> "Расписание".

body() ->
  wf:wire(#script{ script="draw_calendar();" }),
  wf:wire(#console_log { text="Some text" }),
  wf:wire(#api { name=apitest1, tag={xabc, xxx} }),
  %wf:wire(d1, #event { type=click, postback={clicked, body} }),
  %wf:wire(".fc-event", #event { type=click, postback={clicked, body} }),
  [
   %#panel{ id="d1", body="d1"},
   %#panel{ class="evsrc-container",
   %        body=[ #panel{id="new-event", body="Новое", class="fc-event fc-evsrc" } ]},
   #panel{ id=calendar }
  ].

api_event(Name, Tag, JSTag) ->
  logger:info("API Event ~p ~p ~p",[Name, Tag, JSTag]),
  ok.

event(Any) ->
  logger:info("Event ~p ~p",[Any,self()]),
  ok.

