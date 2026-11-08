@verb list_utils:assoc_suspended this none this rxd
@program list_utils:assoc_suspended
// $list_utils:assoc_suspended(target, list[, index[, suspend-for]]) => LIST
// Same as :assoc, calling $command_utils:suspend_if_needed per element.
set_task_perms(caller_perms());
// Copied from Moo_tilities (#332):assoc_suspended by Mooshie (#106469) Wed Mar 18 19:27:54 1998 PST
{target, thelist, ?indx = 1, ?suspend_for = 0} = args;
cu = $command_utils;
for t in (thelist)
  if (`t[indx] == target ! E_TYPE => 0')
    if (typeof(t) == LIST && length(t) >= indx)
      return t;
    endif
  endif
  cu:suspend_if_needed(suspend_for);
endfor
return {};
.
