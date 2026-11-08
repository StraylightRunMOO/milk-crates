@verb string_tests:test_words this none none rxd
@program string_tests:test_words
if ($string_utils:words("a b c") != {"a", "b", "c"})
  return "words";
endif
fw = $string_utils:first_word("  a b");
if (fw != {"a", "b"})
  return "first_word => " + toliteral(fw);
endif
if ($string_utils:first_word("   ") != {})
  return "first_word empty";
endif
ws = $string_utils:word_start("a b");
if (typeof(ws) != LIST || length(ws) != 2)
  return "word_start => " + toliteral(ws);
endif
return 1;
.
