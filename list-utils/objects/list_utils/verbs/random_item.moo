@verb list_utils:random_item random_element this none this rxd
@program list_utils:random_item random_element
// $list_utils:random_item/random_element(list) => ANY|ERR
// A random element. E_ARGS/E_TYPE/E_RANGE on bad args or empty list.
if (length(args) != 1)
  return E_ARGS;
endif
l = args[1];
if (typeof(l) != LIST)
  return E_TYPE;
endif
if (length(l) < 1)
  return E_RANGE;
endif
return random_of(l);
.
