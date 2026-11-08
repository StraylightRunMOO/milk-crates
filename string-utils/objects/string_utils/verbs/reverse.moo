@verb string_utils:reverse this none this rxd
@program string_utils:reverse
// $string_utils:reverse(string) => STR
// Reverse characters. "This is a test." => ".tset a si sihT".
string = args[1];
if ((len = length(string)) > 50)
  return this:reverse(string[$ / 2 + 1..$]) + this:reverse(string[1..$ / 2]);
endif
index = len;
result = "";
while (index > 0)
  result = result + string[index];
  index = index - 1;
endwhile
return result;
.
