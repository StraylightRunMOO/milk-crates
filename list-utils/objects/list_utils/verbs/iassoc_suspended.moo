@verb list_utils:iassoc_suspended this none this rxd
@program list_utils:iassoc_suspended
// $list_utils:iassoc_suspended(target, list[, index[, suspend-for]]) => INT
// Same as :iassoc, calling $command_utils:suspend_if_needed per element.
set_task_perms(caller_perms());
// Copied from Moo_tilities (#332):iassoc_suspended by Mooshie (#106469) Wed Mar 18 19:27:53 1998 PST
{target, thelist, ?indx = 1, ?suspend_for = 0} = args;
cu = $command_utils;
for element in (thelist)
  if (`element[indx] == target ! E_RANGE, E_TYPE => 0' && typeof(element) == LIST)
    return element in thelist;
  endif
  cu:suspend_if_needed(suspend_for);
endfor
return 0;
.
