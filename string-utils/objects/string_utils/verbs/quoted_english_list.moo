@verb string_utils:quoted_english_list quoted_list this none this rxd
@program string_utils:quoted_english_list quoted_list
// $string_utils:quoted_english_list/quoted_list(list [, quotes] [, english_list args...]) => STR|E_INVARG
// Wrap each element in quotes (default "\"\"") then :english_list.
{stuff, ?quotes = "\"\"", @rest} = args;
if (typeof(stuff) != LIST)
  return E_INVARG;
endif
open = quotes[1];
close = length(quotes) >= 2 ? quotes[2] | quotes[1];
quoted = {};
for elm in (stuff)
  quoted = {@quoted, tostr(open, elm, close)};
endfor
return this:english_list(quoted, @rest);
.
