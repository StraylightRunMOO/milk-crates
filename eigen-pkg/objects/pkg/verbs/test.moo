@verb pkg:test this none none rxd
@program pkg:test
// $pkg:test(name [, opts]) => MAP
// Run PACKAGE.json "test" hook. Companion packs install, run, then recycle unless keep.
// snap_plan may fail on missing parents before deps are installed; still read the hook.
name = tostr(args[1]);
opts = length(args) >= 2 && typeof(args[2]) == MAP ? args[2] | [];
if (name == "all" || name == "*")
  results = [];
  for n in (this.catalog)
    r = this:test(n, opts);
    results[n] = r;
    if (!r["ok"])
      return ["ok" -> 0, "name" -> n, "failed" -> results];
    endif
  endfor
  return ["ok" -> 1, "results" -> results];
endif
plan = `snap_plan(name, ["cored" -> 1]) ! ANY => 0';
if (typeof(plan) != MAP)
  return ["ok" -> 0, "errors" -> {"unknown pack: " + name}];
endif
spec = `plan["test"] ! ANY => ""';
if (typeof(spec) != STR || !spec)
  if (!plan["ok"])
    return plan;
  endif
  return ["ok" -> 1, "name" -> name, "skipped" -> 1, "reason" -> "no test hook"];
endif
if (index(spec, ":") || spec[1] == "$")
  r = this:invoke(spec);
  if (typeof(r) != MAP)
    r = ["ok" -> r ? 1 | 0, "result" -> r];
  endif
  r["name"] = name;
  r["skipped"] = 0;
  return r;
endif
already = `$eigen_packages ! ANY => []';
had = 0;
if (typeof(already) == MAP)
  had = `already[spec] ! ANY => 0';
endif
if (!had)
  ir = this:install(spec);
  if (!ir["ok"])
    return ir;
  endif
endif
tplan = `snap_plan(spec, ["cored" -> 1]) ! ANY => 0';
run = "";
if (typeof(tplan) == MAP)
  run = `tplan["run"] ! ANY => ""';
endif
if (typeof(run) != STR || !run)
  acts = typeof(tplan) == MAP ? `tplan["actions"] ! ANY => {}' | {};
  if (typeof(acts) == LIST && acts)
    id = `acts[1]["cored"] ! ANY => ""';
    if (!id)
      id = `acts[1]["id"] ! ANY => ""';
    endif
    if (id)
      run = tostr(id) + ":run";
    endif
  endif
endif
if (!run)
  return ["ok" -> 0, "name" -> name, "errors" -> {"no run hook on " + spec}];
endif
rr = this:invoke(run);
if (typeof(rr) != MAP)
  rr = ["ok" -> rr ? 1 | 0, "result" -> rr];
endif
if (!maphaskey(rr, "ok"))
  rr["ok"] = !`rr["failed"] ! ANY => 0';
endif
keep = `opts["keep"] ! ANY => 0';
removed = 0;
if (!had && !keep)
  this:remove(spec, ["recycle" -> 1]);
  removed = 1;
endif
rr["name"] = name;
rr["companion"] = spec;
rr["removed"] = removed;
rr["skipped"] = 0;
return rr;
.
