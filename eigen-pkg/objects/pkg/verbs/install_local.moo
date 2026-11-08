@verb pkg:install_local this none none rxd
@program pkg:install_local
// $pkg:install_local
// install_local(name [, opts] [, stack] [, extra]) — snap_apply with depends.
name = tostr(args[1]);
opts = length(args) >= 2 && typeof(args[2]) == MAP ? args[2] | [];
stack = length(args) >= 3 && typeof(args[3]) == LIST ? args[3] | {};
extra = length(args) >= 4 && typeof(args[4]) == MAP ? args[4] | [];
snapopts = ["cored" -> 1];
if (name in stack)
  return ["ok" -> 1, "name" -> name, "skipped" -> 1];
endif
plan = `snap_plan(name, snapopts) ! ANY => 0';
if (typeof(plan) != MAP)
  return ["ok" -> 0, "errors" -> {"unknown pack: " + name}];
endif
deps = `plan["depends"] ! ANY => {}';
if (typeof(deps) != LIST)
  deps = {};
endif
g = `$generic_utils ! ANY => #-1';
if (name != "generic-utils" && index(name, "utils") && !("generic-utils" in deps) && !valid(g))
  deps = {"generic-utils", @deps};
endif
already = `$eigen_packages ! ANY => 0';
next = {@stack, name};
for d in (deps)
  if (d == name || d in next)
    // skip cycle
  else
    have = 0;
    if (typeof(already) == MAP)
      have = `already[d] ! ANY => 0' || `already[strsub(d, "-", "_")] ! ANY => 0';
    endif
    if (!have && !valid(`#0.(strsub(d, "-", "_")) ! ANY => #-1'))
      r = this:install(d, ["stack" -> next]);
      if (!r["ok"])
        return r;
      endif
      already = `$eigen_packages ! ANY => 0';
    endif
  endif
endfor
r = snap_apply(name, snapopts);
if (typeof(r) == MAP && r["ok"] && extra)
  key = `opts["name"] ! ANY => 0';
  if (typeof(key) != STR || !key)
    key = `r["name"] ! ANY => name';
  endif
  this:record(key, extra);
endif
return r;
.
