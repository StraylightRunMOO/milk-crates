@verb string_utils:pluralize this none this rxd
@program string_utils:pluralize
// $string_utils:pluralize(word [, count]) => STR
// English plural. If count is 1, return the singular. Default count 2.
{word, ?count = 2} = args;
word = tostr(word);
if (count == 1)
  return word;
endif
w = lowercase(word);
if (w[$] == "y" && length(w) > 1 && !index("aeiou", w[$ - 1]))
  return word[1..$ - 1] + "ies";
elseif (w[$] == "s" || w[$] == "x" || w[$] == "z" || (length(w) >= 2 && (w[$ - 1..$] == "ch" || w[$ - 1..$] == "sh")))
  return word + "es";
endif
return word + "s";
.
