@verb pkg:remove this none none rxd
@program pkg:remove
// $pkg:remove
// remove(name [, opts]) — un-corify. Never recycle objects with children outside the pack.
// opts["recycle"] -> 1 recycles pack objects when every child is in the pack.
name = tostr(args[1]);
opts = length(args) >= 2 && typeof(args[2]) == MAP ? args[2] | [];
pkgs = `$eigen_packages ! ANY => []';
if (typeof(pkgs) != MAP || !maphaskey(pkgs, name))
  return ["ok" -> 0, "errors" -> {"not installed: " + name}];
endif
rec = pkgs[name];
reloc = typeof(rec) == MAP ? `rec["relocation"] ! ANY => []' | [];
objs = {};
if (typeof(reloc) == MAP)
  for v, k in (reloc)
    if (typeof(v) == OBJ)
      objs = setadd(objs, v);
    endif
  endfor
endif
uncored = {};
for p in (`properties(#0) ! ANY => {}')
  if (p != "eigen_packages")
    v = `#0.(p) ! ANY => 0';
    if (typeof(v) == OBJ && v in objs)
      `delete_property(#0, p) ! ANY => 0';
      uncored = {@uncored, p};
    endif
  endif
endfor
external = {};
for o in (objs)
  if (valid(o))
    for c in (`children(o) ! ANY => {}')
      if (!(c in objs))
        external = setadd(external, c);
      endif
    endfor
  endif
endfor
recycled = {};
if (`opts["recycle"] ! ANY => 0')
  if (external)
    return ["ok" -> 0, "errors" -> {"has children outside the pack"}, "children" -> external, "uncored" -> uncored];
  endif
  for o in (objs)
    if (valid(o))
      `recycle(o) ! ANY => 0';
      recycled = {@recycled, o};
    endif
  endfor
endif
$eigen_packages = mapdelete(pkgs, name);
return ["ok" -> 1, "name" -> name, "uncored" -> uncored, "recycled" -> recycled, "kept_children" -> external];
.
