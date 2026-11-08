@verb string_utils:word_start this none this rxd
@program string_utils:word_start
// $string_utils:word_start(string) => LIST
// {{start, end}, ...} 1-based indices of each word, as the command parser sees them.
rest = args[1];
// ... find first nonspace...
wstart = match(rest, "[^ ]%|$")[1];
wbefore = wstart - 1;
rest[1..wbefore] = "";
if (!rest)
  return {};
endif
quote = 0;
wslist = {};
pattern = " +%|\\.?%|\"";
while (m = match(rest, pattern))
  // ... find the next occurence of a special character, either
  // ... a block of spaces, a quote or a backslash escape sequence...
  char = rest[m[1]];
  if (char == " ")
    wslist = {@wslist, {wstart, wbefore + m[1] - 1}};
    wstart = wbefore + m[2] + 1;
  elseif (char == "\"")
    // ... beginning or end of quoted string...
    // ... within a quoted string spaces aren't special...
    pattern = (quote = !quote) ? "\\.?%|\"" | " +%|\\.?%|\"";
  endif
  rest[1..m[2]] = "";
  wbefore = wbefore + m[2];
endwhile
return rest || char != " " ? {@wslist, {wstart, wbefore + length(rest)}} | wslist;
.
