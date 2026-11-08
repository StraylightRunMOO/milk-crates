@verb object_tests:test_isa this none none rxd
@program object_tests:test_isa
tree = this:make_tree();
if (typeof(tree) != LIST || length(tree) != 4)
  return "create/chparent failed";
endif
{root, a, b, c} = tree;
r = 1;
if (!isa(c, $root_class))
  r = "builtin isa(c, $root_class)";
elseif (!isa(c, root))
  r = "builtin isa(c, root)";
else
  if (isa(root, c))
    r = "builtin isa(root, c) should be false";
  elseif (!$object_utils:isa(c, $root_class))
    r = "$object_utils:isa(c, $root_class)";
  else
    if (!$object_utils:isa(c, root))
      r = "$object_utils:isa(c, root)";
    elseif (!$object_utils:isa(a, root))
      r = "$object_utils:isa(a, root)";
    else
      if ($object_utils:isa(b, a))
        r = "$object_utils:isa(b, a) should be false";
      elseif (!$object_utils:isa(c, {b, root}))
        r = "$object_utils:isa list hit";
      else
        if ($object_utils:isa(c, {b}))
          r = "$object_utils:isa list miss";
        elseif (!$object_utils:isa(c, c))
          r = "$object_utils:isa self";
        endif
      endif
    endif
  endif
endif
this:recycle_all(c, a, b, root);
return r;
.
