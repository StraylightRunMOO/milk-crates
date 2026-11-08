@verb string_utils:neat this none this rxd
@program string_utils:neat
// $string_utils:neat({string, length [, separator]}, ...) => STR
// Concatenate ANSI-aware left-padded fields.
AU = $ansi_utils;
ret = "";
for x in (args)
  NUM = toint(x[2]);
  x[1] = tostr(x[1]);
  ret = tostr(ret, tostr(AU:left(AU:length(x[1]) >= NUM ? AU:cutoff(x[1], 1, NUM - 1) | x[1], NUM, length(x) == 3 ? x[3] | " ")));
  $command_utils:suspend_if_needed(0);
endfor
return ret;
.
