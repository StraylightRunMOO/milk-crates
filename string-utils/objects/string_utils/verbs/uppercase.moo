@verb string_utils:uppercase lowercase this none this rxd
@program string_utils:uppercase lowercase
// $string_utils:uppercase/lowercase(string) => STR
// Case fold. Dispatches on verb to uppercase() or lowercase().
s = args[1];
return verb == "uppercase" ? uppercase(s) | lowercase(s);
.
