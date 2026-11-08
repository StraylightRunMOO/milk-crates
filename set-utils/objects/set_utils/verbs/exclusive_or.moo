@verb set_utils:exclusive_or xor this none this rxd
@program set_utils:exclusive_or xor
// $set_utils:exclusive_or/xor(@sets) => LIST
// Elements that appear in exactly one argument. {} if no args.
// Two sets: (A union B) minus (A intersection B).
if (!args)
  return {};
endif
{set, @rest} = args;
so_far = set;
for l in (rest)
  for x in (l)
    if (x in so_far)
      set = setremove(set, x);
    else
      set = setadd(set, x);
    endif
  endfor
  so_far = {@so_far, @l};
endfor
return set;
.
