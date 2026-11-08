@verb string_utils:incr_alpha this none this rxd
@program string_utils:incr_alpha
// $string_utils:incr_alpha(string [, alphabet]) => STR
// Next string in alphabet order. aaa => aab, aaz => aba, "" => "a", zzz => "aaaa".
{s, ?alphabet = this.alphabet} = args;
index = length(s);
if (!s)
  return alphabet[1];
elseif (s[$] == alphabet[$])
  return this:incr_alpha(s[1..index - 1], alphabet) + alphabet[1];
else
  t = index(alphabet, s[index]);
  return s[1..index - 1] + alphabet[t + 1];
endif
.
