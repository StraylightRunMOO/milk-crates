@verb code_utils:dump_properties this none this rxd
@program code_utils:dump_properties
// $code_utils:dump_properties(object, create_flag) => LIST
// Property information for this object and its ancestors in @dump format.
set_task_perms(caller_perms());
{dobj, create, ?targname = tostr(dobj)} = args;
result = {};
for p in (`properties(dobj) ! ANY => {}')
  pquoted = toliteral(p);
  try
    info = property_info(dobj, p);
    value = dobj.(p);
  except error (ANY)
    result = {@result, tostr("\"", targname, ".(", pquoted, ") => ", toliteral(error[1]), " (", error[2], ")")};
    continue p;
  endtry
  if (create)
    uvalue = typeof(value) == LIST ? "{}" | 0;
    result = {@result, tostr("@prop ", targname, ".", pquoted, " ", uvalue || toliteral(value), " ", info[2] || "\"\"", info[1] == dobj.owner ? "" | tostr(" ", info[1]))};
    if (uvalue && value)
      result = {@result, tostr(";;", targname, ".(", pquoted, ") = ", toliteral(value))};
    endif
  elseif (info[2] != "rc")
    result = {@result, tostr("@chmod ", targname, ".", pquoted, " ", info[2])};
  endif
  $command_utils:suspend_if_needed(0);
endfor
for a in ($object_utils:ancestors(dobj))
  for p in (`properties(a) ! ANY => {}')
    $command_utils:suspend_if_needed(1);
    pquoted = toliteral(p);
    try
      value = dobj.(p);
    except error (ANY)
      result = {@result, tostr("\"", targname, ".(", pquoted, ") => ", toliteral(error[1]), " (", error[2], ")")};
      continue p;
    endtry
    avalue = `a.(p) ! ANY';
    if (typeof(avalue) == ERR || value != avalue)
      result = {@result, tostr(";;", targname, ".(", pquoted, ") = ", toliteral(value))};
    endif
  endfor
  $command_utils:suspend_if_needed(1);
endfor
return result;
.
