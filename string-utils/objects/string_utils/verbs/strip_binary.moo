@verb string_utils:strip_binary this none this rxd
@program string_utils:strip_binary
// $string_utils:strip_binary(encoded) => STR
// decode_binary() then concatenate the string parts, dropping INT bytes.
{decode} = args;
decoded = "";
for x in (decode_binary(decode))
  if (typeof(x) == STR)
    decoded = decoded + x;
  endif
endfor
return decoded;
.
