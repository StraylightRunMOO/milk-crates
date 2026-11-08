@verb match_tests:test_match_list this none none rxd
@program match_tests:test_match_list
nalias = `$match_utils:match_list("axe", {$match_utils}) ! ANY => 0';
if (typeof(nalias) != LIST)
  return "no-alias => " + toliteral(nalias);
endif
empty = `$match_utils:match_list("", {$match_utils}) ! ANY => 0';
if (empty != {})
  return "empty string => " + toliteral(empty);
endif
a = this:make_alias_obj("axe", {"axe", "weapon"});
b = this:make_alias_obj("hatchet", {"axe"});
r = 1;
if (typeof(a) == OBJ && valid(a) && typeof(b) == OBJ && valid(b))
  got = `$match_utils:match_list("axe", {a, b}) ! ANY => 0';
  if (got != {a, b})
    r = "both axes => " + toliteral(got);
  endif
  if (r == 1)
    got = `$match_utils:match_list("weapon", {a, b}) ! ANY => 0';
    if (got != {a})
      r = "weapon => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match_list("ax", {a}) ! ANY => 0';
    if (got != {a})
      r = "prefix => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match_list("axe", {a, a}) ! ANY => 0';
    if (got != {a})
      r = "unique => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match_list("zz", {a, b}) ! ANY => 0';
    if (got != {})
      r = "miss => " + toliteral(got);
    endif
  endif
else
  `add_property(this, "aliases", {"axe"}, {caller_perms(), "rc"}) ! ANY => 0';
  `this.aliases = {"axe"} ! ANY => 0';
  if (`this.aliases ! ANY => 0' == {"axe"})
    got = `$match_utils:match_list("axe", {this}) ! ANY => 0';
    if (got != {this})
      r = "stand-in => " + toliteral(got);
    endif
  endif
endif
if (typeof(a) == OBJ)
  `recycle(a) ! ANY => 0';
endif
if (typeof(b) == OBJ)
  `recycle(b) ! ANY => 0';
endif
return r;
.
