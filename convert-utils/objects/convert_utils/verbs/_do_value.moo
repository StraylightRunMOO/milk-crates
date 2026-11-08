@verb convert_utils:_do_value this none this rxd
@program convert_utils:_do_value
// $convert_utils:_do_value("n|d", value, top) => FLOAT
// Apply ratio n/d to value (or d/n if top is false). Not for callers.
{first, value, top} = args;
{numer, denom} = $string_utils:explode(first, "|");
return top ? value * tofloat(numer) / tofloat(denom) | value * tofloat(denom) / tofloat(numer);
.
