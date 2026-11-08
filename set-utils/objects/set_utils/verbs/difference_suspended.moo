@verb set_utils:difference_suspended diff_suspended this none this rxd
@program set_utils:difference_suspended diff_suspended
// $set_utils:difference_suspended/diff_suspended(@sets) => LIST
// Same as :difference, calling $command_utils:suspend_if_needed(0) per removal.
{set, @rest} = args;
for l in (rest)
  for x in (l)
    set = setremove(set, x);
    $command_utils:suspend_if_needed(0);
  endfor
endfor
return set;
.
