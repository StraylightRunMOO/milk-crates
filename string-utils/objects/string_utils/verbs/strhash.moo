@verb string_utils:strhash this none this rxd
@program string_utils:strhash
// $string_utils:strhash(string) => STR
// 16-char hex XXH3 of tostr(string). Wraps xxhash().
return xxhash(tostr(args[1]));
.
