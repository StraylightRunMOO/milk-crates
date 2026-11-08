@verb string_utils:substitute_first this none this rxd
@program string_utils:substitute_first
// $string_utils:substitute_first(text, what, sub) => STR|E_INVARG
// Replace the first occurrence of what. Wraps replace_first().
{text, what, sub} = args;
if (typeof(text) != STR || typeof(what) != STR || typeof(sub) != STR)
  return E_INVARG;
endif
return replace_first(text, what, sub);
.
