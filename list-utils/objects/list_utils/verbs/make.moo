@verb list_utils:make this none this rxd
@program list_utils:make
// $list_utils:make(n[, elt]) => LIST|ERR
// n copies of elt (default 0). Count-first; the make() builtin is value-first. E_INVARG if n < 0.
{n, ?elt = 0} = args;
if (typeof(n) != INT || n < 0)
  return E_INVARG;
endif
return make(elt, n);
.
