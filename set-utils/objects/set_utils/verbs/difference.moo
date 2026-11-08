@verb set_utils:diff*erence this none this rxd
@program set_utils:diff*erence
// $set_utils:difference/diff(@sets) => LIST
// Elements of set 1 that are not in sets 2..n. setremove once per hit.
{set, @rest} = args;
for l in (rest)
  for x in (l)
    set = setremove(set, x);
  endfor
endfor
return set;
.
