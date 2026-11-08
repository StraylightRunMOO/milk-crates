@verb string_utils:a_or_an this none this rxd
@program string_utils:a_or_an
// $string_utils:a_or_an(noun) => STR
// "a" or "an". player:a_or_an overrides unless it returns 0.
noun = args[1];
if ($object_utils:has_verb(player, "a_or_an") && (custom_result = player:a_or_an(noun)) != 0)
  return custom_result;
endif
if (noun in this.use_article_a)
  return "a";
endif
if (noun in this.use_article_an)
  return "an";
endif
a_or_an = "a";
if (noun != "")
  if (index("aeiou", noun[1]))
    a_or_an = "an";
    // unicycle, unimplemented, union, united, unimpressed, unique
    if (noun[1] == "u" && length(noun) > 2 && noun[2] == "n" && (index("aeiou", noun[3]) == 0 || (noun[3] == "i" && length(noun) > 3 && (index("aeioubcghqwyz", noun[4]) || (length(noun) > 4 && index("eiy", noun[5]))))))
      a_or_an = "a";
    endif
  endif
endif
return a_or_an;
// Ported by Mickey with minor tweaks from a Moo far far away.
// Last modified Sun Aug  1 22:53:07 1993 EDT by BabyBriar (#2).
.
