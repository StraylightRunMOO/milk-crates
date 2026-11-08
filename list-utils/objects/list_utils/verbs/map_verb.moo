@verb list_utils:map_verb this none this rxd
@program list_utils:map_verb
// $list_utils:map_verb(objlist, verb, @args) => LIST
// o:verb(@args) for each object o in objlist.
set_task_perms(caller_perms());
{objs, vrb, @rest} = args;
if (length(objs) > 50)
  return {@this:map_verb(@listset(args, objs[1..$ / 2], 1)), @this:map_verb(@listset(args, objs[$ / 2 + 1..$], 1))};
endif
strs = {};
for o in (objs)
  strs = {@strs, o:(vrb)(@rest)};
endfor
return strs;
.
