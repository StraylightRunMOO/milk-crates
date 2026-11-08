@verb code_utils:show_property this none this rxd
@program code_utils:show_property
// $code_utils:show_property(OBJ object, STR pname)
set_task_perms(caller_perms());
{object, pname} = args;
if (pname in this.builtin_props)
  player:notify(tostr(object, ".", pname));
  player:notify("Built-in property.");
else
  try
    {owner, perms} = property_info(object, pname);
  except error (ANY)
    player:notify(error[2]);
    return;
  endtry
  player:notify(tostr(object, ".", pname));
  player:notify(tostr("Owner:        ", valid(owner) ? tostr(owner.name, " (", owner, ")") | "*** NONE ***"));
  player:notify(tostr("Permissions:  ", perms));
endif
player:notify(tostr("Value:        ", $string_utils:print(object.(pname))));
.
