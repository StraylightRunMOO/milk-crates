@verb string_utils:to_ASCII this none this rxd
@program string_utils:to_ASCII
// $string_utils:to_ASCII(char) => INT
// One-character string to ASCII code. "A" => 65. Missing char raises E_INVARG.
return (index(this.ascii, args[1], 1) || raise(E_INVARG)) + 31;
.
