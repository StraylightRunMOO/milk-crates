@verb string_utils:strip_all_but_seq this none this rxd
@program string_utils:strip_all_but_seq
// $string_utils:strip_all_but_seq(string, keep) => STR
// Keep only substrings that match the regexp keep, concatenated.
string = args[1];
wanted = args[2];
output = "";
while (m = match(string, wanted))
  output = output + string[m[1]..m[2]];
  string = string[m[2] + 1..length(string)];
endwhile
return output;
.
