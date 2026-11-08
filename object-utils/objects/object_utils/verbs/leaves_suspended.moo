@verb object_utils:leaves_suspended this none this rxd
@program object_utils:leaves_suspended
// $object_utils:leaves_suspended(OBJ object) => LIST
// descendants of <object> that have no children
set_task_perms(caller_perms());
r = {args[1]};
i = 1;
while (i <= length(r))
  if (kids = children(r[i]))
    r[i..i] = kids;
  else
    i = i + 1;
  endif
  $command_utils:suspend_if_needed(0);
endwhile
return r;
.
