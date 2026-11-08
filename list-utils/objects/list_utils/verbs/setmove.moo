@verb list_utils:setmove this none this rxd
@program list_utils:setmove
// $list_utils:setmove(list, from, to) => LIST
// Move the element at 1-based index from to index to.
{start, from, to} = args;
// Copied from Moo_tilities (#332):setmove by Mooshie (#106469) Mon Sep 22 21:07:25 1997 PDT
what = start[from];
return listinsert(listdelete(start, from), what, to);
.
