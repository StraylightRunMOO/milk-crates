@verb string_utils:strip_all_but this none this rxd
@program string_utils:strip_all_but
// $string_utils:strip_all_but(string, keep) => STR
// Keep only chars that match keep (a match() character class body).
string = args[1];
wanted = "[" + args[2] + "]+";
output = "";
while (m = match(string, wanted))
  output = output + string[m[1]..m[2]];
  string = string[m[2] + 1..$];
endwhile
return output;
.
