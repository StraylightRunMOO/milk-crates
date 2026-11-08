@verb set_utils:intersection_preserve_case this none this rxd
@program set_utils:intersection_preserve_case
// $set_utils:intersection_preserve_case(@sets) => LIST
// Intersection that keeps each element's identity from the first argument.
if (!args)
  return {};
endif
{result, @rest} = args;
for s in (rest)
  for x in (result)
    if (!(x in s))
      result = setremove(result, x);
    endif
  endfor
endfor
return result;
.
