defmodule EdentWeb.SelectHelpers do
  import Phoenix.HTML.Form
  import Phoenix.HTML.Tag
  import Phoenix.HTML
  def doctor_select(form, field, opts \\ []) do
    value = Keyword.get(opts, :value, input_value(form, field) || Keyword.get(opts, :default))
    doctor_builder(form, field, value, opts)
  end

  defp doctor_builder(form, field, val, opts) do
  id = input_id(form, field)
  [
    select(form, :doctor_id, [], opts),
    {:safe, 
      "<script>
        $(function(){
            var doctor_s2=$('#" <> id <> "').select2({});
            $.ajax({url:'/api/doctors'}).done(function(res){
                for (var d = 0; d < res.items.length; d++) {
                var item = res.items[d];
                doctor_s2.append(new Option(item.text, item.id, true, true));
                }"
                <>
                case is_integer(val) do
                  true ->
                    "doctor_s2.val(" <> Integer.to_string(val) <> ").trigger('change');"
                  false ->
                    ""
                end
                <> "
                });
            });
      </script>"}
  ]

    end
end

