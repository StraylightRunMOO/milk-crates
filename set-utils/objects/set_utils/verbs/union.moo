@verb set_utils:union this none this rxd
@program set_utils:union
// $set_utils:union(@sets) => LIST
// Elements that appear in any argument, first-occurrence order. {} if no args.
if (!args)
  return {};
endif
{set, @rest} = args;
for l in (rest)
  for x in (l)
    set = setadd(set, x);
  endfor
endfor
return set;
.
