@verb object_utils:accessible_verbs this none this rxd
@program object_utils:accessible_verbs
// $object_utils:accessible_verbs(object) => LIST
// a list of verb names (or E_PERM) regardless of readability of object
{thing} = args;
valid(thing) || raise(E_INVARG, "Invalid object argument");
{num_verbs, verbs} = {length(verbs(thing)), {}};
set_task_perms(caller_perms());
// ... caching num of verbs before for loop saves us ticks ...
for i in [1..num_verbs]
  verbs = {@verbs, `verb_info(thing, i)[3] ! E_PERM'};
endfor
return verbs;
.
