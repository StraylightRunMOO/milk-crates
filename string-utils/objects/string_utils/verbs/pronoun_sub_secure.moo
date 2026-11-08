@verb string_utils:pronoun_sub_secure this none this rxd
@program string_utils:pronoun_sub_secure
// $string_utils:pronoun_sub_secure(string [, who [, thing [, location]]], default) => STR
// :pronoun_sub, but if the result lacks who.name, sub default instead.
who = length(args) > 2 ? args[2] | player;
default = args[$];
result = this:pronoun_sub(@args[1..$ - 1]);
return this:index_delimited(result, who.name) ? result | this:pronoun_sub(@{default, @args[2..$ - 1]});
.
