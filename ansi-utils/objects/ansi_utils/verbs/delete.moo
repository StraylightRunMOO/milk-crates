@verb ansi_utils:delete this none this rxd
@program ansi_utils:delete
// $ansi_utils:delete (STR string) => STR <string> with ANSI codes stripped out
line = args[1];
if (this.active)
  while (index = match(line, this.notify_regexp))
    line[index[1]..index[2]] = "";
  endwhile
  line = strsub(line, "[null]", "");
endif
return line;
.
