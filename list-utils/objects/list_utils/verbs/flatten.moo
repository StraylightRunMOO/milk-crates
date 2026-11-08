@verb list_utils:flatten this none this rxd
@program list_utils:flatten
// $list_utils:flatten(list_of_lists) => LIST
// Concatenate nested lists into one list; non-list elements kept as-is.
lst = args[1];
// Copied from $quinn_utils (#34283):unroll by Quinn (#19845) Mon Mar  8 09:29:03 1993 PST
out = {};
stack = {{lst, 1}};
while (stack)
  {cur, i} = stack[$];
  if (i > length(cur))
    stack = stack[1..$ - 1];
  else
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
