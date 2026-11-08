@verb list_utils:map_builtin this none this rxd
@program list_utils:map_builtin
// $list_utils:map_builtin(list, func) => LIST|ERR
// Apply builtin func to each element. E_INVARG if func is not a builtin.
set_task_perms(caller_perms());
{objs, builtin} = args;
if (!`function_info(builtin) ! E_INVARG => 0')
  return E_INVARG;
endif
if (length(objs) > 100)
  return {@this:map_builtin(objs[1..$ / 2], builtin), @this:map_builtin(objs[$ / 2 + 1..$], builtin)};
endif
strs = {};
for foo in (objs)
  strs = {@strs, call_function(builtin, foo)};
endfor
return strs;
.
