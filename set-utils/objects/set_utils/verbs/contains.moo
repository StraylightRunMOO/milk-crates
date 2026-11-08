@verb set_utils:contains this none this rxd
@program set_utils:contains
// $set_utils:contains(super [, @sets]) => 0|1
// True if super contains every element of each later list. One arg => 1.
// {} is a superset of {} only; anything is a superset of {}.
{?super = {}, @rest} = args;
for l in (rest)
  for x in (l)
    if (!(x in super))
      return 0;
    endif
  endfor
endfor
return 1;
.
