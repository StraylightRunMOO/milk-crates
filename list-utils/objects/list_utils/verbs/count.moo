@verb list_utils:count this none this rxd
@program list_utils:count
// $list_utils:count(item, list) => INT|ERR
// Number of occurrences of item in list. E_INVARG if list is not a LIST.
{x, xlist} = args;
if (typeof(xlist) != LIST)
  return E_INVARG;
endif
return length(all_members(x, xlist));
.
