@verb string_utils:columnize columnise this none this rxd
@program string_utils:columnize columnise
// $string_utils:columnize/columnise(items, n [, width]) => LIST
// One-column list into n columns. width is last occupied column (default 79).
{items, n, ?width = 79} = args;
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
    line = tostr(this:left(line, colwidths[col]), " ", items[row + col * height]);
  endfor
  result = listappend(result, line[1..min($, width)]);
endfor
return result;
.
