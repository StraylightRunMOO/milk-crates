@verb string_utils:columnize_suspended columnise_suspended this none this rxd
@program string_utils:columnize_suspended columnise_suspended
// $string_utils:columnize_suspended/columnise_suspended(interval, items, n [, width]) => LIST
// Like :columnize but suspends for interval seconds as needed. width default 79.
{interval, items, n, ?width = 79} = args;
height = (length(items) + n - 1) / n;
items = {@items, @$list_utils:make(height * n - length(items), "")};
colwidths = {};
for col in [1..n - 1]
  colwidths = listappend(colwidths, 1 - (width + 1) * col / n);
endfor
result = {};
for row in [1..height]
  line = tostr(items[row]);
  for col in [1..n - 1]
    $command_utils:suspend_if_needed(interval);
    line = tostr(this:left(line, colwidths[col]), " ", items[row + col * height]);
  endfor
  result = listappend(result, line[1..min($, width)]);
endfor
return result;
.
