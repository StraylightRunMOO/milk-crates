@verb code_utils:commentify this none this rxd
@program code_utils:commentify
// $code_utils:commentify(lines) => LIST
// 
// Given lines of text, translate them into comment strings and return the list.
{lines} = args;
out = {};
for line in (lines)
  out = {@out, $string_utils:print(line) + ";"};
endfor
return out;
.
