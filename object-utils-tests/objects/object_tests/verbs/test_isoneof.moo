@verb object_tests:test_isoneof this none none rxd
@program object_tests:test_isoneof
tree = this:make_tree();
if (typeof(tree) != LIST || length(tree) != 4)
  return "create/chparent failed";
endif
{root, a, b, c} = tree;
r = 1;
if (!$object_utils:isoneof(c, {root, b}))
  r = "isoneof(c, {root, b})";
elseif ($object_utils:isoneof(c, {b}))
  r = "isoneof(c, {b}) should be false";
else
  if (!$object_utils:isoneof(c, {c}))
    r = "isoneof self";
  elseif (!$object_utils:isoneof(a, {root}))
    r = "isoneof(a, {root})";
  else
    if ($object_utils:isoneof(b, {a, c}))
      r = "isoneof(b, {a, c}) should be false";
    endif
  endif
endif
this:recycle_all(c, a, b, root);
return r;
.
