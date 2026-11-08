@verb string_utils:regexp_quote this none this rxd
@program string_utils:regexp_quote
// $string_utils:regexp_quote(string) => STR
// Quote regexp specials []$^.*+?% with %.
string = args[1];
quoted = "";
while (m = rmatch(string, "[][$^.*+?%].*"))
  quoted = "%" + string[m[1]..m[2]] + quoted;
  string = string[1..m[1] - 1];
endwhile
return string + quoted;
.
