@verb list_utils:max_length this none this rx
@program list_utils:max_length
// $list_utils:max_length(strings-or-lists[, default]) => INT
// Longest length among elements. default is the minimum returned (0 if omitted or falsey).
{items, ?dflt = 0} = args;
max = dflt || 0;
for item in (items)
  max = max(max, length(item));
endfor
return max;
.
