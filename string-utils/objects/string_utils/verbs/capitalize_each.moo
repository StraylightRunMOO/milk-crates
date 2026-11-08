@verb string_utils:capitalize_each this none this rxd
@program string_utils:capitalize_each
// $string_utils:capitalize_each(string [, ignore_words [, always_capitalize_first]]) => STR
// Capitalize each word. ignore_words stay lowercase unless first and always_capitalize_first.
{string, ?ignore_words = {}, ?always_capitalize_first = 1} = args;
words = $string_utils:words(string);
for x in [1..length(words)]
  if (!(words[x] in ignore_words) || (x == 1 && always_capitalize_first))
    words[x] = $string_utils:capitalize(words[x]);
  endif
endfor
return $string_utils:from_list(words, " ");
.
