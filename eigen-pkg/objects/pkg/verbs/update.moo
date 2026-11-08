@verb pkg:update this none none rxd
@program pkg:update
// $pkg:update
// update(name [, opts]) — git_ff_pull the crate clone, then snap_apply the subdir.
name = tostr(args[1]);
opts = length(args) >= 2 && typeof(args[2]) == MAP ? args[2] | [];
pkgs = `$eigen_packages ! ANY => []';
rec = typeof(pkgs) == MAP ? `pkgs[name] ! ANY => 0' | 0;
path = typeof(rec) == MAP ? `rec["path"] ! ANY => name' | name;
if (typeof(path) != STR || !path)
  path = name;
endif
subdir = typeof(rec) == MAP ? `rec["subdir"] ! ANY => 0' | 0;
apply = path;
if (typeof(subdir) == STR && subdir)
  apply = path + "/" + subdir;
endif
if (this:has_git())
  h = `call_function("git_open", path) ! ANY => 0';
  if (typeof(h) == INT)
    r = `call_function("git_ff_pull", h) ! ANY => 0';
    `call_function("git_close", h) ! ANY => 0';
    if (typeof(r) != MAP)
      return ["ok" -> 0, "errors" -> {tostr("git_ff_pull: ", r)}];
    endif
    if (!r["ok"])
      return r;
    endif
    extra = ["path" -> path];
    if (typeof(subdir) == STR && subdir)
      extra["subdir"] = subdir;
    endif
    if (maphaskey(r, "head"))
      extra["head"] = r["head"];
    endif
    if (typeof(rec) == MAP && maphaskey(rec, "origin"))
      extra["origin"] = rec["origin"];
    endif
    return this:install_local(apply, opts, {}, extra);
  endif
endif
return this:install_local(name, opts, {});
.
