@verb string_utils:_cap_property this none this rxd
@program string_utils:_cap_property
// $string_utils:_cap_property(what, prop [, ucase]) => STR|ERR
// what.(prop), capitalized if ucase or prop is capitalized.
// Blank prop => :title() / :titlec(), falling back to .name when those verbs are missing.
{what, prop, ?ucase = 0} = args;
set_task_perms(caller_perms());
if (typeof(what) == LIST)
  result = {};
  for who in (what)
    result = {@result, this:_cap_property(who, prop, ucase)};
  endfor
  return $string_utils:english_list(result);
endif
ucase = prop && strcmp(prop, "a") < 0 || ucase;
if (!prop)
  if (!valid(what))
    return (ucase ? "N" | "n") + "othing";
  endif
  if (ucase)
    return `what:titlec() ! ANY => this:capitalize(tostr(what.name))';
  endif
  return `what:title() ! ANY => tostr(what.name)';
elseif (!ucase || typeof(s = `what.(prop + "c") ! ANY') == ERR)
  if (prop == "name")
    s = valid(what) ? what.name | "nothing";
    ucase = ucase && !is_player(what);
  else
    s = `$object_utils:has_property(what, prop) ? what.(prop) | $player.(prop) ! ANY';
  endif
  if (ucase && (s && (typeof(s) == STR && ((z = index(this.alphabet, s[1], 1)) < 27 && z > 0))))
    s[1] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[z];
  endif
endif
return typeof(s) == ERR ? s | tostr(s);
.
