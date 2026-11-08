@verb string_utils:camelBack camel_case this none this rxd
@program string_utils:camelBack camel_case
// $string_utils:camelBack/camel_case(string) => STR
// "foo bar baz" => "fooBarBaz". Splits on space after lowercase().
s = tostr(args[1]);
bits = explode(lowercase(s), " ");
if (!bits)
  return "";
endif
out = bits[1];
for w in (bits[2..$])
  if (w)
    out = out + capitalize(w);
  endif
endfor
return out;
.
