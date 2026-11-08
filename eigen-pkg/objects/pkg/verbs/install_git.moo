@verb pkg:install_git this none none rxd
@program pkg:install_git
// $pkg:install_git
// install_git(url [, opts] [, stack]) — clone a crate repo, then snap_apply.
// Clones once into repos/cache/<repo> (or opts["dest"]). opts["subdir"] selects
// the crate inside a milk-crates catalog. Later crates from the same URL reuse the clone.
url = tostr(args[1]);
opts = length(args) >= 2 && typeof(args[2]) == MAP ? args[2] | [];
stack = length(args) >= 3 && typeof(args[3]) == LIST ? args[3] | {};
if (!this:has_git())
  return ["ok" -> 0, "errors" -> {"git_clone is not compiled in; cmake -DEIGENMOO_GIT=ON"}];
endif
`dump_database() ! ANY => 0';
repo = this:name_from_spec(url);
dest = `opts["dest"] ! ANY => 0';
if (typeof(dest) != STR || !dest)
  dest = "cache/" + repo;
endif
subdir = `opts["subdir"] ! ANY => 0';
if (typeof(subdir) == STR && subdir)
  subdir = this:safe_subdir(subdir);
  if (!subdir)
    return ["ok" -> 0, "errors" -> {"subdir must be a relative crate path with no .."}];
  endif
else
  subdir = "";
endif
copts = [];
for k in ({"branch", "token", "ssh_key", "timeout", "depth", "bare"})
  if (maphaskey(opts, k))
    copts[k] = opts[k];
  endif
endfor
ref = `opts["ref"] ! ANY => 0';
if (typeof(ref) == STR && ref && !maphaskey(copts, "branch"))
  copts["branch"] = ref;
endif
cloned = [];
h = `call_function("git_open", dest) ! ANY => 0';
if (typeof(h) == INT && h)
  `call_function("git_close", h) ! ANY => 0';
else
  cloned = `call_function("git_clone", url, dest, copts) ! ANY => 0';
  if (typeof(cloned) != MAP)
    return ["ok" -> 0, "errors" -> {tostr("git_clone: ", cloned)}];
  endif
  if (!cloned["ok"])
    return cloned;
  endif
endif
apply = subdir ? dest + "/" + subdir | dest;
extra = ["origin" -> url, "path" -> dest];
if (subdir)
  extra["subdir"] = subdir;
endif
if (typeof(cloned) == MAP && maphaskey(cloned, "head"))
  extra["head"] = cloned["head"];
endif
if (typeof(ref) == STR && ref)
  extra["ref"] = ref;
endif
return this:install_local(apply, opts, stack, extra);
.
