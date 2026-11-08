@verb string_utils:english_ordinal this none this rxd
@program string_utils:english_ordinal
// $string_utils:english_ordinal(n) => STR
// Integer to English ordinal. 1 => "first", 0 => "zeroth".
numb = toint(args[1]);
if (numb == 0)
  return "zeroth";
elseif (numb % 100)
  hundreds = abs(numb) > 100 ? this:english_number(numb / 100 * 100) + " " | (numb < 0 ? "negative " | "");
  numb = abs(numb) % 100;
  specials = {1, 2, 3, 5, 8, 9, 12, 20, 30, 40, 50, 60, 70, 80, 90};
  ordinals = {"first", "second", "third", "fifth", "eighth", "ninth", "twelfth", "twentieth", "thirtieth", "fortieth", "fiftieth", "sixtieth", "seventieth", "eightieth", "ninetieth"};
  if (i = numb in specials)
    return hundreds + ordinals[i];
  elseif (numb > 20 && (i = numb % 10 in specials))
    return hundreds + this:english_tens(numb / 10 * 10) + "-" + ordinals[i];
  else
    return hundreds + this:english_number(numb) + "th";
  endif
else
  return this:english_number(numb) + "th";
endif
.
