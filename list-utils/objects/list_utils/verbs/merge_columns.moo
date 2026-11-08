@verb list_utils:merge_columns this none this rxd
@program list_utils:merge_columns
// $list_utils:merge_columns({col1, col2, ...}[, divider]) => LIST
// Place string lists side by side, padding cells. divider is appended after each cell.
{columns, ?divider = ""} = args;
if (typeof(columns) != LIST || !length(columns))
  return {};
endif
maxlen = 0;
widths = {};
for column in (columns)
  maxlen = max(maxlen, length(column));
  w = 0;
  if (length(column))
    x = this:longest(column);
    w = typeof(x) == ERR ? 0 | length(tostr(x));
  endif
  widths = {@widths, w};
endfor
page = {};
for row in [1..maxlen]
  line = "";
  for col in [1..length(columns)]
    cell = `columns[col][row] ! E_RANGE => ""';
    cell = tostr(cell);
    w = widths[col];
    if (length(cell) < w)
      cell = cell + $string_utils:space(w - length(cell));
    endif
    line = line + cell + divider;
  endfor
  page = {@page, line};
endfor
return page;
.
