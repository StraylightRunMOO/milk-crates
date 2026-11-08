@verb list_utils:sort_by_property this none this rxd
@program list_utils:sort_by_property
// $list_utils:sort_by_property(objlist[, prop]) => LIST
// Objects sorted by prop (default name). Missing props sort as "".
{bunch, ?prop = "name"} = args;
pairs = {};
for b in (bunch)
  pairs = {@pairs, {b, `b.(prop) ! ANY => ""'}};
endfor
return this:slice(this:sort_alist(pairs, 2));
.
