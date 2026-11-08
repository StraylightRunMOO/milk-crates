@verb list_utils:elements_tostr elements_toint elements_toobj elements_toliteral this none this rxd
@program list_utils:elements_tostr elements_toint elements_toobj elements_toliteral
// $list_utils:elements_tostr/toint/toobj/toliteral(list) => LIST
// Map tostr/toint/toobj/toliteral over each element. Non-list arg wrapped as {arg}.
raw = args[1];
if (typeof(raw) != LIST)
  raw = {raw};
endif
out = {};
for n in (raw)
  if (verb == "elements_tostr")
    out = {@out, tostr(n)};
  elseif (verb == "elements_toint")
    out = {@out, toint(n)};
  else
    if (verb == "elements_toobj")
      out = {@out, toobj(n)};
    else
      out = {@out, toliteral(n)};
    endif
  endif
endfor
return out;
.
