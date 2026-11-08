@verb string_utils:name_and_number nn name_and_number_list nn_list this none this rxd
@program string_utils:name_and_number nn name_and_number_list nn_list
// $string_utils:name_and_number/nn(object [, sepr] [, english_list args...]) => STR
// "Name (#obj)". List of objects is passed through :english_list.
{objs, ?sepr = " ", @eng_args} = args;
if (typeof(objs) != LIST)
  objs = {objs};
endif
name_list = {};
for what in (objs)
  name = valid(what) ? what.name | {"<invalid>", "$nothing", "$ambiguous_match", "$failed_match"}[1 + (what in {#-1, #-2, #-3})];
  name = tostr(name, sepr, "(", what, ")");
  name_list = {@name_list, name};
endfor
return this:english_list(name_list, @eng_args);
.
