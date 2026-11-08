@verb object_tests:test_ancestors this none none rxd
@program object_tests:test_ancestors
tree = this:make_tree();
if (typeof(tree) != LIST || length(tree) != 4)
  return "create/chparent failed";
endif
{root, a, b, c} = tree;
r = 1;
an = `$object_utils:ancestors(c) ! ANY => 0';
rc = `$root_class ! ANY => #-1';
if (typeof(an) != LIST)
  r = "ancestors type => " + toliteral(an);
elseif (!(a in an) || !(root in an) || !(rc in an))
  r = "ancestors missing parent => " + toliteral(an);
else
  if (c in an)
    r = "ancestors includes self => " + toliteral(an);
  else
    bi = `ancestors(c) ! ANY => 0';
    if (an != bi)
      r = "ancestors wrap mismatch " + toliteral(an) + " vs " + toliteral(bi);
    endif
  endif
endif
this:recycle_all(c, a, b, root);
return r;
.
