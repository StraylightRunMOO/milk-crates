@verb list_utils:flatten_suspended this none this rxd
@program list_utils:flatten_suspended
// $list_utils:flatten_suspended(list_of_lists) => LIST
// Same as :flatten, calling $command_utils:suspend_if_needed(0) per element.
lst = args[1];
// Copied from list utilities (#372):flatten [verb author Hacker (#18105)] at Sun Jul  3 07:46:47 2011 PDT
// Copied from $quinn_utils (#34283):unroll by Quinn (#19845) Mon Mar  8 09:29:03 1993 PST
out = {};
stack = {{lst, 1}};
while (stack)
  {cur, i} = stack[$];
  if (i > length(cur))
    stack = stack[1..$ - 1];
  else
    $command_utils:suspend_if_needed(0);
    elm = cur[i];
    stack[$] = {cur, i + 1};
    if (typeof(elm) == LIST)
      stack = listappend(stack, {elm, 1});
    else
      out = listappend(out, elm);
    endif
  endif
endwhile
return out;
.
