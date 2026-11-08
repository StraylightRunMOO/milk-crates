@verb list_utils:remove_multiple this none this rxd
@program list_utils:remove_multiple
// $list_utils:remove_multiple(haystack, needles) => LIST
// Elements of haystack not in needles, preserving order. Needles may be a single value.
{big, small} = args;
if (typeof(small) != LIST)
  small = {small};
endif
return this:difference(big, small);
.
