@verb string_utils:starts_with ends_with this none this rxd
@program string_utils:starts_with ends_with
// $string_utils:starts_with(string, prefix) / :ends_with(string, suffix) => 0|1
// Prefix/suffix test. Empty affix is true. Dispatches on verb.
{s, affix} = args;
s = tostr(s);
affix = tostr(affix);
if (affix == "")
  return 1;
endif
if (verb == "starts_with")
  return index(s, affix) == 1;
endif
n = length(affix);
return length(s) >= n && s[$ - n + 1..$] == affix;
.
