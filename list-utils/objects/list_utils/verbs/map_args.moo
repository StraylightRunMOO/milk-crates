@verb list_utils:map_arg*s this none this rxd
@program list_utils:map_arg*s
// $list_utils:map_args/map_arg([n,] object, verb, @args) => LIST
// Call object:verb(@args) for each element of the n-th list argument. n defaults to 1.
set_task_perms(caller_perms());
if (n = args[1])
  {object, verb, @rest} = args[2..$];
else
  object = n;
  n = 1;
  {verb, @rest} = args[2..$];
endif
results = {};
for a in (rest[n])
  results = listappend(results, object:(verb)(@listset(rest, a, n)));
endfor
return results;
.
