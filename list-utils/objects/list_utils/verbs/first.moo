@verb list_utils:first last rest this none this rxd
@program list_utils:first last rest
// $list_utils:first/last/rest(list) => ANY|LIST|ERR
// first/last element, or rest after the first. rest of 0-1 elements is {}. E_TYPE/E_RANGE.
l = args[1];
if (typeof(l) != LIST)
  return E_TYPE;
endif
n = length(l);
if (verb == "first")
  return n ? l[1] | E_RANGE;
elseif (verb == "last")
  return n ? l[$] | E_RANGE;
endif
return n > 1 ? l[2..$] | {};
.
