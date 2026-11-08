@verb building_utils:size_string this none this rxd
@program building_utils:size_string
// $building_utils:size_string(INT bytes) => STR
size = args[1];
if (!size)
  return " ???";
elseif (size < 1000)
  return " <1K";
else
  if (size < 1000000)
    return tostr($string_utils:right(size / 1000, 3), "K");
  else
    return tostr($string_utils:right(size / 1000000, 3), "M");
  endif
endif
.
