@verb seq_utils:from_string this none this rxd
@program seq_utils:from_string
// $seq_utils:from_string(string) => LIST|ERR
// Comma-separated numbers and number..number ranges. E_INVARG if malformed.
minint = `$minint ! ANY => -2147483647';
su = $string_utils;
if (!(s = tostr(args[1])) || !(s = su:strip_chars(s, " ")))
  return {};
endif
if (!(words = su:explode(s, ",")))
  return {};
endif
parts = {};
for word in (words)
  to = index(word, "..");
  if (!to && su:is_numeric(word))
    part = {toint(word), toint(word) + 1};
  elseif (to)
    if (to == 1)
      start = minint;
    elseif (su:is_numeric(start = word[1..to - 1]))
      start = toint(start);
    else
      return E_INVARG;
    endif
    end = word[to + 2..length(word)];
    if (!end)
      part = {start};
    elseif (!su:is_numeric(end))
      return E_INVARG;
    else
      if ((end = toint(end)) >= start)
        part = {start, end + 1};
      else
        part = {};
      endif
    endif
  else
    return E_INVARG;
  endif
  parts = {@parts, part};
endfor
return this:union(@parts);
.
