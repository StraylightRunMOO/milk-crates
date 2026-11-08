@verb ansi_utils:strip_black this none this rxd
@program ansi_utils:strip_black
// $ansi_utils:strip_black
gray = 0;
x = 1;
string = args[1];
l = length(string);
while (x <= l && (m = match(string[x..l], this.all_regexp)))
  code = string[x + m[1]..x + m[2] - 2];
  if (code in {"gray", "grey"})
    gray = 1;
  elseif (code in this.group_colors)
    gray = 0;
  else
    if (gray && code == "unbold")
      string[x + m[2]..x + m[2] - 1] = "[white]";
      x = x + 7;
    endif
  endif
  x = x + m[2];
endwhile
return string;
.
