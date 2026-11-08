@verb string_utils:abbreviated_value this none this rxd
@program string_utils:abbreviated_value
// $string_utils:abbreviated_value(value [, max_reslen [, max_lstlev [, max_lstlen [, max_strlen [, max_toklen]]]]]) => STR
// Printed representation, truncated by the given length/depth limits (default $maxint).
{value, ?max_reslen = `$maxint ! ANY => 2147483647', ?max_lstlev = `$maxint ! ANY => 2147483647', ?max_lstlen = `$maxint ! ANY => 2147483647', ?max_strlen = `$maxint ! ANY => 2147483647', ?max_toklen = `$maxint ! ANY => 2147483647'} = args;
// Copied from Mickey (#52413):abbreviated_value Fri Sep  9 08:52:41 1994 PDT
return this:_abbreviated_value(value, max_reslen, max_lstlev, max_lstlen, max_strlen, max_toklen);
// Originally written by Mickey.
.
