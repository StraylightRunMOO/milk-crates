@verb string_utils:aliases_from_name this none this rxd
@program string_utils:aliases_from_name
// $string_utils:aliases_from_name(name) => LIST
// Trailing words plus the full name. "yellow baseball bat" => {"baseball bat", "bat", "yellow baseball bat"}.
name = tostr(args[1]);
aliases = {};
rest = name;
while ((i = index(rest, " ")) && i != length(rest))
  rest = rest[i + 1..$];
  aliases = {@aliases, rest};
endwhile
return setadd(aliases, name);
.
