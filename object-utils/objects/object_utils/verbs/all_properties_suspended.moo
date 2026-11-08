@verb object_utils:all_properties_suspended all_verbs_suspended this none this rxd
@program object_utils:all_properties_suspended all_verbs_suspended
// $object_utils:all_properties_suspended(OBJ what) => LIST
// all_verbs_suspended(OBJ what) => LIST
// Returns all properties or verbs defined on `what' and all of its ancestors. Uses wizperms to get properties or verbs if the caller of this verb owns what, otherwise, uses caller's perms. Suspends as necessary
what = args[1];
if (what.owner != caller_perms())
  set_task_perms(caller_perms());
endif
bif = verb == "all_verbs_suspended" ? "verbs" | "properties";
res = `call_function(bif, what) ! E_PERM => {}';
while (valid(what = parent(what)))
  res = {@`call_function(bif, what) ! E_PERM => {}', @res};
  $command_utils:suspend_if_needed(0);
endwhile
return res;
.
