@verb match_tests:make_alias_obj this none this rxd
@program match_tests:make_alias_obj
// make_alias_obj(name, aliases) => OBJ|0. create() child with .aliases. Caller recycles.
{name, aliases} = args;
o = `create($root_class) ! ANY => 0';
if (typeof(o) != OBJ || !valid(o))
  o = `create(#-1) ! ANY => 0';
endif
if (typeof(o) != OBJ || !valid(o))
  return 0;
endif
`o.name = name ! ANY => 0';
who = caller_perms();
`add_property(o, "aliases", aliases, {who, "rc"}) ! ANY => 0';
`o.aliases = aliases ! ANY => 0';
if (`o.aliases ! ANY => 0' != aliases)
  `recycle(o) ! ANY => 0';
  return 0;
endif
return o;
.
