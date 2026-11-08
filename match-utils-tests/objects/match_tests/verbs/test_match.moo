@verb match_tests:test_match this none none rxd
@program match_tests:test_match
nothing = `$nothing ! ANY => #-1';
failed = `$failed_match ! ANY => #-3';
ambiguous = `$ambiguous_match ! ANY => #-2';
m = `$match_utils:match("", {}) ! ANY => 0';
if (m != nothing)
  return "empty => " + toliteral(m);
endif
me = `$match_utils:match("me", {}) ! ANY => 0';
if (typeof(me) != OBJ)
  return "me => " + toliteral(me);
endif
here = `$match_utils:match("here", {}) ! ANY => 0';
if (typeof(here) != OBJ && here != 0)
  return "here => " + toliteral(here);
endif
lit = `$match_utils:match(tostr($match_utils), {}) ! ANY => 0';
if (valid($match_utils) && lit != $match_utils && lit != 0)
  return "literal => " + toliteral(lit);
endif
a = this:make_alias_obj("axe", {"axe", "weapon"});
b = this:make_alias_obj("axe", {"axe"});
r = 1;
if (typeof(a) == OBJ && valid(a) && typeof(b) == OBJ && valid(b))
  got = `$match_utils:match("axe", {a}) ! ANY => 0';
  if (got != a)
    r = "unique axe => " + toliteral(got);
  endif
  if (r == 1)
    got = `$match_utils:match("axe", {a, b}) ! ANY => 0';
    if (got != ambiguous)
      r = "ambiguous axe => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match("weapon", {a, b}) ! ANY => 0';
    if (got != a)
      r = "weapon => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match("second axe", {a, b}) ! ANY => 0';
    if (got != b)
      r = "second axe => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match("first axe", {a, b}) ! ANY => 0';
    if (got != a)
      r = "first axe => " + toliteral(got);
    endif
  endif
  if (r == 1)
    got = `$match_utils:match("nope", {a, b}) ! ANY => 0';
    if (got != failed)
      r = "nope => " + toliteral(got);
    endif
  endif
  if (r == 1)
    `a.aliases = {"box"} ! ANY => 0';
    `a.name = "box" ! ANY => 0';
    `move(b, a) ! ANY => 0';
    if (b in `a.contents ! ANY => {}')
      got = `$match_utils:match("box's axe", {a}) ! ANY => 0';
      if (got != b)
        r = "possessive => " + toliteral(got);
      endif
    endif
  endif
else
  `add_property(this, "aliases", {"axe"}, {caller_perms(), "rc"}) ! ANY => 0';
  `this.aliases = {"axe"} ! ANY => 0';
  if (`this.aliases ! ANY => 0' == {"axe"})
    got = `$match_utils:match("axe", {this}) ! ANY => 0';
    if (got != this)
      r = "stand-in axe => " + toliteral(got);
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
