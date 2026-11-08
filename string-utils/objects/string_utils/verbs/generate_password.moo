@verb string_utils:generate_password this none this rxd
@program string_utils:generate_password
// $string_utils:generate_password([length]) => STR|E_INVARG
// Random alphanumeric password. Default length 12, range 4..128.
{?n = 12} = args;
if (typeof(n) != INT || n < 4 || n > 128)
  return E_INVARG;
endif
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
out = "";
for i in [1..n]
  out = out + alphabet[random(length(alphabet))];
endfor
return out;
.
