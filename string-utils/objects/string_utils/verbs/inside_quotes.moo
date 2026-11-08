@verb string_utils:inside_quotes this none this rx
@program string_utils:inside_quotes
// $string_utils:inside_quotes(string) => 0|1
// True if the end of string is inside an unescaped double quote.
{string} = args;
// Copied from Moo_tilities (#332):inside_quotes by Mooshie (#106469) Tue Dec 23 10:26:49 1997 PST
quoted = 0;
while (i = index(string, "\""))
  if (!quoted || string[i - 1] != "\\")
    quoted = !quoted;
  endif
  string = string[i + 1..$];
endwhile
return quoted;
.
