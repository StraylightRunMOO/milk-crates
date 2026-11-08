@verb string_utils:from_ASCII this none this rxd
@program string_utils:from_ASCII
// $string_utils:from_ASCII(code) => STR
// ASCII code 32..126 to a one-character string. 65 => "A".
code = args[1];
return this.ascii[code - 31];
.
