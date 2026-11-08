@verb list_utils:setremove_all this none this rxd
@program list_utils:setremove_all
// $list_utils:setremove_all(list, elt) => LIST
// list with every occurrence of elt removed.
{set, what} = args;
while (w = what in set)
  set[w..w] = {};
endwhile
return set;
.
