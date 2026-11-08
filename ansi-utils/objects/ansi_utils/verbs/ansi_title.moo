@verb ansi_utils:ansi_title this none this rx
@program ansi_utils:ansi_title
// $ansi_utils:ansi_title (OBJ player[, STR name]) => STR <player>'s title
// If <name> is specified, it will be used instead of <player>.name
name = {@args, args[1].name}[2];
for x in (args[1].ansi_title)
  if (typeof(x[2]) == LIST)
    nn = x[2][random(length(x[2]))];
  else
    nn = x[2];
  endif
  nn && (name = strsub(name, x[1], nn));
endfor
return name;
.
