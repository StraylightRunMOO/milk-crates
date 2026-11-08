@verb match_tests:test_match_nth this none none rxd
@program match_tests:test_match_nth
failed = `$failed_match ! ANY => #-3';
miss = `$match_utils:match_nth("axe", {$match_utils}, 1) ! ANY => 0';
if (miss != failed && typeof(miss) != OBJ)
  return "no-alias => " + toliteral(miss);
endif
a = this:make_alias_obj("axe", {"axe", "weapon"});
b = this:make_alias_obj("hatchet", {"axe"});
r = 1;
if (typeof(a) == OBJ && valid(a) && typeof(b) == OBJ && valid(b))
  got = `$match_utils:match_nth("axe", {a, b}, 1) ! ANY => 0';
  if (got != a)
    r = "first => " + toliteral(got);
  endif
  if (r == 1)
    got = `$match_utils:match_nth("axe", {a, b}, 2) ! ANY => 0';
    if (got != b)
      r = "second => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match_nth("axe", {a, b}, 3) ! ANY => 0';
    if (got != failed)
      r = "third => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match_nth("weapon", {a, b}, 1) ! ANY => 0';
    if (got != a)
      r = "weapon => " + toliteral(got);
    endif
  endif
else
  `add_property(this, "aliases", {"axe"}, {caller_perms(), "rc"}) ! ANY => 0';
  `this.aliases = {"axe"} ! ANY => 0';
  if (`this.aliases ! ANY => 0' == {"axe"})
    got = `$match_utils:match_nth("axe", {this}, 1) ! ANY => 0';
    if (got != this)
      r = "stand-in first => " + toliteral(got);
    endif
    if (r == 1)
      got = `$match_utils:match_nth("axe", {this}, 2) ! ANY => 0';
      if (got != failed)
        r = "stand-in second => " + toliteral(got);
      endif
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
