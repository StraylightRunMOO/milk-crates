@verb object_tests:test_descendants this none none rxd
@program object_tests:test_descendants
tree = this:make_tree();
if (typeof(tree) != LIST || length(tree) != 4)
  return "create/chparent failed";
endif
{root, a, b, c} = tree;
r = 1;
d = `$object_utils:descendants(root) ! ANY => 0';
if (typeof(d) != LIST)
  r = "descendants type => " + toliteral(d);
elseif (!(a in d) || !(b in d) || !(c in d))
  r = "descendants missing child => " + toliteral(d);
else
  if (root in d)
    r = "descendants includes self => " + toliteral(d);
  else
    bi = `descendants(root) ! ANY => 0';
    if (d != bi)
      r = "descendants wrap mismatch " + toliteral(d) + " vs " + toliteral(bi);
    endif
  endif
endif
if (r == 1)
  alias = `$object_utils:descendents(root) ! ANY => 0';
  if (alias != d)
    r = "descendents alias => " + toliteral(alias);
  endif
endif
if (r == 1)
  lf = `$object_utils:leaves(root) ! ANY => 0';
  if (typeof(lf) != LIST || !(b in lf) || !(c in lf) || a in lf || root in lf)
    r = "leaves => " + toliteral(lf);
  endif
endif
if (r == 1)
  br = `$object_utils:branches(root) ! ANY => 0';
  if (typeof(br) != LIST || !(root in br) || !(a in br) || b in br || c in br)
    r = "branches => " + toliteral(br);
  endif
endif
if (r == 1)
  od = `$object_utils:ordered_descendants(root) ! ANY => 0';
  if (typeof(od) != LIST || !(root in od) || !(a in od) || !(b in od) || !(c in od))
    r = "ordered_descendants membership => " + toliteral(od);
  elseif (od[1] != root)
    r = "ordered_descendants self first => " + toliteral(od);
  endif
endif
this:recycle_all(c, a, b, root);
return r;
.
