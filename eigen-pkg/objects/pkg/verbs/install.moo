@verb pkg:install this none none rxd
@program pkg:install
// $pkg:install
// install(spec [, opts_or_stack]) — catalog crate, sandbox path, or git URL.
// install("all") installs every name in this.catalog.
// Git URL clones this.registry-style repos into repos/cache/<repo> once.
// opts: name, dest, subdir, ref, branch, token, ssh_key, timeout, depth, bare, stack.
spec = tostr(args[1]);
opts = [];
stack = {};
if (length(args) >= 2)
  if (typeof(args[2]) == LIST)
    stack = args[2];
  elseif (typeof(args[2]) == MAP)
    opts = args[2];
    stack = `opts["stack"] ! ANY => {}';
    if (typeof(stack) != LIST)
      stack = {};
    endif
  endif
endif
if (spec == "all" || spec == "*")
  installed = {};
  for n in (this.catalog)
    r = this:install(n, opts);
    if (!r["ok"])
      return r;
    endif
    installed = {@installed, n};
  endfor
  return ["ok" -> 1, "installed" -> installed];
endif
if (this:is_url(spec))
  return this:install_git(spec, opts, stack);
endif
return this:install_local(spec, opts, stack);
.
