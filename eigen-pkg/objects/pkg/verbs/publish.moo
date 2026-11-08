@verb pkg:publish this none none rxd
@program pkg:publish
// $pkg:publish
// publish(objs, name [, opts]) — snap_dump, then git_init if needed, git_add + git_commit [+ git_push].
// opts: path, message, author, push, remote, exclude_props, cored.
{objs, name, ?opts = []} = args;
if (typeof(objs) != LIST || typeof(name) != STR)
  return ["ok" -> 0, "errors" -> {"publish({objs}, name [, opts])"}];
endif
if (typeof(opts) != MAP)
  opts = [];
endif
path = `opts["path"] ! ANY => name';
if (typeof(path) != STR || !path)
  path = name;
endif
dopts = ["cored" -> 1];
for k in ({"exclude_props", "cored"})
  if (maphaskey(opts, k))
    dopts[k] = opts[k];
  endif
endfor
d = `snap_dump(objs, path, dopts) ! ANY => 0';
if (typeof(d) != MAP)
  return ["ok" -> 0, "errors" -> {tostr("snap_dump: ", d)}];
endif
if (!d["ok"])
  return d;
endif
if (!this:has_git())
  return ["ok" -> 1, "dumped" -> 1, "path" -> path, "warning" -> "git not compiled in; commit on the host"];
endif
h = `call_function("git_open", path) ! ANY => 0';
if (typeof(h) != INT)
  h = `call_function("git_init", path) ! ANY => 0';
endif
if (typeof(h) != INT)
  return ["ok" -> 1, "dumped" -> 1, "path" -> path, "warning" -> "not a git repository; git_init failed"];
endif
ar = `call_function("git_add", h, {"."}) ! ANY => 0';
if (typeof(ar) != MAP || !ar["ok"])
  `call_function("git_close", h) ! ANY => 0';
  return typeof(ar) == MAP ? ar | ["ok" -> 0, "errors" -> {"git_add failed"}];
endif
msg = `opts["message"] ! ANY => 0';
if (typeof(msg) != STR || !msg)
  msg = "publish " + name;
endif
author = `opts["author"] ! ANY => 0';
if (typeof(author) == STR || typeof(author) == MAP)
  cr = `call_function("git_commit", h, msg, author) ! ANY => 0';
else
  cr = `call_function("git_commit", h, msg) ! ANY => 0';
endif
if (typeof(cr) != MAP || !cr["ok"])
  `call_function("git_close", h) ! ANY => 0';
  return typeof(cr) == MAP ? cr | ["ok" -> 0, "errors" -> {"git_commit failed"}];
endif
pr = 0;
if (`opts["push"] ! ANY => 0')
  remote = `opts["remote"] ! ANY => "origin"';
  pr = `call_function("git_push", h, tostr(remote)) ! ANY => 0';
endif
`call_function("git_close", h) ! ANY => 0';
out = ["ok" -> 1, "path" -> path, "dumped" -> 1, "committed" -> 1];
if (typeof(cr) == MAP && maphaskey(cr, "id"))
  out["head"] = cr["id"];
elseif (typeof(cr) == MAP && maphaskey(cr, "head"))
  out["head"] = cr["head"];
endif
if (typeof(pr) == MAP)
  out["pushed"] = pr["ok"];
  if (!pr["ok"])
    out["push_error"] = `pr["message"] ! ANY => "push failed"';
  endif
endif
return out;
.
